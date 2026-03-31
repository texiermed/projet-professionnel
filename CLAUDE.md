# Projet Professionnel — Alexis Texier

## Contexte
Alexis, 29 ans, médecin généraliste (DES validé, licence de remplacement). Arrêt de travail burn-out sévère (suivi PEPSS Toulouse + psychiatre + psychologue). Thèse Predict-R en cours (CPP soumis 28/02/2026, séance CPP le 07/04/2026, recueil prévu mai 2026, soutenance visée fin 2026). Réorientation vers la santé publique.

## Parcours et atouts existants

### Mémoire de DES (soutenu 4 juillet 2025)
**"Soigner la complexité en Ariège : Réflexion autour du Plan Personnalisé de Coordination en Santé et sur la posture éthique en médecine générale"**
- Cas clinique complexe médico-psycho-sociale en zone sous-dotée (Ariège)
- Modélisation d'un PPCS pour une patiente avec intrication psychiatrique, sociale et médicale
- Analyse territoriale : densité médicale, accès CMP, pénurie de spécialistes, rôle des DAC
- Réflexion éthique appliquée : surinvestissement, autonomie du patient, éthique du care
- **Pertinence SP** : c'est un travail d'analyse de système de santé déguisé en mémoire de MG. Utile comme récit de candidature (coordination territoriale, PPCS, limites du système).

### Thèse Predict-R (en cours)
- Évaluation d'un autoquestionnaire numérique de dépistage du risque de MRC en soins primaires
- Design observationnel transversal, 56 variables, CJP = proportion de patients "rattrapés"
- Analyses prévues : Kappa pondéré (irr), Se/Sp/VPP/VPN (epiR), gtsummary, ggplot2, rmarkdown
- **La thèse = le terrain d'apprentissage R** — chaque analyse correspond à un item du plan de formation

### Fil narratif pour les candidatures SP
Predict-R + mémoire Ariège + réorientation = **comment améliorer le repérage et la coordination en soins primaires dans un système de santé défaillant**. C'est le fil rouge qui relie tout.

## Profil apprenant
- **Programmation : aucune expérience** (jamais codé, Excel basique)
- **Pédagogie : guidé au début, problèmes à résoudre quand plus à l'aise**
- **Langue : mixte FR/EN** (explications FR, termes techniques EN, ressources EN)
- **Contrainte burn-out : sessions courtes (30-45 min), rythme variable, pas de deadline**
- **Données Predict-R : pas avant mai 2026** → utiliser données simulées ou ouvertes en attendant

## Formation interactive
Utiliser `/formation` pour lancer une session de formation guidée. Le skill évalue où j'en suis et propose la prochaine étape concrète. Ma progression est suivie dans `progression.md`.

## Objectif
Construire un profil de médecin de santé publique : analyse de données (R), épidémiologie, éthique, visualisation, culture SP française. Être prêt à postuler sur des postes ARS / Santé Publique France / recherche. Long terme : santé publique et décision politique.

## Ce que les employeurs demandent réellement

### ARS (Médecin contractuel) — Accessible rapidement
- Diplôme de médecin ✅
- Surveillance épidémiologique
- Investigation d'alertes sanitaires
- Connaissance du système de santé français
- Capacité rédactionnelle

### Santé Publique France (CDI Épidémiologiste) — Cible moyen terme
- R avancé (obligatoire)
- Rmarkdown + Shiny
- SQL et bases de données
- GitLab
- Anglais lu/parlé/écrit
- Fondamentaux d'épidémiologie
- Rédaction scientifique

### Concours MISP — Option long terme
- Diplôme de médecin + diplôme ou expérience en SP
- Formation 8 mois EHESP Rennes après concours

---

## PLAN DE FORMATION

### Phase 1 — Socle R ✅ TERMINÉE (11-12 mars 2026)

Objectif : être autonome pour charger, nettoyer, explorer et visualiser des données dans R.

