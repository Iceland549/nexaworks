-- *** Insertion Données dans les TABLES ***

-- 1. Table PRODUIT :

INSERT INTO PRODUIT (NomProduit)
VALUES ('Trader en Herbe'), ('Maître des Investissements'), ('Planificateur d''Entraînement'), ('Planificateur d''Anxiété Sociale');



-- 2. Table VERSION :

INSERT INTO VERSION (NumeroVersion)
VALUES ('1.0'), ('1.1'), ('1.2'), ('1.3'), ('2.0'), ('2.1');

Cette commande devrait afficher dans la sortie de SSMS la liste des 6 versions.


-- 3. Table PRODUIT_VERSION :

INSERT INTO PRODUIT_VERSION (ID_PRODUIT, ID_VERSION)
VALUES 
((SELECT ID FROM PRODUIT WHERE NomProduit = 'Trader en Herbe'), (SELECT ID FROM VERSION WHERE NumeroVersion = '1.0')),
((SELECT ID FROM PRODUIT WHERE NomProduit = 'Trader en Herbe'), (SELECT ID FROM VERSION WHERE NumeroVersion = '1.1')),
((SELECT ID FROM PRODUIT WHERE NomProduit = 'Trader en Herbe'), (SELECT ID FROM VERSION WHERE NumeroVersion = '1.2')),
((SELECT ID FROM PRODUIT WHERE NomProduit = 'Trader en Herbe'), (SELECT ID FROM VERSION WHERE NumeroVersion = '1.3')),
((SELECT ID FROM PRODUIT WHERE NomProduit = 'Maître des Investissements'), (SELECT ID FROM VERSION WHERE NumeroVersion = '1.0')),
((SELECT ID FROM PRODUIT WHERE NomProduit = 'Maître des Investissements'), (SELECT ID FROM VERSION WHERE NumeroVersion = '2.0')),
((SELECT ID FROM PRODUIT WHERE NomProduit = 'Maître des Investissements'), (SELECT ID FROM VERSION WHERE NumeroVersion = '2.1')),
((SELECT ID FROM PRODUIT WHERE NomProduit = 'Planificateur d''Entraînement'), (SELECT ID FROM VERSION WHERE NumeroVersion = '1.0')),
((SELECT ID FROM PRODUIT WHERE NomProduit = 'Planificateur d''Entraînement'), (SELECT ID FROM VERSION WHERE NumeroVersion = '1.1')),
((SELECT ID FROM PRODUIT WHERE NomProduit = 'Planificateur d''Entraînement'), (SELECT ID FROM VERSION WHERE NumeroVersion = '2.0')),
((SELECT ID FROM PRODUIT WHERE NomProduit = 'Planificateur d''Anxiété Sociale'), (SELECT ID FROM VERSION WHERE NumeroVersion = '1.0')),
((SELECT ID FROM PRODUIT WHERE NomProduit = 'Planificateur d''Anxiété Sociale'), (SELECT ID FROM VERSION WHERE NumeroVersion = '1.1'));


-- 4. Table SYSTEME_EXPLOITATION :

INSERT INTO SYSTEME_EXPLOITATION (Nom)
VALUES 
('Linux'), ('MacOS'), ('Windows'), ('Android'), ('iOS'), ('Windows Mobile');




-- 5. Table STATUT :

INSERT INTO STATUT (ID, Libelle)
VALUES (0, 'En cours'), (1, 'Résolu');


-- 6. Table TICKET :


-- Déclaration des variables pour stocker les IDs
DECLARE @IdTraderEnHerbe INT,
        @IdMaitreInvestissements INT,
        @IdPlanificateurEntrainement INT,
        @IdPlanificateurAnxieteSociale INT;

-- Déclaration des variables pour les versions
DECLARE @IdTraderEnHerbe10 INT, @IdTraderEnHerbe11 INT, @IdTraderEnHerbe12 INT, @IdTraderEnHerbe13 INT,
        @IdMaitreInvestissements10 INT, @IdMaitreInvestissements20 INT, @IdMaitreInvestissements21 INT,
        @IdPlanificateurEntrainement10 INT, @IdPlanificateurEntrainement11 INT, @IdPlanificateurEntrainement12 INT,
        @IdPlanificateurEntrainement20 INT,
        @IdPlanificateurAnxieteSociale10 INT, @IdPlanificateurAnxieteSociale11 INT,@IdPlanificateurAnxieteSociale12 INT;

