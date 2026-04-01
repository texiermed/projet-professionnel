# Progression — Formation Santé Publique

## Niveau actuel
- R : Phase 2 terminée, livret complet 2662 lignes (gtsummary + tests stats + ggplot2 avancé + R Markdown avancé + régression logistique + toutes analyses Predict-R + analyse de sensibilité)
- Épidémiologie : notions solides (tests stats, Se/Sp/VPP/VPN, régression logistique, Kappa, IC, p-value)
- SQL : aucun
- Git : bases (init, add, commit, push, branche, remote, .gitignore)
- Programmation générale : aucune expérience préalable
- Excel : basique

## Profil apprenant
- Pédagogie : guidé pas à pas au début, problèmes à résoudre quand plus à l'aise
- Langue : mixte FR/EN (prépare anglais SpFrance)
- Contrainte : burn-out sévère, rythme variable, sessions courtes (30-45 min max)
- Données Predict-R : disponibles après recueil mai 2026
- En attendant : données simulées ou données ouvertes françaises (Géodes, data.gouv)

## Sessions réalisées
- 2026-03-11 : Session 1 — Installation R + RStudio + premiers pas
  - R 4.5.2 installé, RStudio fonctionnel
  - Opérations arithmétiques, `sqrt()`
  - Strings et erreur guillemets (case-sensitive compris)
  - Variables (`<-`), vecteurs (`c()`)
  - Fonctions : `mean()`, `median()`, `length()`, `summary()`
  - Filtrage logique : `dfg < 60`, `sum()`, `mean()` sur logiques
  - Lien avec Predict-R : proportion = CJP
  - Scripts : premier script `01_premiers_pas.R`, encodage UTF-8 configuré
  - Tidyverse installé et chargé (`library(tidyverse)`)
  - Data frames : `data.frame()`, `$`, `glimpse()`
  - dplyr : `filter()`, `select()`, `arrange()`, `mutate()`, `count()`
  - Pipe `|>` : enchaîner les opérations
  - `group_by() |> summarise()` : statistiques par groupe (n, mean)
  - `case_when()` : créer des catégories (stades MRC à partir du DFG)
  - Tableau croisé : `count(risque_pr, sexe)`
  - Bonne vitesse d'apprentissage, comprend les concepts et lit les résultats cliniquement

  - Stocker un résultat : `patients <- patients |> mutate(...)`
  - ggplot2 : histogramme, barplot, boxplot, scatter plot
  - `aes()`, `fill` vs `color`, `scale_fill_manual()`, `scale_color_manual()`
  - `labs()` pour titres/axes, `theme_minimal()`
  - Boxplot âge par sexe réalisé en autonomie (sans aide)
  - Erreurs corrigées : typo `scale_file_manual`, guillemet manquant, `fill` vs `color` dans labs
- 2026-03-11 : Session 2 — CSV + facet_wrap + exercices autonomes
  - Créer et sauvegarder un CSV : `write.csv()`, `set.seed()`, `sample()`, `rnorm()`
  - Charger un CSV : `read_csv()` (workflow réel pour Predict-R)
  - Exercice semi-autonome réussi : count, group_by+summarise, boxplot sur 30 patients
  - `facet_wrap(~ variable)` : sous-panneaux par groupe
  - Barplot croisé sexe × risque avec facet
  - Erreur de parenthèse `))` vs `)` corrigée (classique ggplot)
  - Comprend la différence script vs console (quand utiliser chaque)
  - Autonomie croissante : construit des graphiques seul avec le mémo

