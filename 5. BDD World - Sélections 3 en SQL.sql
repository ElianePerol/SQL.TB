SELECT country_id, country_code FROM cities 
UNION 
SELECT country_id, country_code FROM states;
-- Sélectionne les identifiants et codes de pays des villes et des états sans doublon

SELECT id, name, created_at FROM regions
WHERE id BETWEEN 1 AND 3
UNION
SELECT id, name, created_at FROM countries
WHERE id BETWEEN 1 AND 3;
-- Sélectionne les identifiants, noms et dates de créations des continents des tables : 
-- continent (regions) et pays (countries) si l’identifiant du continent est compris entre 1 et 3 sans doublon

SELECT id, country_code FROM cities
WHERE country_code LIKE "%A%"
UNION
SELECT country_id, country_code FROM states
WHERE country_code LIKE "%A%";
-- Sélectionne les identifiants et codes de pays des villes et des états si les codes de pays contiennent la lettre « A » sans doublon

SELECT id, created_at FROM regions
WHERE id BETWEEN 1 AND 10
UNION
SELECT id, created_at FROM subregions
WHERE id BETWEEN 1 AND 10;
-- Sélectionne les identifiants et dates de création des continents et sous-continents si les identifiants sont compris entre 1 et 10 sans doublon

SELECT country_code FROM cities
WHERE country_id BETWEEN 1 AND 10
UNION
SELECT country_code FROM states
WHERE country_id BETWEEN 1 AND 10;
-- Sélectionne les identifiants et codes de pays des villes et des états si les codes de pays sont compris entre 1 et 10

SELECT country_id, country_code FROM cities
UNION ALL
SELECT country_id, country_code FROM states;
-- Sélectionne les identifiants et codes de pays des villes et des états avec possibles doublons

SELECT id, name, created_at FROM regions
WHERE id BETWEEN 1 AND 3
UNION ALL
SELECT region_id, region, created_at FROM countries
WHERE region_id BETWEEN 1 AND 3;
-- Sélectionne les identifiants, noms et dates de créations des continents tables : continent (regions) 
-- et pays (countries) si l’identifiant du continent est compris entre 1 et 3 avec possibles doublons

SELECT id, country_code FROM cities
WHERE country_code LIKE "%A%"
UNION ALL
SELECT country_id, country_code FROM states
WHERE country_code LIKE "%A%";
-- Sélectionne les identifiants et codes de pays des villes et des états si les codes de pays contiennent 
-- a lettre « A » avec possibles doublon

SELECT id, created_at FROM regions
WHERE id BETWEEN 1 AND 10
UNION ALL
SELECT id, created_at FROM subregions
WHERE id BETWEEN 1 AND 10;
-- Sélectionne les identifiants et dates de création des continents et sous-continents si les identifiants
--  sont compris entre 1 et 10 avec possibles doublons

SELECT * FROM countries
WHERE id IN (
    SELECT country_id FROM cities);
-- Sélectionne les pays dont les identifiants correspondent à ceux référencés dans la table des villes (INTERSECT - VERSION MySQL Workbench)

SELECT * FROM countries
WHERE id IN (
    SELECT country_id FROM cities)
AND iso2 LIKE "%E";
-- Sélectionne les pays dont les identifiants correspondent à ceux référencés dans la table des villes 
-- si le code ISO2 du pays termine par un « E » (INTERSECT - VERSION MySQL Workbench)

SELECT * FROM states
WHERE id IN (
    SELECT country_id FROM cities
);
-- Sélectionne les États dont les identifiants correspondent à ceux référencés dans la table des villes (INTERSECT - VERSION MySQL Workbench)

SELECT * FROM states
WHERE id IN (
    SELECT country_id FROM cities
    WHERE id BETWEEN 1 and 200
);
-- Sélectionne les états dont les identifiants correspondent à ceux des pays référencés dans les 200
--  premières entrées de la table des villes (INTERSECT - VERSION MySQL Workbench)

SELECT id, iso2 FROM countries
EXCEPT
SELECT country_id, country_code FROM cities;
-- Sélectionne les identifiants et les codes ISO2 des pays en excluant ceux qui sont dans la table des villes (EXCEPT)

SELECT country_id, country_code FROM states
EXCEPT
SELECT country_id, country_code FROM cities;
-- Sélectionne les identifiants et les codes des pays de la table des États en excluant ceux qui sont dans la table des villes (EXCEPT)