-- Déclaration des variables pour les systèmes d'exploitation
DECLARE @IdWindows INT, @IdMacOS INT, @IdIOS INT, @IdAndroid INT, @IdLinux INT, @IdWindowsMobile INT;

-- Déclaration des variables pour les statuts
DECLARE @IdEnCours INT, @IdResolu INT;

-- Récupération des IDs des produits
SELECT @IdTraderEnHerbe = ID FROM PRODUIT WHERE NomProduit = 'Trader en Herbe';
SELECT @IdMaitreInvestissements = ID FROM PRODUIT WHERE NomProduit = 'Maître des Investissements';
SELECT @IdPlanificateurEntrainement = ID FROM PRODUIT WHERE NomProduit = 'Planificateur d''Entraînement';
SELECT @IdPlanificateurAnxieteSociale = ID FROM PRODUIT WHERE NomProduit = 'Planificateur d''Anxiété Sociale';

-- Récupération des IDs des versions via la table de jonction PRODUIT_VERSION
SELECT @IdTraderEnHerbe10 = ID_VERSION 
FROM PRODUIT_VERSION 
WHERE ID_PRODUIT = @IdTraderEnHerbe 
AND ID_VERSION = (SELECT ID FROM VERSION WHERE NumeroVersion = '1.0');

SELECT @IdTraderEnHerbe11 = ID_VERSION 
FROM PRODUIT_VERSION 
WHERE ID_PRODUIT = @IdTraderEnHerbe 
AND ID_VERSION = (SELECT ID FROM VERSION WHERE NumeroVersion = '1.1');

SELECT @IdTraderEnHerbe12 = ID_VERSION 
FROM PRODUIT_VERSION 
WHERE ID_PRODUIT = @IdTraderEnHerbe 
AND ID_VERSION = (SELECT ID FROM VERSION WHERE NumeroVersion = '1.2');

SELECT @IdTraderEnHerbe13 = ID_VERSION 
FROM PRODUIT_VERSION 
WHERE ID_PRODUIT = @IdTraderEnHerbe 
AND ID_VERSION = (SELECT ID FROM VERSION WHERE NumeroVersion = '1.3');

SELECT @IdMaitreInvestissements10 = ID_VERSION 
FROM PRODUIT_VERSION 
WHERE ID_PRODUIT = @IdMaitreInvestissements 
AND ID_VERSION = (SELECT ID FROM VERSION WHERE NumeroVersion = '1.0');

SELECT @IdMaitreInvestissements20 = ID_VERSION 
FROM PRODUIT_VERSION 
WHERE ID_PRODUIT = @IdMaitreInvestissements 
AND ID_VERSION = (SELECT ID FROM VERSION WHERE NumeroVersion = '2.0');

SELECT @IdMaitreInvestissements21 = ID_VERSION 
FROM PRODUIT_VERSION 
WHERE ID_PRODUIT = @IdMaitreInvestissements 
AND ID_VERSION = (SELECT ID FROM VERSION WHERE NumeroVersion = '2.1');

SELECT @IdPlanificateurEntrainement10 = ID_VERSION 
FROM PRODUIT_VERSION 
WHERE ID_PRODUIT = @IdPlanificateurEntrainement 
AND ID_VERSION = (SELECT ID FROM VERSION WHERE NumeroVersion = '1.0');

SELECT @IdPlanificateurEntrainement11 = ID_VERSION 
FROM PRODUIT_VERSION 
WHERE ID_PRODUIT = @IdPlanificateurEntrainement 
AND ID_VERSION = (SELECT ID FROM VERSION WHERE NumeroVersion = '1.1');

SELECT @IdPlanificateurEntrainement12 = ID_VERSION 
FROM PRODUIT_VERSION 
WHERE ID_PRODUIT = @IdPlanificateurEntrainement 
AND ID_VERSION = (SELECT ID FROM VERSION WHERE NumeroVersion = '1.2');