- 2026-03-12 : Session 3 — R Markdown + données manquantes
  - Test de rétention réussi : relancé script session 1, tout compris sans aide
  - Répertoire de travail : `getwd()`, `setwd()`, `list.files()`, `/` vs `\`
  - R Markdown : structure `.Rmd`, en-tête YAML, blocs `{r}`, `include=FALSE`, Knit → HTML
  - Premier rapport `rapport_predict_r.Rmd` écrit à la main et fonctionnel
  - Résolution autonome : CSV introuvable → changé working directory + recréé le fichier sans aide
  - Données manquantes : `NA`, `na.rm = TRUE`, `is.na()`, `sum(is.na())`
  - Différence `summary()` vs `summarise()`
  - Erreur `groupe_by` (français) corrigée → `group_by` (anglais)
  - Erreur `rm.na` inversé → `na.rm`
  - Autonomie en hausse : débugue seul, pose des questions de fond

- 2026-03-12 : Session 4 — Données réelles + nettoyage + analyse par région
  - Dataset réel : espérance de vie par département (data.gouv.fr, 98 obs)
  - `rename()` par position (`= 1`, `= 2`) — contourner les noms avec accents/espaces
  - `names()` pour voir les noms exacts des colonnes
  - `separate()` : séparer "Région - Département" en 2 colonnes
  - `str_trim()` : nettoyer les espaces en trop après séparation
  - `arrange(desc())` : tri décroissant
  - `slice_min()` / `slice_max()` : trouver les extrêmes directement
  - `drop_na()` / `replace_na()` : gestion avancée des NA
  - Histogramme couleur fixe (`fill` dans `geom_*`, pas dans `aes`) — compris après plusieurs erreurs
  - Pipeline complet : `read_csv()` → `rename()` → `separate()` → `str_trim()` → `group_by()` → `summarise()` → `arrange(desc())`
  - Résultat : classement des régions par espérance de vie moyenne (Martinique #1, 83 ans)
  - Beaucoup d'erreurs de syntaxe mais persistance remarquable — corrige sans regarder la solution
  - Distinction couleur fixe vs couleur par variable : acquise

- 2026-03-12 : Session 5 — Exercice de synthèse Phase 1 (VALIDÉ)
  - Rapport R Markdown complet écrit quasi seul : `Rapport d'évaluation finale.Rmd`
  - Pipeline complet : setup → nettoyage (rename, separate, str_trim) → stats descriptives → histogramme → analyse par région → top/flop 5 → conclusion
  - Utilisation autonome du mémo comme seule référence
  - Erreurs résiduelles de syntaxe (virgule oubliée, `.csv` manquant, `setwd` sans guillemets) mais toutes corrigées seul
  - Seul blocage nécessitant aide : enchaîner `summarise() |> slice_max()` (nom de colonne après summarise)
  - **PHASE 1 TERMINÉE**

- 2026-03-13 → 2026-03-22 : Pause 1 semaine (vacances, EMDR, sport, amis)
  - Psychiatre + EMDR en parallèle
  - Ruminations/anxiété présentes mais gérées

