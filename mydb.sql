-- Activation des clés étrangères pour SQLite
PRAGMA foreign_keys = ON;

-- Création de la table des utilisateurs
CREATE TABLE IF NOT EXISTS Users (
    id_user INTEGER PRIMARY KEY,
    Nom TEXT
);

-- Création de la table Articles
CREATE TABLE IF NOT EXISTS Article (
    id_article INTEGER PRIMARY KEY,
    Nom TEXT,
    Description TEXT,
    id_user INTEGER NOT NULL,
    FOREIGN KEY (id_user) REFERENCES Users(id_user)
);

-- Création de la table Category
CREATE TABLE IF NOT EXISTS Category (
    id_category INTEGER PRIMARY KEY,
    Titre TEXT
);

-- Création de la table Tag
CREATE TABLE IF NOT EXISTS Tag (
    id_tag INTEGER PRIMARY KEY,
    Titre TEXT,
    Couleur TEXT
);

-- Création de la table de jointure Article <-> Category
CREATE TABLE IF NOT EXISTS Apartenance (
    id_article INTEGER NOT NULL,
    id_category INTEGER NOT NULL,
    PRIMARY KEY (id_article, id_category),
    FOREIGN KEY (id_article) REFERENCES Article(id_article),
    FOREIGN KEY (id_category) REFERENCES Category(id_category)
);

-- Création de la table de jointure Category <-> Tag
CREATE TABLE IF NOT EXISTS Category_Tag (
    id_category INTEGER NOT NULL,
    id_tag INTEGER NOT NULL,
    PRIMARY KEY (id_category, id_tag),
    FOREIGN KEY (id_category) REFERENCES Category(id_category),
    FOREIGN KEY (id_tag) REFERENCES Tag(id_tag)
);

-- ** INSERTIONS (Corrigées) **

-- Création d'un User (id_user = 1)
INSERT INTO Users (Nom) VALUES ('Sanou Le Magnifique');

-- Création d'une Category (id_category = 1)
INSERT INTO Category (Titre) VALUES ('Développement Web');

-- Création d'un Tag (id_tag = 1)
INSERT INTO Tag (Titre, Couleur) VALUES ('SQL', '#007ACC');

-- Création d'un Article (id_article = 1, lié à l'utilisateur 1)
INSERT INTO Article (Nom, Description, id_user) VALUES ('Comment devenir une licorne africaine', 'Le secret est dans la base de données...', 1);

-- Établir les relations N-N : Article 1 <-> Catégorie 1
INSERT INTO Apartenance (id_article, id_category) VALUES (1, 1);

-- Établir les relations N-N : Catégorie 1 <-> Tag 1
INSERT INTO Category_Tag (id_category, id_tag) VALUES (1, 1);