SELECT @IdPlanificateurEntrainement20 = ID_VERSION 
FROM PRODUIT_VERSION 
WHERE ID_PRODUIT = @IdPlanificateurEntrainement 
AND ID_VERSION = (SELECT ID FROM VERSION WHERE NumeroVersion = '2.0');

SELECT @IdPlanificateurAnxieteSociale10 = ID_VERSION 
FROM PRODUIT_VERSION 
WHERE ID_PRODUIT = @IdPlanificateurAnxieteSociale 
AND ID_VERSION = (SELECT ID FROM VERSION WHERE NumeroVersion = '1.0');

SELECT @IdPlanificateurAnxieteSociale11 = ID_VERSION 
FROM PRODUIT_VERSION 
WHERE ID_PRODUIT = @IdPlanificateurAnxieteSociale 
AND ID_VERSION = (SELECT ID FROM VERSION WHERE NumeroVersion = '1.1');

-- Récupération des IDs des systèmes d'exploitation
SELECT @IdWindows = ID FROM SYSTEME_EXPLOITATION WHERE Nom = 'Windows';
SELECT @IdMacOS = ID FROM SYSTEME_EXPLOITATION WHERE Nom = 'MacOS';
SELECT @IdIOS = ID FROM SYSTEME_EXPLOITATION WHERE Nom = 'iOS';
SELECT @IdAndroid = ID FROM SYSTEME_EXPLOITATION WHERE Nom = 'Android';
SELECT @IdLinux = ID FROM SYSTEME_EXPLOITATION WHERE Nom = 'Linux';
SELECT @IdWindowsMobile = ID FROM SYSTEME_EXPLOITATION WHERE Nom = 'Windows Mobile';


-- Insertion des tickets
INSERT INTO TICKET (Titre, TexteProbleme, DateCreation, DateResolution, TexteResolution, MotsCles, ID_PRODUIT, ID_VERSION, ID_SYSTEME_EXPLOITATION, ID_STATUT)
VALUES 
('Problème de connexion', 'L''application refuse de se connecter après la mise à jour vers la version 1.2.', CONVERT(datetime, '2023-06-01', 120), NULL, NULL, 'Connexion, Erreur',  @IdTraderEnHerbe, @IdTraderEnHerbe12, @IdWindows, @IdEnCours),

('Perte des données utilisateurs', 'Les données des utilisateurs disparaissent après la mise à jour de l''application.', CONVERT(datetime, '2023-01-05', 120), CONVERT(datetime, '2023-02-02', 120), 'Sauvegarde des données utilisateur avant mise à jour.', 'Données, Sauvegarde', @IdPlanificateurEntrainement, @IdPlanificateurEntrainement20, @IdIOS, @IdResolu),

('Impossible de charger les historiques de transactions', 'L''historique des transactions est vide après une mise à jour.', CONVERT(datetime, '2023-06-12', 120), NULL, NULL, 'Historique, Transactions', @IdMaitreInvestissements, @IdMaitreInvestissements20, @IdWindows, @IdEnCours),

('Erreur lors du calcul des profits', 'Le calcul des profits est incorrect pour certains investissements.', CONVERT(datetime, '2023-04-01', 120), CONVERT(datetime, '2023-04-10', 120), 'Ajustement de l''algorithme pour des résultats plus précis.', 'Profits, Calcul', @IdMaitreInvestissements, @IdMaitreInvestissements21, @IdWindows, @IdResolu),

('Problème de chargement des graphiques financiers', 'Les graphiques prennent trop de temps à charger.', CONVERT(datetime, '2023-05-10', 120), NULL, NULL, 'Graphiques, Chargement', @IdMaitreInvestissements, @IdMaitreInvestissements20, @IdIOS, @IdEnCours);

('Problème de synchronisation des données utilisateur', 'La synchronisation avec le cloud échoue régulièrement.', CONVERT(datetime, '2023-06-05', 120), CONVERT(datetime, '2023-06-10', 120), 'Stabilisation de la connexion au service cloud.', 'Données, Synchronisation', @IdPlanificateurEntrainement, @IdPlanificateurEntrainement11, @IdMacOS, @IdResolu),