- [x] Installer R + RStudio
- [x] Découvrir l'interface RStudio (console, scripts, environnement, fichiers)
- [x] Premiers pas : variables, vecteurs, types de données, fonctions de base
- [x] dplyr : filter, select, mutate, arrange, summarise, group_by, count, case_when, rename, separate, slice_min/max
- [x] ggplot2 : histogramme, barplot, boxplot, scatter, couleurs, labels, facets
- [x] CSV : read_csv, write.csv, working directory
- [x] R Markdown : structure, blocs, Knit → HTML
- [x] NA : na.rm, is.na, drop_na, replace_na
- [x] Dataset réel : espérance de vie par département (data.gouv)
- [x] Exercice de synthèse : rapport R Markdown complet validé

### Phase 2 — R appliqué santé publique ✅ TERMINÉE (23-26 mars 2026)

Objectif : savoir produire les analyses de la thèse Predict-R et d'une étude épidémiologique standard.

#### Formation générale
- [x] gtsummary : tbl_summary, by, add_p, add_overall, statistic, label
- [x] Tests statistiques : Chi2, Fisher, t-test, Wilcoxon, Kruskal-Wallis, ANOVA (comprendre quand et pourquoi)
- [x] ggplot2 avancé : violin, density, barplot proportionnel, facettes, thèmes, couleurs manuelles
- [x] R Markdown avancé : rapport reproductible complet (toc, themes, chunks, options globales)
- [x] Régression logistique — glm(binomial), finalfit, or_plot, OR, IC 95%

#### Analyses spécifiques Predict-R
- [x] **CJP** : Proportion de rattrapés + IC 95% Wilson + test binomial unilatéral (H₀ : p ≤ 10%)
- [x] Kappa de Cohen — package irr (concordance Predict-R vs dépistage MG)
- [x] Se, Sp, VPP, VPN — package epiR (performance diagnostique exploratoire)
- [x] Tableau 1 descriptif par niveau de risque (vert/orange/rouge) — gtsummary
- [x] Taux de participation/complétion — calcul simple
- [x] Satisfaction Likert — médiane + IQR
- [x] Analyses en sous-groupes : MRC connue vs inconnue, par tranche d'âge, par nombre de FDR HAS
- [x] Chi2 de tendance (Cochran-Armitage) pour variables ordinales

#### Ressources Phase 2
- Epi R Handbook (entièrement en anglais)
- R4DS (en anglais)
- Articles scientifiques (Lancet, BMJ, Eurosurveillance)

---

### CHECKPOINTS — Phase 3+ (à son rythme, un par un)

> Chaque checkpoint = technique + réseau obligatoire. On ne passe au suivant que quand les deux sont faits.
> L'anglais se travaille naturellement via les ressources en anglais (Epi R Handbook, R4DS, R Graph Gallery).

---

#### CHECKPOINT 1 — Git + GitHub (rendre le travail visible)

**Technique :**
- [ ] Learn Git Branching — tutoriel interactif (learngitbranching.js.org, ~2h)
- [ ] Initialiser un repo Git dans le projet professionnel
- [ ] Enrichir la section Git du livret avec l'expérience acquise
- [ ] Créer un compte GitHub
- [ ] Pousser les scripts R et le livret sur GitHub

**Réseau OBLIGATOIRE :**
- [ ] Créer un **profil LinkedIn** orienté SP (si pas déjà fait)
- [ ] Contacter **1 médecin ARS ou médecin inspecteur SP** via LinkedIn — échange informel

> **Comment contacter un médecin ARS LinkedIn :**
> - Rechercher "médecin ARS Occitanie" ou "médecin inspecteur santé publique" sur LinkedIn
> - Envoyer une demande de connexion avec message court :
> - "Bonjour Dr [Nom], je suis médecin généraliste en cours de réorientation vers la santé publique. Je prépare une thèse sur le dépistage de la MRC en soins primaires (analyse R) et j'aimerais échanger sur votre expérience en ARS. Seriez-vous disponible pour un échange téléphonique de 15 minutes ?"
> - Viser 2-3 demandes (tout le monde ne répond pas) — 1 échange suffit.

**Validé quand :** ton GitHub a au moins tes scripts R + le livret, ET au moins 1 demande LinkedIn envoyée.

---

