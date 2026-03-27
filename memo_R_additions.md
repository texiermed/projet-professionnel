# Nouvelles sections à intégrer

## Jointures de tables

En santé publique, tu croiseras toujours plusieurs tables : patients + résultats de labo, cas de maladie + communes, etc. La jointure = fusionner deux tables qui partagent une colonne commune.

### Les 3 jointures essentielles

| Jointure | Ce qu'elle garde |
|----------|-----------------|
| `left_join(x, y)` | Toutes les lignes de x + colonnes de y quand ça correspond |
| `inner_join(x, y)` | Seulement les lignes présentes dans les DEUX tables |
| `full_join(x, y)` | Tout, des deux côtés (NA si pas de correspondance) |

### Exemple concret
```r
# Table 1 : patients
patients <- data.frame(
  patient_id = c(1, 2, 3, 4),
  age = c(52, 67, 43, 71),
  commune_code = c("31555", "31555", "09122", "31088")
)

# Table 2 : communes
communes <- data.frame(
  commune_code = c("31555", "31088", "09122"),
  nom_commune = c("Toulouse", "Colomiers", "Foix"),
  region = c("Occitanie", "Occitanie", "Occitanie")
)

# Jointure : ajouter le nom de commune à chaque patient
patients_complets <- patients |>
  left_join(communes, by = "commune_code")

patients_complets
#   patient_id age commune_code nom_commune    region
# 1          1  52        31555    Toulouse Occitanie
# 2          2  67        31555    Toulouse Occitanie
# 3          3  43        09122        Foix Occitanie
# 4          4  71        31088   Colomiers Occitanie
```

- `by = "commune_code"` : la colonne commune aux deux tables
- `left_join` : garde tous les patients, même si leur commune n'est pas dans la table communes (→ NA)
- Si une colonne a le même nom dans les deux tables (autre que `by`), R ajoute `.x` et `.y` pour les distinguer

> C'est l'équivalent du `LEFT JOIN` en SQL.

---

## Dates avec lubridate

En surveillance épidémiologique, les dates sont partout : date de symptômes, date de déclaration, semaines épidémiologiques.

### Charger lubridate
```r
library(lubridate)    # inclus dans tidyverse
```

### Convertir du texte en date
R ne comprend pas automatiquement que "25/03/2026" est une date. Il faut lui dire le format.
```r
# Format français : jour/mois/année
dmy("25/03/2026")          # → "2026-03-25"
dmy("25 mars 2026")        # → fonctionne aussi

# Format international : année-mois-jour
ymd("2026-03-25")          # → "2026-03-25"

# Format américain : mois/jour/année
mdy("03/25/2026")          # → "2026-03-25"
```
Retiens : `dmy` = **d**ay-**m**onth-**y**ear, `ymd` = **y**ear-**m**onth-**d**ay.

### Extraire des composants
```r
date <- dmy("25/03/2026")
year(date)      # 2026
month(date)     # 3
day(date)       # 25
wday(date, label = TRUE)    # mar (mardi)
week(date)      # numéro de semaine
```

### Calculer un délai
```r
# Exemple : délai entre symptômes et déclaration
cas <- data.frame(
  date_symptomes = dmy(c("10/03/2026", "15/03/2026", "20/03/2026")),
  date_declaration = dmy(c("12/03/2026", "18/03/2026", "21/03/2026"))
)

cas <- cas |>
  mutate(delai_jours = as.numeric(date_declaration - date_symptomes))

cas$delai_jours    # 2, 3, 1
```

### Arrondir à la semaine (pour les courbes épidémiques)
```r
cas <- cas |>
  mutate(semaine = floor_date(date_symptomes, "week"))
```
`floor_date(date, "week")` arrondit la date au lundi de sa semaine. Utile pour regrouper les cas par semaine dans un graphique.

### Piège
Le format français (jour/mois) est l'inverse du format américain (mois/jour). Si tes dates sont dans un CSV, vérifie toujours le format avant de convertir. `01/03/2026` = 1er mars en français, 3 janvier en américain.

---

## Import Excel et reformatage

### Import Excel
En ARS, la majorité des fichiers arrivent en `.xlsx`, pas en `.csv`.
```r
# install.packages("readxl")
library(readxl)

donnees <- read_excel("fichier.xlsx")                  # première feuille
donnees <- read_excel("fichier.xlsx", sheet = 2)       # deuxième feuille
donnees <- read_excel("fichier.xlsx", sheet = "Données") # par nom de feuille
```

### Nettoyer les noms de colonnes
Les fichiers Excel ont souvent des noms de colonnes avec des espaces, accents, parenthèses.
```r
# install.packages("janitor")
library(janitor)
donnees <- donnees |> clean_names()
# "Nb de Cas Confirmés (2024)" → "nb_de_cas_confirmes_2024"
```

### Reformater : pivot_longer et pivot_wider