('Erreur d''affichage des graphiques', 'Les graphiques financiers ne se chargent pas.', CONVERT(datetime, '2023-05-20', 120), CONVERT(datetime, '2023-06-02', 120), 'Correction des paramètres d''affichage dans le code source pour assurer un chargement des graphiques.', 'Affichage, Graphiques', @IdTraderEnHerbe, @IdTraderEnHerbe12, @IdMacOS, @IdResolu),

('Lenteur de l''application', 'Temps de chargement trop long sur iOS.', CONVERT(datetime, '2023-03-15', 120), NULL, NULL, 'Lenteur, iOS', @IdTraderEnHerbe, @IdTraderEnHerbe12, @IdIOS, @IdEnCours),

('Problème d''achat en double', 'L''achat est facturé deux fois si l''utilisateur appuie deux fois sur le bouton "Acheter".', CONVERT(datetime, '2023-05-02', 120), CONVERT(datetime, '2023-06-15', 120), 'Ajout d''un blocage au second clic sur le bouton pour éviter l''achat double.', 'Achat, Double', @IdTraderEnHerbe, @IdTraderEnHerbe12, @IdAndroid, @IdResolu),

('Problème de notifications', 'Les notifications de rappel ne s''affichent pas.', CONVERT(datetime, '2022-10-01', 120), NULL, NULL, 'Notifications, Rappel', @IdPlanificateurAnxieteSociale, @IdPlanificateurAnxieteSociale11, @IdMacOS, @IdEnCours),

('Problème d''authentification', 'Les utilisateurs valides ne peuvent pas se connecter.', CONVERT(datetime, '2023-02-25', 120), NULL, NULL, 'Authentification, Erreur', @IdTraderEnHerbe, @IdTraderEnHerbe12, @IdAndroid, @IdEnCours),

('Mauvaise interprétation des données boursières', 'Les données boursières sont incorrectement interprétées sur l''interface.', CONVERT(datetime, '2023-03-01', 120), CONVERT(datetime, '2023-03-05', 120), 'Correction des erreurs d''analyse dans le code de traitement des données.', 'Données, Bourse', @IdTraderEnHerbe, @IdTraderEnHerbe12, @IdLinux, @IdResolu),

('Problème de chargement des graphiques financiers', 'Les graphiques prennent trop de temps à charger.', CONVERT(datetime, '2023-05-10', 120), NULL, NULL, 'Graphiques, Chargement', @IdMaitreInvestissements, @IdMaitreInvestissements20, @IdIOS, @IdEnCours),

('Problème de synchronisation des données utilisateur', 'La synchronisation avec le cloud échoue régulièrement.', CONVERT(datetime, '2023-06-05', 120), CONVERT(datetime, '2023-06-10', 120), 'Stabilisation de la connexion au service cloud.', 'Données, Synchronisation', @IdPlanificateurEntrainement, @IdPlanificateurEntrainement11, @IdMacOS, @IdResolu),

('Mauvaise interprétation des données boursières', 'Les données boursières sont incorrectement interprétées sur l''interface.', CONVERT(datetime, '2023-03-01', 120), CONVERT(datetime, '2023-03-05', 120), 'Correction des erreurs d''analyse dans le code de traitement des données.', 'Données, Bourse', @IdTraderEnHerbe, @IdTraderEnHerbe12, @IdLinux, @IdResolu),

('Problème d''affichage des notifications', 'Les notifications de mise à jour de portefeuille ne s''affichent pas.', CONVERT(datetime, '2023-04-15', 120), NULL, NULL, 'Notifications, Portefeuille', @IdMaitreInvestissements, @IdMaitreInvestissements21, @IdAndroid, @IdEnCours),

('Anomalie dans la mise à jour des portefeuilles', 'Les portefeuilles ne se mettent pas à jour en temps réel.', CONVERT(datetime, '2023-04-01', 120), CONVERT(datetime, '2023-04-10', 120), 'Amélioration de la synchronisation en temps réel.', 'Portefeuille, Mise à jour', @IdTraderEnHerbe, @IdTraderEnHerbe13, @IdMacOS, @IdResolu),