#### CHECKPOINT 2 — Premier projet données ouvertes (preuve visible)

**Technique :**
- [ ] Télécharger un dataset Géodes (grippe saisonnière OU diabète par département)
- [ ] Nettoyer, analyser, visualiser dans R (courbe épidémique, Tableau 1 par région, graphiques)
- [ ] Produire un rapport R Markdown complet
- [ ] Pousser le projet sur GitHub = **premier projet visible pour un recruteur**

**Réseau OBLIGATOIRE :**
- [ ] Contacter **1 nouveau médecin ARS ou SP** via LinkedIn (élargir le réseau)
- [ ] Relancer ou approfondir l'échange du checkpoint 1 si réponse reçue

**Validé quand :** rapport R Markdown sur GitHub + réseau actif (au moins 2 demandes LinkedIn envoyées au total).

---

#### CHECKPOINT 3 — Culture SP française (préparer les entretiens)

**Technique :**
- [ ] S'abonner au BEH par mail (gratuit, santepubliquefrance.fr)
- [ ] Lire 3 numéros du BEH (choisir : bilan grippe, bilan MDO, surveillance syndromique)
- [ ] Lire les missions de l'ARS sur le site officiel (veille, alerte, promotion santé, offre de soins)
- [ ] Connaître le circuit de signalement des MDO (tu l'as dans le livret Annexe F)
- [ ] 1 cours OpenWHO : surveillance épidémiologique (gratuit, en français)
- [ ] Écouter 2-3 épisodes podcast "Santé publique" France Culture

**Réseau OBLIGATOIRE :**
- [ ] Contacter le **département de SP du CHU Toulouse** (Purpan) — demander un RDV avec un PU-PH

> **Comment contacter le département SP CHU Toulouse :**
> - Chercher le secrétariat du département de santé publique / épidémiologie du CHU Toulouse Purpan
> - Mail au secrétariat : "Je suis médecin généraliste, actuellement en thèse (Predict-R, CERPOP), et je souhaite m'orienter vers la santé publique. Serait-il possible de rencontrer un enseignant du département pour un échange sur les parcours possibles ?"
> - Le Pr Rougé-Bugat (PU MG, CERPOP UMR 1295) est une cible naturelle vu ton ancrage thèse.

**Validé quand :** 3 BEH lus + circuit MDO maîtrisé + contact CHU SP envoyé.

---

#### CHECKPOINT 4 — CV + lettre de motivation (se rendre candidatable)

**Technique :**
- [ ] Rédiger un CV orienté SP (mettre en avant : thèse R, mémoire coordination Ariège, analyse de données, éthique)
- [ ] Rédiger une lettre de motivation type pour poste médecin ARS
- [ ] Regarder 5 offres sur Place de l'emploi public + ARS Occitanie (pas pour postuler — pour comprendre ce qu'ils demandent)
- [ ] S'inscrire à la SFSP (Société Française de Santé Publique)

**Réseau OBLIGATOIRE :**
- [ ] Faire relire CV + lettre par **le contact ARS** du checkpoint 1 ou 2, ou un médecin SP du réseau

> **Fil narratif pour la lettre :**
> Predict-R (dépistage numérique, analyse R) + mémoire Ariège (coordination territoriale, éthique du care) + réorientation = "comment améliorer le repérage et la coordination en soins primaires dans un système de santé défaillant". C'est ce qui relie tout et te distingue d'un candidat purement technique.

**Validé quand :** CV + lettre prêts et relus par au moins 1 personne du réseau.

---

#### CHECKPOINT 5 — SQL bases (compléter le profil technique)

**Technique :**
- [ ] SQLBolt — tutoriel interactif (sqlbolt.com, ~3-4h)
- [ ] SELECT, JOIN, WHERE, GROUP BY, ORDER BY, HAVING
- [ ] Enrichir la section SQL du livret avec l'expérience acquise

**Réseau OBLIGATOIRE :**
- [ ] Surveiller activement les offres ARS Occitanie + Place de l'emploi public + SpFrance
- [ ] Contacter **1 nouveau médecin ARS ou SpFrance** via LinkedIn (même modèle que checkpoint 2)

