CREATE DATABASE golf;
-- Créer la BDD "golf"

CREATE TABLE utilisateurs
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(255),
    lastname VARCHAR(225),
    email LONGTEXT
);
-- Créer la table "utilisateurs"

CREATE TABLE golfeurs
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(255),
    lastname VARCHAR(225),
    email LONGTEXT
);
-- Créer la table "golfeurs"

INSERT INTO golfeurs (firstname, lastname, email) VALUES ('John', 'LEGEND', 'j.legend@gmail.com');
-- Créer le golfeur "John LEGEND"
INSERT INTO utilisateurs (firstname, lastname, email) VALUES ('Jack', 'SPARROW', 'jack_sparrow@yahoo.fr');
INSERT INTO golfeurs (firstname, lastname, email) VALUES ('Tim', 'COOK', 'tc@windobe.com');
INSERT INTO golfeurs (firstname, lastname, email) VALUES ('Harley', 'DAVIDSON', 'h-d@suzukiki.fr');
INSERT INTO utilisateurs (firstname, lastname, email) VALUES ('David', 'GOLIATH', 'jaibeaucoupriz@wanadoo.fr');

ALTER TABLE utilisateurs ADD age INT;
ALTER TABLE golfeurs ADD age INT;
-- Ajoute la colonne "age" aux tables "utilisateurs" et "golfeurs"

UPDATE golfeurs SET age = 78 WHERE firstname = 'John' AND lastname = 'LEGEND';
-- Ajoute l'âge de John LEGEND (78 ans) en se basant sur son nom
UPDATE utilisateurs SET age = 2 WHERE firstname = 'Jack' AND lastname = 'SPARROW';
UPDATE golfeurs SET age = 30 WHERE firstname = 'Tim' AND lastname = 'COOK';
UPDATE golfeurs SET age = 200 WHERE firstname = 'Harley' AND lastname = 'DAVIDSON';
UPDATE utilisateurs SET age = 3000 WHERE firstname = 'David' AND lastname = 'GOLIATH';

ALTER TABLE golfeurs DROP COLUMN email;
-- Supprime la colonne "email" de la table "golfeurs"

DELETE FROM utilisateurs WHERE firstname = 'David' AND lastname = 'GOLIATH';
-- Supprime l'utilisateur David GOLIATH en se basant sur son nom
DELETE FROM golfeurs WHERE firstname = 'Tim' AND lastname = 'COOK';

DELETE FROM utilisateurs;
-- Vides les informations de la table "utilisateurs"
DELETE FROM golfeurs;

DROP DATABASE golf;
-- Supprime la BDD "golf"