Les données de surveillance arrivent souvent en format **large** (une colonne par semaine) :

| commune | sem_01 | sem_02 | sem_03 |
|---------|--------|--------|--------|
| Toulouse | 5 | 8 | 3 |
| Foix | 1 | 2 | 0 |

Pour ggplot2, tu as besoin du format **long** (une ligne par observation) :

| commune | semaine | cas |
|---------|---------|-----|
| Toulouse | sem_01 | 5 |
| Toulouse | sem_02 | 8 |
| ... | ... | ... |

```r
library(tidyr)    # inclus dans tidyverse

# Large → Long
donnees_long <- donnees |>
  pivot_longer(
    cols = starts_with("sem_"),     # colonnes à pivoter
    names_to = "semaine",           # nom de la nouvelle colonne "catégorie"
    values_to = "cas"               # nom de la nouvelle colonne "valeur"
  )

# Long → Large (l'inverse)
donnees_large <- donnees_long |>
  pivot_wider(
    names_from = semaine,           # colonne qui deviendra les noms de colonnes
    values_from = cas               # colonne qui deviendra les valeurs
  )
```

---

## Vérifier les conditions d'application (ajout Tests statistiques)

### Test de normalité
Avant un test paramétrique (t-test, ANOVA), vérifier la normalité :
```r
shapiro.test(patients$age)
# p >= 0.05 → normalité non rejetée → test paramétrique OK
# p < 0.05 → distribution non normale → test non paramétrique

# Vérification visuelle : QQ-plot
qqnorm(patients$age)
qqline(patients$age)    # les points doivent suivre la droite
```

### Comparaisons multiples
Plusieurs tests sur les mêmes données → risque de faux positifs gonflé. Avec 20 tests à α = 5%, tu as ~64% de chance d'avoir au moins 1 faux positif.
```r
p_values <- c(0.03, 0.12, 0.04, 0.001, 0.08)
p.adjust(p_values, method = "bonferroni")    # correction stricte
p.adjust(p_values, method = "BH")            # Benjamini-Hochberg (recommandée)
```
Dans la thèse : préciser que les sous-groupes sont **exploratoires** et mentionner si une correction a été appliquée.

### OR vs Risque Relatif (RR)
| | **OR** | **RR** |
|---|---|---|
| Formule | odds exposés / odds non-exposés | risque exposés / risque non-exposés |
| Quand | Cas-témoins, régression logistique | Cohorte, essais |
| Interprétation | Approxime le RR si événement rare (< 10%) | Directement interprétable |
| Piège | Surestime l'association si événement fréquent | Pas calculable en cas-témoins |

---

## Vérifier le modèle logistique (ajout Régression)

```r
# 1. Multicolinéarité : les X sont-elles trop corrélées entre elles ?
# install.packages("car")
library(car)
vif(modele)    # VIF > 5 → problème, retirer une variable

# 2. Courbe ROC : le modèle discrimine-t-il bien les cas des non-cas ?
# install.packages("pROC")
library(pROC)
predictions <- predict(modele, type = "response")
roc_result <- roc(patients$risque_eleve, predictions)
auc(roc_result)        # 0.5 = hasard, 0.7-0.8 = acceptable, > 0.8 = bon
plot(roc_result)       # visualiser la courbe ROC

# IC 95% de l'AUC (pour la thèse)
ci.auc(roc_result)
```
- **AUC** = Area Under the Curve = capacité du modèle à distinguer les cas des non-cas
- Rapporter dans la thèse : "L'AUC du modèle était de 0.78 (IC 95% : 0.71 - 0.85)"

---

## ANNEXE F — Glossaire épidémiologique

Pour les entretiens ARS / Santé Publique France.

### Mesures de fréquence

| Terme | Définition | Exemple |
|-------|-----------|---------|
| **Prévalence** | Proportion de malades à un instant donné ("photo") | 5% de la population a du diabète aujourd'hui |
| **Incidence** | Nombre de **nouveaux** cas sur une période ("film") | 200 nouveaux cas de grippe cette semaine |
| **Taux d'incidence** | Incidence / population à risque / temps | 3.5 pour 100 000 personnes-années |
| **Létalité** | Décès / nombre de malades | Grippe ~0.1%, Ebola ~50% |
| **Mortalité** | Décès / population totale / temps | 9.1 pour 1 000 habitants par an |

### Mesures d'association

| Terme | Définition | Étude |
|-------|-----------|-------|
| **Risque Relatif (RR)** | Risque exposés / risque non-exposés | Cohorte, essais |
| **Odds Ratio (OR)** | Odds exposés / odds non-exposés | Cas-témoins, régression logistique |
| **Risque Attribuable (RA)** | Risque exposés - risque non-exposés | Impact de l'exposition |
| **NNT** | 1 / RA = nombre à traiter pour éviter 1 cas | Utilité clinique |

### Types d'études (du plus faible au plus fort niveau de preuve)