**Validé quand :** SQLBolt terminé + veille offres active.

---

#### CHECKPOINT 6 — Rédaction thèse + recueil Predict-R

**Technique :**
- [ ] Rédiger l'introduction de la thèse Predict-R
- [ ] Recueil de données Predict-R (prévu mai 2026)
- [ ] Lancer les analyses sur les vraies données (le livret est prêt pour ça)
- [ ] Rédiger les résultats de la thèse

**Réseau OBLIGATOIRE :**
- [ ] Postuler sur **au moins 1 poste ARS** si une offre pertinente apparaît
- [ ] OU contacter le contact du checkpoint 3 pour demander "est-ce que vous recrutez / connaissez des postes ?"

> **Rappel :** pour un poste ARS contractuel, beaucoup passent par cooptation. Un contact qui parle de toi en interne vaut plus qu'une candidature spontanée. C'est pour ça qu'on construit le réseau depuis le checkpoint 1.

**Validé quand :** introduction + recueil lancés + au moins 1 candidature ou contact actif.

---

#### CHECKPOINT 7 — Shiny + projet visible (bonus différenciant)

**Technique :**
- [ ] R Shiny — tutoriel officiel + Epi R Handbook ch.42
- [ ] Mini-dashboard Shiny avec données Géodes ou Predict-R
- [ ] Héberger sur shinyapps.io
- [ ] Pousser sur GitHub

**Réseau OBLIGATOIRE :**
- [ ] Postuler sur **au moins 3 postes** au total (ARS, SpFrance, ou autre SP)

**Validé quand :** dashboard en ligne + 3 candidatures envoyées.

---

#### CHECKPOINT 8 — Soutenance thèse + approfondissements (quand prêt)

**Technique — au choix selon les besoins :**
- [ ] Soutenance de thèse Predict-R (visée fin 2026)
- [ ] Lire et critiquer 5 articles (BEH, Lancet Public Health, Eurosurveillance)
- [ ] Reproduire l'analyse d'un article publié de A à Z dans R
- [ ] Cartographie R avec sf (si pertinent pour le poste visé)
- [ ] Reproduire 5 visualisations santé depuis R Graph Gallery

**Épidémiologie théorique (quand le temps le permet, pas prioritaire avant un poste) :**
- [ ] Gordis "Epidemiology" (~35€) — lecture de référence
- [ ] MOOC Johns Hopkins "Epidemiology" — Coursera, audit gratuit
- [ ] MOOC Johns Hopkins "Biostatistics" — Coursera, audit gratuit
- [ ] Modélisation épidémique dans R (Epi R Handbook ch.24)
- [ ] Analyse de survie : Kaplan-Meier + Cox (Epi R Handbook ch.27)

**Éthique (enrichissement, atout différenciant) :**
- [ ] Avis du CCNE : dépistage, numérique en santé, consentement
- [ ] MOOC "Éthique de la recherche" — FUN-MOOC (Lyon, gratuit)
- [ ] Rapport OMS "Screening programmes: a short guide" (gratuit)
- [ ] Beauchamp & Childress "Principes d'éthique biomédicale" (~35€)
- [ ] ERE Occitanie — séminaires et formations courtes

**Culture SP complémentaire :**
- [ ] Bourdillon "Traité de santé publique" (~40€) — chapitres système de santé, ARS, surveillance
- [ ] 1 cours OpenWHO supplémentaire : investigation d'épidémies
- [ ] Rapport annuel ARS Occitanie + rapport annuel SpFrance
- [ ] Lire 10 numéros du BEH au total

**Réseau :** maintenir les contacts actifs, postuler activement.

### NON NÉGOCIABLE — Équilibre

- Continuer suivi PEPSS + psychiatre + psychologue
- Maintenir crossfit, musique, lecture, échecs
- **Si la pression monte, ralentir la formation, pas le soin ni le sport**

---

## Formations diplômantes (à considérer plus tard)

