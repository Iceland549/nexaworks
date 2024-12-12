# Projet NexaWorks - Gestion des problèmes logiciels

## Table des matières

1. Description du projet
2. Modèle Entité-Association (EA)
   - Entités principales
   - Relations clés
3. Structure de la base de données
4. Installation et utilisation
5. Conclusion

---

## 1. Description du projet

NexaWorks est une base de données relationnelle conçue pour suivre les problèmes logiciels à travers différents produits, versions et systèmes d'exploitation. Elle permet une gestion efficace des tickets et facilite le suivi des résolutions.

---

## 2. Modèle Entité-Association (EA)

Le modèle EA ci-dessous représente la structure de la base de données NexaWorks. Voici les principales entités et leurs relations :

### Entités principales

- **PRODUIT** : Représente les différents produits logiciels.
- **VERSION** : Contient les versions de chaque produit.
- **SYSTEME_EXPLOITATION** : Liste les systèmes d'exploitation supportés.
- **TICKET** : Stocke les informations sur les problèmes signalés.
- **STATUT** : Indique l'état actuel de chaque ticket.

---

### Relations clés

#### Produit ↔ Version

1. **Un Produit** peut être associé à **plusieurs Versions** (cardinalité 1,N du côté Produit).  
   **Clé étrangère :** `ID_Produit` dans la table **Version**.
2. **Une Version** appartient obligatoirement à **un seul Produit** (cardinalité 1,1 du côté Version).

#### Version ↔ Système d'Exploitation

1. **Une Version** peut être compatible avec **plusieurs Systèmes d'Exploitation** (cardinalité 1,N).
2. **Un Système d'Exploitation** peut être compatible avec **plusieurs Versions** (cardinalité 1,N).  
   **Table de jonction :** **Version_Système_Exploitation** :
   - `ID_Version` (référence à **Version**)
   - `ID_Systeme_Exploitation` (référence à **Système_Exploitation**).

#### Produit ↔ Ticket

1. **Un Produit** peut être référencé dans **plusieurs Tickets** (cardinalité 1,N).  
   **Clé étrangère :** `ID_Produit` dans la table **Ticket**.
2. **Un Ticket** est obligatoirement associé à **un seul Produit** (cardinalité 1,1).

#### Version ↔ Ticket

1. **Une Version** peut être liée à **plusieurs Tickets** (cardinalité 1,N).  
   **Clé étrangère :** `ID_Version` dans la table **Ticket**.
2. **Un Ticket** est obligatoirement associé à **une seule Version** (cardinalité 1,1).

#### Système d'Exploitation ↔ Ticket

1. **Un Système d'Exploitation** peut être mentionné dans **plusieurs Tickets** (cardinalité 1,N).  
   **Clé étrangère :** `ID_Systeme_Exploitation` dans la table **Ticket**.
2. **Un Ticket** est obligatoirement associé à **un seul Système d'Exploitation** (cardinalité 1,1).

#### Statut ↔ Ticket

1. **Un Statut** peut être utilisé pour **plusieurs Tickets** (cardinalité 1,N).  
   **Clé étrangère :** `ID_Statut` dans la table **Ticket**.
2. **Un Ticket** possède obligatoirement **un seul Statut** (cardinalité 1,1).

---

### Tables de jonction

#### Version ↔ Système_Exploitation

1. **Une Version** peut être compatible avec **plusieurs Systèmes d'Exploitation**.
2. **Un Système d'Exploitation** peut être compatible avec **plusieurs Versions**.  
   **Structure :**
   - `ID_Version` (référence à **Version**).
   - `ID_Systeme_Exploitation` (référence à **Système_Exploitation**).

#### Produit ↔ Produit_Version

1. **Une Version** peut être associée à **plusieurs Produits**.
2. **Un Produit** peut être associé à **plusieurs Versions**.  
   **Structure :**
   - `ID_Produit` (référence à **Produit**).
   - `ID_Version` (référence à **Version**).

---

## 3. Structure de la base de données

La base de données comprend les tables suivantes :

1. **PRODUIT** : Contient les produits logiciels.
2. **VERSION** : Regroupe les versions de chaque produit.
3. **SYSTEME_EXPLOITATION** : Liste les systèmes d'exploitation pris en charge.
4. **TICKET** : Permet de suivre les problèmes signalés.
5. **STATUT** : Définit l'état des tickets.
6. **VERSION_SYSTEME_EXPLOITATION** : Table de jonction entre Version et Système d'Exploitation.
7. **PRODUIT_VERSION** : Table de jonction entre Produit et Version.

---

## 4. Installation et utilisation

1. Clonez ce dépôt GitHub "https://github.com/Iceland549/nexaworks" sur votre machine locale.

2. Assurez-vous d'avoir SQL Server Management Studio (SSMS) installé sur votre système.

3. Ouvrez SSMS et connectez-vous à votre serveur SQL.

4. Pour créer la base de données et les tables, exécutez le script `create-database.sql`.

5. Pour insérer les données initiales, exécutez le script `insert-data.sql`.

6. Pour tester la base de données, vous pouvez utiliser les requêtes fournies dans le fichier `queries.sql`.

7. Les 25 tickets d'exemple sont inclus dans le script d'insertion des données.

Pour toute question ou problème, veuillez consulter la documentation complète fournie dans le fichier PDF.

---

## 5. Conclusion

Ce document présente une vue d'ensemble du projet NexaWorks, en détaillant le modèle relationnel et les structures de données nécessaires pour une gestion efficace des tickets logiciels. 