- 2026-03-23 : Session 6 — Phase 2 début (gtsummary + tests stats)
  - `gtsummary` installé et maîtrisé : `tbl_summary()`, `by =`, `add_p()`, `add_overall()`
  - Personnalisation : `statistic` (mean/SD vs median/IQR), `label` (noms propres)
  - Comprend les tests choisis automatiquement : Kruskal-Wallis, Fisher exact, et pourquoi
  - Tableau 1 publication-ready en 2 lignes de code
  - Touches clavier AZERTY maîtrisées : `{` = AltGr+4, `|` = AltGr+6, `` ` `` = AltGr+7
  - Tests statistiques : t-test, Wilcoxon, Chi2, Fisher, Kruskal-Wallis — tous lancés et compris
  - Comprend quand choisir paramétrique vs non paramétrique et pourquoi
  - Comprend la lecture des résultats (p-value, IC, rangs vs moyennes)
  - CLAUDE.md mis à jour avec toutes les analyses Predict-R (CJP, Kappa, Se/Sp, sous-groupes)

- 2026-03-24 : Session 7 — ggplot2 avancé
  - Violin plot : `geom_violin()` + `geom_boxplot()` superposés, lecture de la forme
  - Density plot : `geom_density(alpha = 0.5)`, superposition de groupes, concept de densité
  - Barplot proportionnel : `position = "fill"` + `scales::percent`
  - `scale_fill_manual()` : couleurs personnalisées (vert/orange/rouge Predict-R)
  - Facettes : `facet_wrap(~ var)` et `facet_grid(lignes ~ colonnes)`
  - Thèmes : `theme_classic()`, `theme_bw()`, `theme_light()`, `theme_void()` — tous testés
  - Personnalisation : `element_text(size, face)`, `legend.position = "none"`
  - `alpha` (transparence), `width` (largeur boxplot)
  - Comprend quand utiliser chaque type de graphique
  - **Bloc ggplot2 avancé Phase 2 : TERMINÉ**
  - R Markdown avancé : en-tête YAML (toc, toc_float, number_sections, theme)
  - Chunks : `include=FALSE`, `echo=FALSE`, `message=FALSE`, `warning=FALSE`, `fig.width/fig.height`
  - `knitr::opts_chunk$set()` : options globales pour cacher code/messages dans le rapport final
  - Rapport complet kniité : table des matières flottante + gtsummary + violin plot
  - **Bloc R Markdown avancé Phase 2 : TERMINÉ**
  - Régression logistique : `glm(family = binomial)`, `summary()`, coefficients, p-values
  - `ifelse()` pour créer une variable binaire Y
  - `finalfit()` : tableau publication-ready avec OR univariable + multivariable + IC 95%
  - `or_plot()` : forest plot des OR
  - Comprend : OR, IC 95%, logit, odds, univariable vs multivariable, facteurs de confusion
  - Comprend les maths : logit(p) = β₀ + β₁×X, OR = e^β
  - `factor()` vs numérique : quand et pourquoi convertir
  - **Bloc régression logistique Phase 2 : TERMINÉ**

- 2026-03-25 : Session 8 — Analyses Predict-R (simulation complète)
  - CJP : proportion rattrapée + IC Wilson (`prop.test(correct = FALSE)`) + test binomial unilatéral (`binom.test`)
  - Comprend : H₀/H₁, unilatéral vs bilatéral, pourquoi binomial, IC Wilson vs Wald
  - Découverte du p-hacking par expérimentation → compris pourquoi c'est de la fraude
  - Kappa de Cohen : `irr::kappa2()`, concordance inter-évaluateurs, échelle Landis & Koch
  - Se, Sp, VPP, VPN : `epiR::epi.tests()`, tableau 2×2, réordonnancement `tab[c(2,1), c(2,1)]`
  - Comprend : gold standard, VPP dépend de la prévalence, Se/Sp intrinsèques au test
  - Taux de participation/complétion : proportions simples + IC Wilson
  - Satisfaction Likert : `tbl_summary(type = list(everything() ~ "continuous"))`, médiane (Q1, Q3)
  - Comprend : ordinal vs continu, pourquoi pas la moyenne pour du Likert
  - Analyses en sous-groupes : `tbl_summary(by = mrc_connue)`, `tbl_summary(by = tranche_age)`
  - `case_when()` + `factor(levels = ...)` pour créer et ordonner les tranches d'âge
  - Fisher qui plante avec gros tableaux → solution : `type = list(var ~ "continuous")`
  - Description d'un Tableau 1 : p globale + illustration groupes extrêmes
  - Chi2 de tendance (Cochran-Armitage) : `prop.trend.test()`, comparaison avec Chi2 classique
  - Comprend : df = 1 vs df = k-1, pourquoi l'ordre des catégories est crucial
  - Memo_R.md entièrement restructuré en "Livret R" avec sommaire, 3 parties, annexes, cours stats
  - **PHASE 2 — ANALYSES PREDICT-R : TERMINÉE**
  - **PHASE 2 COMPLÈTE**

- 2026-03-25 : Session 9 — Enrichissement livret R
  - Intégration des sections : Jointures (left_join, inner_join, full_join), Dates (lubridate), Import Excel (readxl, janitor, pivot)
  - Ajout normalité (Shapiro-Wilk, QQ-plot), comparaisons multiples (Bonferroni, BH), OR vs RR
  - Ajout vérification modèle logistique (VIF, courbe ROC/AUC)
  - Annexe F : Glossaire épidémiologique complet (mesures, biais, Bradford Hill, STROBE/STARD)
  - Annexe G : Bases mathématiques (loi normale, variance/SD, TCL, degrés de liberté, IC, puissance)
  - Livret R = 21 sections + 7 annexes, ~1840 lignes
  - PDF régénéré (Livret_R.pdf)
  - **Livret complet et autonome pour Phase 3**

- 2026-03-26 : Session 11 — Corrections finales livret + réorganisation plan
  - 12 corrections appliquées au livret (write_csv, TCL, IC Kappa, analyse de sensibilité, Quarto, tabyl, vocabulaire ARS, messages d'erreur)
  - Relecture par agent professeur : note 9/10
  - Section "Messages d'erreur fréquents" ajoutée (recommandation prof)
  - Vocabulaire ARS complet ajouté au glossaire (HCSP, MDO, signalement, cas index, taux d'attaque)
  - Analyse de sensibilité : nouvelle sous-section Predict-R avec 3 exemples
  - Plan de formation réorganisé en 8 checkpoints (technique + réseau obligatoire)
  - Livret R = 2662 lignes, 32 sections + 7 annexes enrichies
  - **Phase 2 terminée. Prochain : Checkpoint 1 (Git + contact Sicre-Gatimel)**

- 2026-03-27 : Session 12 — Checkpoint 1 : Git + GitHub
  - Git installé (v2.53) et configuré (user.name, user.email)
  - Concepts compris : repository, commit, branche, push, staging area
  - Repo initialisé (`git init`), `.gitignore` créé
  - Premier commit (15 fichiers, 4032 lignes)
  - Compte GitHub connecté via token (classic)
  - Repo poussé sur GitHub : github.com/texiermed/projet-professionnel
  - README.md créé et poussé (vitrine professionnelle)
  - Workflow maîtrisé : `git add` → `git commit -m "..."` → `git push`
  - Branche renommée master → main
  - Learn Git Branching : tutoriel complet (commit, branch, merge, rebase, HEAD, cherry-pick, reset/revert)
  - Section Git du livret enrichie (~100 lignes, vocabulaire + workflow + erreurs)

- 2026-03-31 : Session 13 — Checkpoint 1 : LinkedIn + Réseau ARS
  - Profil LinkedIn créé et optimisé pour la santé publique
  - Photo pro + badge #OpenToWork
  - Titre : "Médecin généraliste | Réorientation santé publique | Analyse de données (R, Git) | Thèse Predict-R"
  - Section "À propos" rédigée (fil narratif Predict-R + Ariège + SP)
  - 3 expériences : Doctorant Predict-R, MG remplaçant, Terr-e Covid-19
  - 9 compétences ajoutées (R, Biostatistiques, Git, Santé publique, Analyse des données...)
  - GitHub lié dans les coordonnées
  - Pages suivies : OMS, EHESP, Santé Publique France, ARS Occitanie, SFSP
  - 2 mails envoyés : DD31 Toulouse + DD09 Ariège (demande d'échange avec un médecin ARS)
  - Réponse DD09 : pas de médecin en Ariège, mail transféré à ARS Occitanie régionale
  - **CHECKPOINT 1 VALIDÉ** (technique + réseau)

- 2026-04-01 : Session 14 — Réseau SP + début Checkpoint 2
  - État des lieux complet des débouchés (ARS, CPAM, MDPH, HAS, SpFrance, MISP)
  - Réseau LinkedIn activé : 3 médecins SP contactés (Alice Vabre, Léonie Langanay, Rodney Plat)
  - Connexions pertinentes : Quentin Gicquel MD (SP, Paris-Sud), Aymeric Monégier du Sorbier (interne SP, M2 épidémio), Marie Pouquet (senior epidemiologist)
  - Contact Facebook : Léo Delbos (ami interne SP à Paris, ok pour discuter)
  - Dossier projet nettoyé (19 fichiers supprimés : photos, HTML, brouillons)
  - Dataset grippe Odissé chargé dans R (29 250 lignes, 8 colonnes, données OSCOUR 2020-2026)
  - Exploration : `count()` par région (18) et classe d'âge (5), `summary()`, ~890 NA identifiés
  - `as.Date()` pour convertir texte → date, `%in%` pour filtrer/exclure des listes
  - 4 graphiques produits :
    1. Courbe épidémique Occitanie (geom_line)
    2. Courbe moyenne nationale (group_by + summarise + mean)
    3. 18 régions superposées (color = Région, avec/sans DOM-TOM)
    4. Facettes par région métropole (facet_wrap + theme personnalisé)
  - Erreurs corrigées : guillemets dans aes() (texte vs colonne), "France entière" inexistant, hjust compris
  - Livret R mis à jour : geom_line, as.Date, %in%, table "quel graphique"

## Prochain checkpoint
**Checkpoint 2 — Premier projet données ouvertes :**
- [x] Télécharger un dataset Géodes grippe saisonnière ✅ (Odissé, passages urgences + SOS Médecins, régional)
- [ ] Nettoyer, analyser, visualiser dans R — **EN COURS** (4 graphiques faits, reste : Tableau 1 gtsummary, nettoyage NA, analyses par âge)
- [ ] Produire un rapport R Markdown complet
- [ ] Pousser le projet sur GitHub (premier projet visible)
- [x] Contacter 1+ médecin SP via LinkedIn ✅ (3 contactés + 1 ami SP)

## Points forts identifiés
- Formation médicale solide (raisonnement, rigueur, lecture d'articles)
- Thèse méthodologique en cours (Predict-R) — ancrage concret
- Intérêt pour l'éthique et la réflexion (positionnement différenciant)
- Motivé par un projet de carrière clair
- R acquis rapidement (Phase 1+2 en 11 sessions, partant de zéro)
- Livret R de haute qualité comme outil de révision

## Points à travailler
- Réseau SP : en construction (2 mails ARS + 3 messages LinkedIn SP + 1 ami interne SP)
- Git/GitHub : bases acquises, approfondir avec Learn Git Branching
- Culture SP institutionnelle : à renforcer (checkpoint 3)
- Gestion de l'énergie (adapter le rythme aux symptômes)