| Formation | Lieu | Format | Coût | Candidature |
| --- | --- | --- | --- | --- |
| DU Méthodes et pratique en épidémiologie | ISPED Bordeaux | À distance | ~1500-3000€ | Mai-Sept 2026 |
| DIU Éthique des pratiques du soin | ERE Occitanie / CHU Toulouse | Présentiel 3 sem | À confirmer | Contacter ERE |
| IDEA Express — Épidémiologie de terrain | EHESP Rennes | 5 jours présentiel | 2155€ | formation-continue.ehesp.fr |
| Master Éthique du soin et recherche | Toulouse Paul Sabatier | Présentiel | Frais univ | 20 avril - 1er juin 2026 |
| Concours MISP | National | Concours + 8 mois EHESP | Gratuit (fonctionnaire) | Annuel via CNG |

## Budget

| Ressource | Coût |
| --- | --- |
| R, RStudio, Epi R Handbook, R4DS, swirl, Géodes, data.gouv, OpenWHO, FUN-MOOC, BEH, CCNE, podcasts, SQLBolt, Git | Gratuit |
| Gordis — Epidemiology | ~35€ |
| Bourdillon — Traité de santé publique | ~40€ |
| Beauchamp & Childress — Éthique biomédicale | ~35€ |
| **Total autoformation** | **\~110€** |

## Principes

1. Pas de deadline fixe. À son rythme. La régularité bat l'intensité.
2. La thèse Predict-R d'abord — c'est le socle.
3. Apprendre en faisant — chaque concept → application dans R.
4. Le réseau n'attend pas — contacter des gens même sans compétences techniques.
5. Tester avant de s'engager — un poste contractuel vaut mieux que 6 mois de théorie.
6. Prendre soin de soi n'est pas négociable.

## Liens utiles

- https://cloud.r-project.org/https://cloud.r-project.org/R : https://cloud.r-project.org/
- https://posit.co/download/rstudio-desktop/RStudio : https://posit.co/download/rstudio-desktop/
- https://r4ds.hadley.nzhttps://r4ds.hadley.nzR for Data Science : https://r4ds.hadley.nz
- https://epirhandbook.com/en/https://epirhandbook.com/en/Epi R Handbook : https://epirhandbook.com/en/
- https://geodes.santepubliquefrance.fr/https://geodes.santepubliquefrance.fr/Géodes : https://geodes.santepubliquefrance.fr/
- https://www.data.gouv.fr/pages/donnees_santehttps://www.data.gouv.fr/pages/donnees_santedata.gouv.fr santé : https://www.data.gouv.fr/pages/donnees_sante
- https://r-graph-gallery.comhttps://r-graph-gallery.comR Graph Gallery : https://r-graph-gallery.com
- https://shiny.posit.co/r/getstarted/Shiny : https://shiny.posit.co/r/getstarted/
- https://openwho.org/https://openwho.org/OpenWHO : https://openwho.org/
- https://www.ccne-ethique.fr/CCNE : https://www.ccne-ethique.fr/
- https://www.ere-occitanie.org/https://www.ere-occitanie.org/ERE Occitanie : https://www.ere-occitanie.org/
- https://ars-occitanie-recrute.talent-soft.comhttps://ars-occitanie-recrute.talent-soft.comARS Occitanie recrutement : https://ars-occitanie-recrute.talent-soft.com
- https://place-emploi-public.gouv.frhttps://place-emploi-public.gouv.frPlace de l'emploi public : https://place-emploi-public.gouv.fr
- https://www.santepubliquefrance.fr/offres-d-emploihttps://www.santepubliquefrance.fr/offres-d-emploiSpFrance offres : https://www.santepubliquefrance.fr/offres-d-emploi
- https://formation-continue.ehesp.fr/https://formation-continue.ehesp.fr/EHESP formation continue : https://formation-continue.ehesp.fr/
- https://www.isped.u-bordeaux.fr/https://www.isped.u-bordeaux.fr/ISPED Bordeaux : https://www.isped.u-bordeaux.fr/
- https://sqlbolt.comhttps://sqlbolt.comSQLBolt : https://sqlbolt.com
- https://learngitbranching.js.orghttps://learngitbranching.js.orgLearn Git Branching : https://learngitbranching.js.org
