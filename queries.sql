-- *** 15 Requêtes pour questionner la BDD ***

-- 1. Obtenir tous les problèmes en cours (tous les produits) :

SELECT t.ID, t.Titre, t.TexteProbleme, t.DateCreation, 
       p.NomProduit, v.NumeroVersion, se.Nom AS SystemeExploitation, s.Libelle
FROM TICKET t
JOIN STATUT s ON t.ID_STATUT = s.ID
JOIN PRODUIT p ON t.ID_PRODUIT = p.ID
JOIN VERSION v ON t.ID_VERSION = v.ID
JOIN SYSTEME_EXPLOITATION se ON t.ID_SYSTEME_EXPLOITATION = se.ID
WHERE s.Libelle = 'En Cours';


-- 2. Obtenir tous les problèmes en cours pour un produit (toutes les versions) :
DECLARE @NomProduit NVARCHAR(100) = 'Trader en Herbe';

SELECT t.ID, t.Titre, t.TexteProbleme, t.DateCreation, 
       p.NomProduit, v.NumeroVersion, se.Nom AS SystemeExploitation, s.Libelle
FROM TICKET t
JOIN STATUT s ON t.ID_STATUT = s.ID
JOIN PRODUIT p ON t.ID_PRODUIT = p.ID
JOIN VERSION v ON t.ID_VERSION = v.ID
JOIN SYSTEME_EXPLOITATION se ON t.ID_SYSTEME_EXPLOITATION = se.ID
WHERE s.Libelle = 'En Cours'
  AND p.NomProduit = @NomProduit;


-- 3. Obtenir tous les problèmes en cours pour un produit (une seule version) :
DECLARE @NomProduit NVARCHAR(100) = 'Trader en Herbe';
DECLARE @NumeroVersion NVARCHAR(50) = '1.2';


SELECT t.ID, t.Titre, t.TexteProbleme, t.DateCreation, 
       p.NomProduit, v.NumeroVersion, se.Nom AS SystemeExploitation, s.Libelle
FROM TICKET t
JOIN STATUT s ON t.ID_STATUT = s.ID
JOIN PRODUIT p ON t.ID_PRODUIT = p.ID
JOIN VERSION v ON t.ID_VERSION = v.ID
JOIN SYSTEME_EXPLOITATION se ON t.ID_SYSTEME_EXPLOITATION = se.ID
WHERE s.Libelle = 'En Cours'
  AND p.NomProduit = @NomProduit
  AND v.NumeroVersion = @NumeroVersion;


-- 4. Obtenir tous les problèmes rencontrés au cours d'une période donnée pour un produit (toutes les versions) :
DECLARE @NomProduit NVARCHAR(100) = 'Trader en Herbe';
DECLARE @DateDebut DATETIME = CONVERT(DATETIME, '2023-01-01', 120);
DECLARE @DateFin DATETIME = CONVERT(DATETIME, '2023-12-31', 120);

SELECT t.ID, t.Titre, t.TexteProbleme, t.DateCreation, 
       p.NomProduit, v.NumeroVersion, se.Nom AS SystemeExploitation, s.Libelle
FROM TICKET t
JOIN STATUT s ON t.ID_STATUT = s.ID
JOIN PRODUIT p ON t.ID_PRODUIT = p.ID
JOIN VERSION v ON t.ID_VERSION = v.ID
JOIN SYSTEME_EXPLOITATION se ON t.ID_SYSTEME_EXPLOITATION = se.ID
WHERE p.NomProduit = @NomProduit
  AND t.DateCreation BETWEEN @DateDebut AND @DateFin;


-- 5. Obtenir tous les problèmes rencontrés au cours d'une période donnée pour un produit (une seule version) :
DECLARE @NomProduit NVARCHAR(100) = 'Trader en Herbe';
DECLARE @NumeroVersion NVARCHAR(50) = '1.2';
DECLARE @DateDebut DATETIME = CONVERT(DATETIME, '2023-01-01', 120);
DECLARE @DateFin DATETIME = CONVERT(DATETIME, '2023-12-31', 120);

SELECT t.ID, t.Titre, t.TexteProbleme, t.DateCreation, 
       p.NomProduit, v.NumeroVersion, se.Nom AS SystemeExploitation, s.Libelle
FROM TICKET t
JOIN STATUT s ON t.ID_STATUT = s.ID
JOIN PRODUIT p ON t.ID_PRODUIT = p.ID
JOIN VERSION v ON t.ID_VERSION = v.ID
JOIN SYSTEME_EXPLOITATION se ON t.ID_SYSTEME_EXPLOITATION = se.ID
WHERE p.NomProduit = @NomProduit
  AND v.NumeroVersion = @NumeroVersion
  AND t.DateCreation BETWEEN @DateDebut AND @DateFin;


6. Obtenir tous les problèmes en cours contenant une liste de mots-clés (tous les produits) :
DECLARE @MotsCles NVARCHAR(MAX) = 'Connexion, Erreur';

SELECT DISTINCT t.ID, t.Titre, t.TexteProbleme, t.DateCreation, 
       p.NomProduit, v.NumeroVersion, se.Nom AS SystemeExploitation, s.Libelle