('Problème de création de profils', 'Impossible de créer de nouveaux profils d''utilisateur.', CONVERT(datetime, '2023-01-10', 120), NULL, NULL, 'Profils, Erreur', @IdPlanificateurEntrainement, @IdPlanificateurEntrainement10, @IdLinux, @IdEnCours),

('Erreur de calcul de la rentabilité', 'La rentabilité de certains investissements n''est pas correcte.', CONVERT(datetime, '2023-02-01', 120), CONVERT(datetime, '2023-02-05', 120), 'Correction de l''algorithme de calcul de rentabilité.', 'Rentabilité, Calcul', @IdMaitreInvestissements, @IdMaitreInvestissements20, @IdWindows, @IdResolu),

('Problème de connexion au réseau', 'L''application ne parvient pas à se connecter au réseau.', CONVERT(datetime, '2023-05-01', 120), NULL, NULL, 'Réseau, Connexion', @IdPlanificateurAnxieteSociale, @IdPlanificateurAnxieteSociale11, @IdAndroid, @IdEnCours),

('Lenteur lors de l''affichage des données de marché', 'Les données de marché prennent du temps à charger.', CONVERT(datetime, '2023-03-01', 120), NULL, NULL, 'Données, Marché', @IdTraderEnHerbe, @IdTraderEnHerbe13, @IdWindows, @IdEnCours),

('Erreur de traitement des ordres d''achat', 'Les ordres d''achat ne s''exécutent pas toujours correctement.', CONVERT(datetime, '2023-05-05', 120), CONVERT(datetime, '2023-05-10', 120), 'Correction des processus de vérification avant exécution.', 'Achat, Ordres', @IdTraderEnHerbe, @IdTraderEnHerbe12, @IdLinux, @IdResolu),

('Crash lors de la visualisation des profits', 'L''application plante lorsqu''on visualise les profits.', CONVERT(datetime, '2023-02-20', 120), CONVERT(datetime, '2023-03-01', 120), 'Correction de l''affichage pour éviter les plantages.', 'Crash, Profits', @IdMaitreInvestissements, @IdPlanificateurAnxieteSociale11, @IdMacOS, @IdResolu),

('Erreur dans le calcul des calories', 'Les calories sont mal calculées pour certaines activités physiques.', CONVERT(datetime, '2022-11-10', 120), CONVERT(datetime, '2022-12-01', 120), 'Révision de l''algorithme de calcul pour plus d''exactitude dans les calculs.', 'Calories, Calcul', @IdPlanificateurEntrainement, @IdPlanificateurEntrainement20, @IdAndroid, @IdResolu),

('Bug lors de l''ajout d''événements sociaux', 'Impossible d''ajouter des événements dans le calendrier social.', CONVERT(datetime, '2023-03-10', 120), CONVERT(datetime, '2023-03-15', 120), 'Correctif pour permettre l''ajout d''événements.', 'Evénements, Bug', @IdPlanificateurAnxieteSociale, @IdPlanificateurAnxieteSociale11, @IdWindows, @IdResolu),


('Erreur dans le suivi de progression des objectifs', 'Le suivi des objectifs sociaux affiche des données erronées.', CONVERT(datetime, '2023-02-10', 120), CONVERT(datetime, '2023-02-20', 120), 'Ajustement des calculs de progression.', 'Objectifs, Progression', @IdPlanificateurAnxieteSociale, @IdPlanificateurAnxieteSociale11, @IdIOS, @IdResolu),


('Problème de sauvegarde des séances', 'Les séances ne se sauvegardent pas correctement.', CONVERT(datetime, '2023-06-15', 120), CONVERT(datetime, '2023-06-20', 120), 'Ajustement de la fonction de sauvegarde.', 'Séances, Sauvegarde', @IdPlanificateurEntrainement, @IdPlanificateurEntrainement20, @IdIOS, @IdResolu),


('Erreur dans les notifications push', 'Les notifications push ne s''envoient pas.', CONVERT(datetime, '2023-04-15', 120), NULL, NULL, 'Notifications, Push', @IdPlanificateurAnxieteSociale, @IdPlanificateurAnxieteSociale11, @IdWindows, @IdEnCours);