-- *** TABLES du Modèle EA NexaWorks BDD ***

-- 1. Table PRODUIT
CREATE TABLE PRODUIT (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    NomProduit NVARCHAR(100) NOT NULL
);

-- 2. Table VERSION
CREATE TABLE VERSION (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    NumeroVersion NVARCHAR(50) NOT NULL
);

-- 3. Table SYSTEME_EXPLOITATION
CREATE TABLE SYSTEME_EXPLOITATION (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Nom NVARCHAR(100) NOT NULL
);

-- 4. Table TICKET
CREATE TABLE TICKET (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Titre NVARCHAR(255) NOT NULL,
    TexteProbleme NVARCHAR(MAX),
    DateCreation DATETIME NOT NULL DEFAULT GETDATE(),
    DateResolution DATETIME,
    TexteResolution NVARCHAR(MAX),
    MotsCles NVARCHAR(255) NOT NULL,
    ID_PRODUIT INT NOT NULL,
    ID_VERSION INT NOT NULL,
    ID_SYSTEME_EXPLOITATION INT NOT NULL,
    ID_STATUT INT NOT NULL

-- *** (FK) Ajoutées après avec ALTER TABLE ***
    FOREIGN KEY (ID_PRODUIT) REFERENCES PRODUIT(ID),
    FOREIGN KEY (ID_VERSION) REFERENCES VERSION(ID),
    FOREIGN KEY (ID_SYSTEME_EXPLOITATION) REFERENCES SYSTEME_EXPLOITATION(ID),
    FOREIGN KEY (ID_STATUT) REFERENCES STATUT(ID)

);

-- 5. Table STATUT
CREATE TABLE STATUT (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Libelle (NVARCHAR(50)) NOT NULL
);

-- 6. Table de jonction PRODUIT_VERSION
CREATE TABLE PRODUIT_VERSION (
    ID_PRODUIT INT NOT NULL,
    ID_VERSION INT NOT NULL,
    PRIMARY KEY (ID_PRODUIT, ID_VERSION),
    FOREIGN KEY (ID_PRODUIT) REFERENCES PRODUIT(ID),
    FOREIGN KEY (ID_VERSION) REFERENCES VERSION(ID)
);

-- 7. Table de jonction VERSION_SYSTEME_EXPLOITATION
CREATE TABLE VERSION_SYSTEME (
    ID_VERSION INT NOT NULL,
    ID_SYSTEME INT NOT NULL,
    PRIMARY KEY (ID_VERSION, ID_SYSTEME),
    FOREIGN KEY (ID_VERSION) REFERENCES VERSION(ID),
    FOREIGN KEY (ID_SYSTEME) REFERENCES SYSTEME_EXPLOITATION(ID)
);