FROM TICKET t
JOIN STATUT s ON t.ID_STATUT = s.ID
JOIN PRODUIT p ON t.ID_PRODUIT = p.ID
JOIN VERSION v ON t.ID_VERSION = v.ID
JOIN SYSTEME_EXPLOITATION se ON t.ID_SYSTEME_EXPLOITATION = se.ID
WHERE s.Libelle = 'En Cours'
  AND t.MotsCles LIKE '%' + REPLACE(@MotsCles, ', ', '%') + '%';


-- 7. Obtenir tous les problèmes en cours pour un produit contenant une liste de mots-clés (toutes les versions) :
DECLARE @NomProduit NVARCHAR(100) = 'Trader en Herbe';
DECLARE @MotsCles NVARCHAR(MAX) = 'Connexion, Erreur';

SELECT DISTINCT t.ID, t.Titre, t.TexteProbleme, t.DateCreation, 
       p.NomProduit, v.NumeroVersion, se.Nom AS SystemeExploitation, t.MotsCles, s.Libelle
FROM TICKET t
JOIN STATUT s ON t.ID_STATUT = s.ID
JOIN PRODUIT p ON t.ID_PRODUIT = p.ID
JOIN VERSION v ON t.ID_VERSION = v.ID
JOIN SYSTEME_EXPLOITATION se ON t.ID_SYSTEME_EXPLOITATION = se.ID
WHERE s.Libelle = 'En Cours'
  AND p.NomProduit = @NomProduit
  AND t.MotsCles LIKE '%' + REPLACE(@MotsCles, ', ', '%') + '%';


-- 8. Obtenir tous les problèmes rencontrés au cours d'une période donnée pour un produit contenant une liste de mots-clés (toutes les versions) :
DECLARE @NomProduit NVARCHAR(100) = 'Trader en Herbe';
DECLARE @DateDebut DATETIME = CONVERT(DATETIME, '2023-01-01', 120);
DECLARE @DateFin DATETIME = CONVERT(DATETIME, '2023-12-31', 120);
DECLARE @MotsCles NVARCHAR(MAX) = 'Connexion, Erreur';

SELECT DISTINCT t.ID, t.Titre, t.TexteProbleme, t.DateCreation, 
       p.NomProduit, v.NumeroVersion, se.Nom AS SystemeExploitation
FROM TICKET t
JOIN PRODUIT p ON t.ID_PRODUIT = p.ID
JOIN VERSION v ON t.ID_VERSION = v.ID
JOIN SYSTEME_EXPLOITATION se ON t.ID_SYSTEME_EXPLOITATION = se.ID
WHERE p.NomProduit = @NomProduit
  AND t.DateCreation BETWEEN @DateDebut AND @DateFin
  AND t.MotsCles LIKE '%' + REPLACE(@MotsCles, ', ', '%') + '%';


-- 9. Obtenir tous les problèmes rencontrés au cours d'une période donnée pour un produit contenant une liste de mots-clés (une seule version) :
DECLARE @NomProduit NVARCHAR(100) = 'Maître des Investissements';
DECLARE @NumeroVersion NVARCHAR(50) = '2.0';
DECLARE @DateDebut DATETIME = CONVERT(DATETIME, '2023-01-01', 120);
DECLARE @DateFin DATETIME = CONVERT(DATETIME, '2023-12-31', 120);
DECLARE @MotsCles NVARCHAR(MAX) = 'Calcul, Profits';

SELECT DISTINCT t.ID, t.Titre, t.TexteProbleme, t.DateCreation, 
       p.NomProduit, v.NumeroVersion, se.Nom AS SystemeExploitation
FROM TICKET t
JOIN PRODUIT p ON t.ID_PRODUIT = p.ID
JOIN VERSION v ON t.ID_VERSION = v.ID
JOIN SYSTEME_EXPLOITATION se ON t.ID_SYSTEME_EXPLOITATION = se.ID
WHERE p.NomProduit = @NomProduit
  AND v.NumeroVersion = @NumeroVersion
  AND t.DateCreation BETWEEN @DateDebut AND @DateFin
  AND (t.MotsCles LIKE '%Calcul%' OR t.MotsCles LIKE '%Profits%')


-- 10. Obtenir tous les problèmes résolus (tous les produits) :
SELECT t.ID, t.Titre, t.TexteProbleme, t.DateCreation, t.DateResolution, 
       p.NomProduit, v.NumeroVersion, se.Nom AS SystemeExploitation, s.Libelle
FROM TICKET t

JOIN STATUT s ON t.ID_STATUT = s.ID
JOIN PRODUIT p ON t.ID_PRODUIT = p.ID
JOIN VERSION v ON t.ID_VERSION = v.ID
JOIN SYSTEME_EXPLOITATION se ON t.ID_SYSTEME_EXPLOITATION = se.ID
WHERE s.Libelle = 'Résolu'


-- 11. Obtenir tous les problèmes résolus pour un produit (toutes les versions) :
DECLARE @NomProduit NVARCHAR(100) = 'Planificateur d''Anxiété Sociale';

