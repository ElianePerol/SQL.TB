SELECT currency, COUNT(*) FROM countries 
GROUP BY currency;
-- Sélectionne le nombre de pays par monnaies

SELECT MAX(latitude), MIN(latitude) FROM cities;
-- Sélectionne la latitude maximum et minimum des villes

SELECT country_code, MAX(latitude), MIN(latitude) FROM cities 
GROUP BY country_code;
-- Sélectionne la latitude maximum et minimum des villes par pays

SELECT country_code, AVG(latitude) FROM cities 
GROUP BY country_code;
-- Sélectionne la moyenne de latitude des villes par pays

SELECT country_code, AVG(latitude) FROM cities 
WHERE country_code LIKE "%A%" 
GROUP BY country_code;
-- Sélectionne la moyenne de latitude des villes par pays si leur code contient un « A »

SELECT country_code, COUNT(*) FROM cities 
GROUP BY country_code WITH ROLLUP;
-- Sélectionne le nombre de villes par pays avec un résumé général

SELECT country_code, COUNT(*) FROM cities 
WHERE state_id BETWEEN 10 AND 150 
GROUP BY country_code;
-- Sélectionne le nombre de villes par pays si leur identifiant d’État est compris entre 10 et 150

SELECT country_code, AVG(latitude), MAX(latitude), MIN(latitude) FROM cities 
WHERE state_id BETWEEN 10 AND 150 
GROUP BY country_code WITH ROLLUP;
-- Sélectionne la moyenne, le maximum et le minimum des latitudes des villes par pays si leur identifiant d’État est compris entre 10 et 150 avec un résumé général

SELECT country_code, COUNT(*) FROM cities 
WHERE country_code IN ("ES", "FR") 
GROUP BY country_code;
-- Sélectionne le nombre de villes pour les pays ayant les codes « ES » et « FR »

SELECT country_code, COUNT(*) FROM cities 
GROUP BY country_code 
HAVING COUNT(*) > 5000;
-- Sélectionne le nombre de villes par pays s’il est supérieur à 50000

SELECT country_code, AVG(latitude) FROM cities 
GROUP BY country_code 
HAVING AVG(latitude) > 20 AND AVG(latitude) < 25;
-- Sélectionne la moyenne de latitude des villes par pays si elle est comprise entre 20 et 25

SELECT * FROM countries 
ORDER BY name DESC;
-- Sélectionne la liste des pays en ordre alphabétique inversé de nom

SELECT * FROM cities 
ORDER BY country_code DESC, state_code ASC;
-- Sélectionne la liste des villes en ordre alphabétique inversé de code de pays et en ordre alphabétique par code d’État

SELECT country_code, COUNT(*) FROM cities 
GROUP BY country_code 
ORDER BY COUNT(*) ASC;
-- Sélectionne le nombre de villes par pays du plus petit au plus grand

SELECT country_code, AVG(latitude) 
AS "Average latitude", MAX(latitude) 
AS "Max latitude", MIN(latitude) 
AS "Minimum latitude" 
FROM cities 
GROUP BY country_code;
-- Sélectionne la latitude moyenne, maximum et minimum des villes par pays, utiliser des alias

SELECT * FROM countries LIMIT 10;
-- Sélectionne les 10 premiers pays

SELECT name AS "Country" FROM countries LIMIT 10; 
-- Sélectionne les noms des 10 premiers pays, utiliser des alias

SELECT * FROM countries LIMIT 5, 10;
-- Sélectionne 10 pays à partir du 5ème

SELECT name FROM countries 
ORDER BY name DESC LIMIT 10;
-- Sélectionne les noms des 10 premiers pays en ordre alphabétique inversé de nom

SELECT currency 
AS "Monnaie", COUNT(name) 
AS "Nombre de Pays" 
FROM countries 
GROUP BY currency 
HAVING COUNT(name) > 2 LIMIT 10;
-- Sélectionne le nombre de pays par monnaie pour les 10 premières monnaies si leur nombre est supérieur à 2, utiliser des alias

SELECT country_code, COUNT(*) FROM cities 
WHERE latitude BETWEEN 10 AND 50 
GROUP BY country_code 
HAVING COUNT(*) > 1000;
-- Sélectionne le nombre de villes par pays si leur latitude est comprise entre 10 et 50 et le nombre est supérieur à 1000

SELECT country_code, COUNT(*) FROM cities 
WHERE state_code LIKE "%Z%" 
GROUP BY country_code 
HAVING COUNT(*) < 1000;
-- Sélectionne le nombre de villes par pays si leur code d’État contient un « Z » et le nombre est inférieur à 1000

SELECT name, 
    CASE currency 
        WHEN "EUR" THEN 'Euro'
        WHEN "USD" THEN 'Dollars'
        ELSE 'Autres monnaies'
    END 
FROM countries;
-- Sélectionne les noms des pays et afficher les catégories de monnaie EUR = « Euro », USD = « Dollars », Les autres = « Autre monnaie »

SELECT currency, COUNT(*),
CASE
    WHEN COUNT(*) > 5 THEN "Très élevé"
    WHEN COUNT(*) >= 3 THEN "Élevé"
    WHEN COUNT(*) < 3 THEN "Moyen"
END AS "Nombre de Pays"
FROM countries
GROUP BY currency
HAVING COUNT(*) >= 2;
-- Sélectionne le nombre de pays par monnaie ayant un résultat supérieur ou égal à 2 et afficher les catégories : supérieur à 5 = « Très élevé », supérieur à 3 = « Élevé », inférieur à 3 = « Moyen », utiliser des alias

SELECT country_code, AVG(latitude),
CASE
    WHEN AVG(latitude) > 10 THEN "Nord"
    WHEN AVG(latitude) < -10 THEN "Sud"
    WHEN 10 >= AVG(latitude) >= -10 THEN "Équateur"
END AS "Latitude"
FROM cities
WHERE country_code LIKE "_A%"
GROUP BY country_code;
-- Sélectionne les moyennes des latitudes des villes par pays si le code pays contient un « A » comme deuxième lettre et afficher les catégories : supérieur à 10 = « Nord », inférieur à -10 = « Sud », compris entre 10 et -10 = « Équateur », utiliser des alias