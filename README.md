# Analyse des facteurs associés au poids de naissance

Projet universitaire d'analyse statistique avec r consacré aux relations entre les caractéristiques maternelles et le poids du nourrisson à la naissance.

Le travail combine une exploration descriptive, des analyses de corrélation et des régressions linéaires. Le dépôt réunit le jeu de données, le script, le rapport et le support de présentation.

## Analyses réalisées

- Préparation des variables maternelles et du poids de naissance.
- Conversion des poids dans une unité commune, en kilogrammes.
- Recodage des variables qualitatives : tabagisme, antécédents de prématurité, hypertension, irritabilité utérine et nombre de visites médicales.
- Description des distributions par des histogrammes, des boîtes à moustaches et des statistiques résumées.
- Étude des corrélations du poids de naissance avec l'âge et le poids maternels.
- Régressions linéaires simples puis multiples, sélection de variables avec `step()` et examen des diagnostics du modèle.

## Fichiers à consulter

| Fichier | Contenu |
| --- | --- |
| [Etude-Poids-naissance.pdf](Etude-Poids-naissance.pdf) | Rapport de l'étude |
| [Présentation.pdf](Présentation.pdf) | Support de présentation |
| [SCRIPT_ORAL_NAISSANCE.R](SCRIPT_ORAL_NAISSANCE.R) | Préparation des variables et analyses |
| [poids.naissance.xls](poids.naissance.xls) | Données au format excel |

## Utilisation

Les documents pdf permettent de lire l'étude sans exécuter le script.

Pour explorer les analyses, ouvrir la racine du dépôt dans rstudio et importer `poids.naissance.xls` dans un tableau nommé `poids_naissance`, par exemple avec `readxl` :

```r
install.packages("readxl")
poids_naissance <- readxl::read_excel("poids.naissance.xls")
```

Vérifier que le tableau importé contient les colonnes attendues par le script : `AGE`, `LWT`, `RACE`, `SMOKE`, `PTL`, `HT`, `UI`, `FVT` et `BWT`. Ajuster les options d'importation si nécessaire.

Ouvrir ensuite `SCRIPT_ORAL_NAISSANCE.R` et exécuter les sections dans l'ordre. Les analyses utilisent les fonctions statistiques et graphiques fournies avec r ; `readxl` sert uniquement à l'importation proposée ci-dessus.

## Contexte du travail

Travail réalisé par hâjar abdaoui, shaïnez romana et karima zouzane.

Le script d'origine suppose que les données sont déjà chargées dans l'environnement. Il convertit le poids maternel depuis les livres et le poids de naissance depuis les grammes : ces unités doivent être conservées dans les données d'entrée.

Les analyses portent sur des associations statistiques et ne démontrent pas, à elles seules, des relations causales.