SELECT t.ID, t.Titre, t.TexteProbleme, t.DateCreation, t.DateResolution, 
       p.NomProduit, v.NumeroVersion, se.Nom AS SystemeExploitation, s.Libelle
FROM TICKET t
JOIN PRODUIT p ON t.ID_PRODUIT = p.ID
JOIN VERSION v ON t.ID_VERSION = v.ID
JOIN SYSTEME_EXPLOITATION se ON t.ID_SYSTEME_EXPLOITATION = se.ID
JOIN STATUT s ON t.ID_STATUT = s.ID
WHERE s.Libelle = 'Résolu'
  AND p.NomProduit = @NomProduit;


-- 12. Obtenir tous les problèmes résolus au cours d'une période donnée pour un produit (toutes les versions) :
DECLARE @NomProduit NVARCHAR(100) = 'Trader en Herbe';
DECLARE @DateDebut DATETIME = CONVERT(DATETIME, '2023-01-01', 120);
DECLARE @DateFin DATETIME = CONVERT(DATETIME, '2023-12-31', 120);

SELECT t.ID, t.Titre, t.TexteProbleme, t.DateCreation, t.DateResolution, 
       p.NomProduit, v.NumeroVersion, se.Nom AS SystemeExploitation, s.Libelle
FROM TICKET t
JOIN PRODUIT p ON t.ID_PRODUIT = p.ID
JOIN VERSION v ON t.ID_VERSION = v.ID
JOIN SYSTEME_EXPLOITATION se ON t.ID_SYSTEME_EXPLOITATION = se.ID
JOIN STATUT s ON t.ID_STATUT = s.ID
WHERE s.Libelle = 'Résolu'
  AND p.NomProduit = @NomProduit
  AND t.DateResolution BETWEEN @DateDebut AND @DateFin;


-- 13. Obtenir tous les problèmes résolus contenant une liste de mots-clés (tous les produits) :
DECLARE @MotsCles NVARCHAR(MAX) = 'Calcul, Notifications';

SELECT DISTINCT t.ID, t.Titre, t.TexteProbleme, t.DateCreation, t.DateResolution, 
       p.NomProduit, v.NumeroVersion, se.Nom AS SystemeExploitation, s.Libelle
FROM TICKET t
JOIN PRODUIT p ON t.ID_PRODUIT = p.ID
JOIN VERSION v ON t.ID_VERSION = v.ID
JOIN SYSTEME_EXPLOITATION se ON t.ID_SYSTEME_EXPLOITATION = se.ID
JOIN STATUT s ON t.ID_STATUT = s.ID
WHERE s.Libelle = 'Résolu'
  AND (t.MotsCles LIKE '%Calcul%' OR t.MotsCles LIKE '%Profits%')


-- 14. Obtenir tous les problèmes résolus pour un produit contenant une liste de mots-clés (toutes les versions) :
DECLARE @NomProduit NVARCHAR(100) = 'Maître des Investissements'; 
DECLARE @MotsCles NVARCHAR(MAX) = 'Calcul, Profits';

SELECT DISTINCT t.ID, t.Titre, t.TexteProbleme, t.DateCreation, t.DateResolution, 
       p.NomProduit, v.NumeroVersion, se.Nom AS SystemeExploitation, s.Libelle
FROM TICKET t
JOIN PRODUIT p ON t.ID_PRODUIT = p.ID
JOIN VERSION v ON t.ID_VERSION = v.ID
JOIN SYSTEME_EXPLOITATION se ON t.ID_SYSTEME_EXPLOITATION = se.ID
JOIN STATUT s ON t.ID_STATUT = s.ID
WHERE s.Libelle = 'Résolu'
  AND p.NomProduit = @NomProduit
  AND (t.MotsCles LIKE '%Calcul%' OR t.MotsCles LIKE '%Profits%')



-- 15. Obtenir tous les problèmes résolus au cours d'une période donnée pour un produit contenant une liste de mots-clés (toutes les versions) :
DECLARE @NomProduit NVARCHAR(100) = 'Maître des Investissements'; 
DECLARE @DateDebut DATETIME = CONVERT(DATETIME, '2023-01-01', 120); 
DECLARE @DateFin DATETIME = CONVERT(DATETIME, '2023-12-31', 120);
DECLARE @MotsCles NVARCHAR(MAX) = 'Calcul, Rentabilité';

SELECT DISTINCT t.ID, t.Titre, t.TexteProbleme, t.DateCreation, t.DateResolution, 
       p.NomProduit, v.NumeroVersion, se.Nom AS SystemeExploitation, s.Libelle
FROM TICKET t
JOIN PRODUIT p ON t.ID_PRODUIT = p.ID
JOIN VERSION v ON t.ID_VERSION = v.ID
JOIN SYSTEME_EXPLOITATION se ON t.ID_SYSTEME_EXPLOITATION = se.ID
JOIN STATUT s ON t.ID_STATUT = s.ID
WHERE s.Libelle = 'Résolu'
  AND p.NomProduit = @NomProduit
  AND t.DateResolution BETWEEN @DateDebut AND @DateFin
  AND (t.MotsCles LIKE '%Calcul%' OR t.MotsCles LIKE '%Profits%')