1. **Étude transversale** (Predict-R est ici) — mesure à un instant donné. Donne des prévalences et des OR. Pas de causalité.
2. **Étude cas-témoins** — part des malades, cherche les expositions passées. Rétrospective. Donne des OR.
3. **Étude de cohorte** — part des exposés, suit dans le temps. Prospective. Donne des RR et des incidences.
4. **Essai contrôlé randomisé (ECR)** — gold standard. Randomisation élimine les facteurs de confusion. Donne des RR.
5. **Méta-analyse** — synthèse de plusieurs études. Plus haut niveau de preuve.

### Les 3 grands biais

| Biais | Définition | Exemple | Solution |
|-------|-----------|---------|---------|
| **Sélection** | L'échantillon ne représente pas la population | Ne recruter qu'en consultation → manque les asymptomatiques | Recrutement exhaustif, randomisation |
| **Classement** | Erreur de mesure de l'exposition ou de la maladie | Patient qui oublie son exposition (biais de mémorisation) | Mesures objectives, questionnaires validés |
| **Confusion** | Un 3ème facteur influence l'exposition ET la maladie | Café associé au cancer du poumon → parce que les fumeurs boivent plus de café | Ajustement (régression), stratification |

### Facteur de confusion
Un facteur de confusion est une variable qui :
1. Est associée à l'exposition
2. Est un facteur de risque de la maladie
3. N'est PAS une conséquence de l'exposition
→ C'est pour ça qu'on fait de la régression **multivariable** : pour ajuster sur les facteurs de confusion.

### Critères de causalité (Bradford Hill, 1965)
1. **Force** de l'association (OR/RR élevé)
2. **Cohérence** (retrouvée dans d'autres études)
3. **Temporalité** (exposition précède la maladie — seul critère obligatoire)
4. **Gradient dose-réponse** (plus on est exposé, plus le risque augmente)
5. **Plausibilité biologique**
6. **Spécificité**, **Analogie**, **Réversibilité**

### Grilles de lecture d'articles
- **STROBE** : études observationnelles (cohorte, cas-témoins, transversal)
- **CONSORT** : essais randomisés
- **STARD** : études diagnostiques (directement lié à Predict-R)
- **PRISMA** : revues systématiques et méta-analyses

---

## ANNEXE G — Bases mathématiques

### La loi normale (Gauss)
La distribution en cloche. La plupart des mesures biologiques la suivent (taille, poids, DFG...).

Propriétés :
- Symétrique autour de la moyenne (μ)
- **Règle 68-95-99.7** : 68% dans [μ-σ, μ+σ], 95% dans [μ-2σ, μ+2σ], 99.7% dans [μ-3σ, μ+3σ]
- μ = moyenne, σ = écart-type

### Variance et écart-type
- **Variance** = moyenne des carrés des écarts à la moyenne → mesure la dispersion
- **Écart-type (SD)** = racine carrée de la variance → même unité que les données
- En R : `var(x)` et `sd(x)`
- Si SD = 12 pour un âge moyen de 65 → ~68% des patients ont entre 53 et 77 ans

### Le théorème central limite
"La moyenne d'un échantillon suffisamment grand (n > 30) suit une loi normale, quelle que soit la distribution d'origine."
- Justifie l'utilisation des tests paramétriques même sur des données pas parfaitement normales
- Plus n est grand, meilleure est l'approximation

### Degrés de liberté (df)
= nombre d'informations indépendantes dans le calcul.
- Pour une moyenne : df = n - 1
- Pour un Chi2 (r lignes, c colonnes) : df = (r-1)(c-1)
- Pour un Chi2 de tendance : df = 1
- Moins de df → test plus puissant pour détecter ce qu'il cherche

### Intervalle de confiance — construction
Formule générale : IC 95% = estimation ± 1.96 × erreur standard
- Moyenne : x̄ ± 1.96 × (SD / √n)
- OR : exp(ln(OR) ± 1.96 × SE)
- Le 1.96 = quantile 97.5% de la loi normale standard

Interprétation rigoureuse : "Si on répétait l'étude 100 fois, 95 des IC contiendraient la vraie valeur." (et non "95% de chance que la vraie valeur soit dedans")

### Puissance statistique
- **Puissance (1-β)** = probabilité de détecter un effet qui existe
- Puissance standard : 80% (on accepte 20% de risque de rater un vrai effet)
- Dépend de : taille d'échantillon, taille de l'effet, seuil α, variabilité
```r
# install.packages("pwr")
library(pwr)
# Puissance pour un test de proportion (Predict-R)
pwr.p.test(h = ES.h(p1 = 0.15, p2 = 0.10),   # effet attendu vs H₀
           sig.level = 0.05,                     # alpha
           power = 0.80)                         # → donne n nécessaire
```
En entretien, on te demandera : "Comment avez-vous déterminé la taille de votre échantillon ?" → répondre avec la puissance, l'effet attendu et le seuil alpha.
