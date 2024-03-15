SELECT name AS "Continent" FROM regions
WHERE id IN (
    SELECT region_id FROM subregions
    GROUP BY region_id
    HAVING COUNT(*) > 2);
-- Sélectionne les noms des continents (regions) qui ont plus de 2 sous-continents (subregions), utiliser des alias

SELECT name AS "Nom du pays" FROM countries
WHERE id IN (
    SELECT country_id FROM states
    WHERE latitude > 40);
-- Sélectionne les noms des pays qui ont des États avec des coordonnées de latitude supérieures à 40, utiliser des alias

SELECT name FROM states
WHERE id IN (
    SELECT state_id FROM cities
    WHERE name LIKE "New%");
-- Sélectionne les noms des États qui ont des villes avec des noms commençant par « New »

SELECT name AS "Continent" FROM regions
WHERE id IN (
    SELECT region_id FROM subregions);
-- Sélectionne les noms des continents (regions) ayant au moins un sous-continents(subregion), utiliser des alias pour les 
-- résultats et l’appel des tables

SELECT name FROM regions
WHERE id IN (
    SELECT region_id FROM countries
    WHERE latitude < 35);
-- Sélectionne les noms des continents (regions) comprenant des pays ayant une latitude inférieure à 35

SELECT r.name AS "Continent" FROM regions AS r
WHERE EXISTS (
    SELECT s.name FROM subregions as s
    WHERE r.id = s.region_id);
-- Sélectionne les noms des continents (regions) pour qui il existe des sous-continents (subregions) existants, utiliser des alias 
-- pour les résultats et l’appel des tables (EXISTS)

SELECT c.name AS "¨Pays" FROM countries AS C
WHERE EXISTS (
    SELECT s.name FROM states AS s
    WHERE c.id = s.country_id
    AND s.latitude > 50);
-- Sélectionne les noms des pays pour qui il existe des États avec une latitude supérieure à 50 existants, utiliser des alias (EXISTS)

SELECT s.name FROM states AS s
WHERE EXISTS (
    SELECT c.id FROM cities AS c
    WHERE c.state_id = s.idAND c.name LIKE "New%");
-- Sélectionne les noms des États pour lesquels il existe au moins une ville avec un nom commençant par "New", utiliser des alias (EXISTS)

SELECT r.name FROM regions AS r
WHERE EXISTS (
    SELECT s.region_id FROM subregions AS s
    WHERE r.id = s.region_id
    GROUP BY s.region_id
    HAVING COUNT(*) > 2);
-- Sélectionne les noms des continents (regions) pour lesquels il existe plus de deux sous-continents (subregions), utiliser des alias (EXISTS)

SELECT c.name AS "Pays" FROM countries AS c
WHERE NOT EXISTS (
    SELECT st.country_id FROM states AS st
    WHERE st.country_id = c.id);
-- Sélectionne les pays pour lesquels il n’existe aucun État, utiliser des alias (EXISTS)

SELECT name FROM cities
WHERE created_at > ALL (
    SELECT MAX(created_at) FROM countries);
-- Sélectionne les villes qui ont été créées après la création du dernier pays (ALL)

SELECT region_id FROM subregions
GROUP BY region_id
HAVING COUNT(*) >= ALL (
    SELECT COUNT(*) FROM subregions
    GROUP BY region_id);
-- Sélectionne les continents avec le plus grand nombre de sous-continents (ALL)

SELECT country_id from cities
GROUP BY country_id
HAVING COUNT(*) >= ALL (
    SELECT COUNT(*) FROM cities
    GROUP BY country_id);
-- Sélectionne les pays avec le plus grand nombre de villes (ALL)

SELECT name FROM countries
WHERE id = ALL (
    SELECT country_id FROM states
    WHERE latitude >= ALL (
        SELECT MAX(latitude) FROM states));
-- Sélectionne le pays avec la latitude la plus élevée (ALL)

SELECT name FROM regions
WHERE id = ALL (
    SELECT region_id FROM countries
    GROUP BY region_id
    HAVING COUNT(*) <= ALL(
        SELECT COUNT(*) FROM countries
        GROUP BY region_id));
-- Sélectionne la région avec le moins de pays (ALL)


-- Sélectionne l’identifiant du pays à qui est associée la ville avec la plus grande latitude (ANY)


-- Séléctionne les noms des continents qui possèdent au moins un sous-sontinent associé (ANY)


-- Sélectionne les noms des villes associées à la « France » (ANY)


-- Sélectionne le nom du pays à qui est associée la ville avec la latitude la plus basse (ANY)


-- Sélectionne les continents qui possèdent plus de 2 sous-continents associés (ANY)