# Description

Le brief « Les pays en chiffre » a pour objectif l’utilisation de la gestion de données sur les pays en utilisant une base de données.
Les données proviennent d’un fichier au format csv au préalable formatée et sont importées dans la base de données.
Le fonctionnement de  base de données est assurée par le logiciel saas ElephantSQL et son administration est gérée par le logiciel DBeaver.

# Installation

## Connexion à  la base sur DBeaver :
    • Lancer  DBeaver.
    • Créer la connexion à la base de données.
	• Se connecter à la base de données.

## Création de la table « Pays » :
    • Dans l’onglet « Navigateur de bases de données, cliquer deux fois sur « ylytfcfo » (ou cliquer une fois sur la flèche d’arborescence, juste à côté). La connexion à la base de données si ce n’est fait.
    • Cliquer sur la ligne de la base de données « ylytfcfo ».
    • Dans le menu, sélectionner « Fichier » - « Ouvrir un fichier » et dans le dossier   « Les pays en chiffre », ouvrir le dossier « sql » et choisir le fichier « ajout table pays.sql ».
    • Dans l’onglet SQL du fichier chargé, cliquer sur l’icone « Exécuter l’instruction SQL » (flèche jaune). La table est crée avec son contenu.

# Démarrage

Lancer DBeaver

Dans l’onglet « Navigateur de bases de données, cliquer deux fois sur « ylytfcfo » (ou cliquer une fois sur la flèche d’arborescence, juste à côté). La connexion à la base de données si ce n’est fait.
Cliquer sur la ligne de la base de données « ylytfcfo ».
Dans le menu, sélectionner « Editeur SQL » - « Nouvel éditeur SQL ». Celui-ci sera utilisé ultérieurement pour exécuter séparément certaines requêtes.

# Prérequis 

Une instance ElephantSQL doit être au préalable préparée.
Télécharger les données dans ce répertoire git : https://github.com/NicamShilova/Les-pays-en-chiffre.
Installer DBeaver
Le fichier Pays.csv doit être dans le même dossier que le fichier « ajout table pays.sql ».

Test

## Créer une fonction SQL qui retourne le pays (sous format de TABLE) qui correspond au critère passé en paramètre.  
    • Dans le menu, sélectionner « Fichier » - « Ouvrir un fichier » et dans le dossier   « Les pays en chiffre », ouvrir le dossier « sql » et choisir le fichier « fonction selection pays.sql ».
    • Exécuter la requête.
    • Saisir et exécuter la requête suivante :
'''requete
SELECT * FROM selectionPays('nom du pays');
'''

## Créer une procédure SQL qui insert un nouveau pays avec des données random 
    • Dans le menu, sélectionner « Fichier » - « Ouvrir un fichier » et dans le dossier   « Les pays en chiffre », ouvrir le dossier « sql » et choisir le fichier « fonction selection pays.sql ».
    • Exécuter la requête.
    • Saisir et exécuter la requête suivante :
'''requete
CALL insertionPays('nom du pays');
'''

## Configurer un trigger qui va mettre à jour la colonne de la table correspondant à la date de l'insertion 
    • Dans le menu, sélectionner « Fichier » - « Ouvrir un fichier » et dans le dossier   « Les pays en chiffre », ouvrir le dossier « sql » et choisir le fichier « creation trigger date.sql ».
    • Exécuter les trois requêtes.
    • Saisir et exécuter la requête suivante :
'''requete
CALL insertionPays('nom du pays');
'''

## Réaliser une fonction ou procédure stockée pour retourner les pays qui sont regroupés par 4 tranches (à définir) de densité de population 
    • Dans le menu, sélectionner « Fichier » - « Ouvrir un fichier » et dans le dossier   « Les pays en chiffre », ouvrir le dossier « sql » et choisir le fichier « fonction classement repartition pays.sql ».
    • Exécuter la requête.
    • Saisir et exécuter la requête suivante :
'''requete
SELECT * FROM classementRepartitionPays();
'''

# Aide

Problème : Lors de l’exécution d’une requête, le message d’erreur « Can't open editor connection – Motif: FATAL: too many connections for role "ylytfcfo" » s’affiche.
Solution : Trop d’éditeurs de requêtes fonctionnent simultanément. La solution est de fermer ceux qui sont inutiles.