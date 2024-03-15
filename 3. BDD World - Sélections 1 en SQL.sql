SELECT * FROM countries;
-- Sélectionne tous les Pays

SELECT name, iso3 FROM countries;
-- Sélectionne tous les Pays par leur nom et leur code iso3

SELECT DISTINCT currency FROM countries;
-- Sélectionne les monnaies distinctes des pays

SELECT DISTINCT currency, currency_symbol FROM countries;
-- Sélectionne les monnaies et les symboles des monnaies distinctes des pays

SELECT name, country_code FROM cities 
WHERE country_code = "AO";
-- Sélectionne les nom des villes et le code pays dont le code pays est « AO »

SELECT * FROM cities 
WHERE country_code = "AO" 
AND state_code = "HUI";
-- Sélectionne les villes dont le code pays est « AO» et le code d'État « HUI»

SELECT * FROM cities 
WHERE country_code = "AO" 
OR country_code = "AZ";
-- Sélectionne les villes et le code pays dont le code pays est « AO » ou « AZ » en utilisant « OR »

SELECT * FROM cities 
WHERE country_code IN ("AO", "AZ");
-- Sélectionne les villes et le code pays dont le code pays est « AO » ou « AZ » en utilisant « IN »

SELECT * FROM cities 
WHERE country_code = "AO" 
AND (state_code = "HUI" OR state_code = "MOX");
-- Sélectionne les villes dont le code pays est « AO» et le code d’État « HUI» ou « MOX » en utilisant « OR »

SELECT * FROM cities 
WHERE country_code = "AO" 
AND state_code IN ("HUI", "MOX");
-- Sélectionne les villes dont le code pays est « AO» et le code d’État « HUI» ou « MOX » en utilisant « IN »

SELECT * FROM countries 
WHERE numeric_code BETWEEN 50 AND 100;
-- Sélectionne les pays dont le code numérique est compris entre 50 et 100

SELECT * FROM countries 
WHERE currency = "USD" 
AND numeric_code BETWEEN 50 AND 100;
-- Sélectionne les pays dont le la monnaie est « USD » et le code numérique est compris entre 50 et 100

SELECT * FROM cities 
WHERE country_code = "AO" 
AND (state_code = "BIE" OR longitude BETWEEN 13 AND 14); 
-- Sélectionne les villes dont le code pays est « AO » et, le code d’État est « BIE» ou la longitude est comprise entre 13 et 14

SELECT * FROM cities 
WHERE country_code = "AO" 
OR (state_code IN ("BIE", "HUI") AND longitude BETWEEN 13 and 14);
-- Sélectionne les villes dont le code pays est « AO » ou, le code d’État est « BIE» ou « HUI » et la longitude est comprise entre 13 et 14

SELECT * FROM countries WHERE name LIKE "C%";
-- Sélectionne les pays dont le nom commence par un « C»

SELECT * FROM countries 
WHERE currency = "EUR" 
AND name LIKE "_A%";
-- Sélectionne les pays dont la monnaie est « EUR » et la deuxième lettre du nom est un « A »

SELECT * FROM countries 
WHERE currency = "EUR" 
AND (name LIKE "_A%" OR numeric_code BETWEEN 200 AND 300);
-- Sélectionne les pays dont la monnaie est « EUR » et la deuxième lettre du nom est un « A » ou le code numérique est compris entre 200 et 300

SELECT * FROM countries WHERE name LIKE "A%A";
-- Sélectionne les pays dont le nom commence et termine par un « A»

SELECT * FROM countries WHERE name LIKE "A_G%";
-- Sélectionne les pays dont le nom commence par un « A» et la 3ème lettre est un « G »

SELECT * FROM countries 
WHERE name LIKE "F_E%" 
AND currency = "EUR";
-- Sélectionne les pays dont le nom commence par un « F» , la 3ème lettre est un « E» et la monnaie est « EUR »

SELECT * FROM countries WHERE name LIKE "%ENC%";
-- Sélectionne les pays dont le nom contient « ENC »

SELECT * FROM countries 
WHERE (currency = "USD" OR numeric_code BETWEEN 300 AND 500) 
AND name LIKE "%NE%";
-- Sélectionne les pays dont la monnaie est « USD » ou dont le code numérique est compris entre 300 et 500 et, le nom contient « NE »

SELECT * FROM countries WHERE name LIKE "%E_";
-- Sélectionne les pays dont l’avant-dernière lettre est un « E »

SELECT * FROM countries 
WHERE name LIKE "%E_" 
AND currency = "EUR" 
AND numeric_code BETWEEN 0 AND 300;
-- Sélectionne les pays dont l’avant-dernière lettre du nom est un « E », la monnaie est « EUR » et le code numérique est compris entre 0 et 300

SELECT * FROM cities 
WHERE country_code IN ("AD", "AE") 
AND (name LIKE "%A" OR latitude BETWEEN 40 AND 50);
-- Sélectionne les villes dont le code pays est « AD» ou « AE » et le nom se termine par « A» ou dont la latitude est comprise entre 40 et 50

SELECT * FROM countries WHERE region_id IS NULL;
-- Sélectionne les pays pour lesquels l’id région est null
