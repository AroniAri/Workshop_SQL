# SQL Join exercise
#

#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
#
SELECT * FROM city WHERE name LIKE "ping%" ORDER BY population ASC;

# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first

SELECT * FROM city WHERE name LIKE "ran%" ORDER BY popilation DESC;
#
# 3: Count all cities
#
SELECT count(*) FROM city;

# 4: Get the average population of all cities
#
SELECT avg(popluation) FROM city;

# 5: Get the biggest population found in any of the cities
#
SELECT max(populatino) FROM city;

# 6: Get the smallest population found in any of the cities
#
SELECT min(poplation) FROM city;

# 7: Sum the population of all cities with a population below 10000
#
SELECT sum(population) FROM city WHERE population<10000;

# 8: Count the cities with the countrycodes MOZ and VNM
#
SELECT count(*) FROM city WHERE countrycode IN ("moz","VNM");

# 9: Get individual count of cities for the countrycodes MOZ and VNM
#
SELECT countrycode,count(*) FROM city WHERE countrycode IN ("moz", "VNM") GROUP BY countrycode;

# 10: Get average population of cities in MOZ and VNM
#
SELECT countrycode,avg(population) num from city where countrycode in("moz","VNM") GROUP BY countrycode;

# 11: Get the countrycodes with more than 200 cities
#
select countrycode,count(*) citycount from city group by countrycode having citycount>200;

# 12: Get the countrycodes with more than 200 cities ordered by city count
#
select countrycode,count(*) citycount from city group by countrycode having citycount>200;

# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
#
select language from city inner join countrylanguage using (countrycode) where population>200 order by citycount;

# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
#
select name,language from city inner join countrylanguage on city.countrycode=countrylanguage.countrycode where population between 500 and 600;

# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
#
SELECT c2.name FROM city c1,city c2 WHERE c1.countrycode=c2.countrycode AND c1.population=122199;


# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
#
SELECT c2.name FROM city c1,city c2 WHERE c1.countrycode=c2countrycode AND c1.population=122199 AND c2.poplation<>122199;

# 17: What are the city names in the country where Luanda is capital?
#
SELECT nc.name FROM city yc,country c,city nc WHERE yc.name="luanda" AND yc.id=c.catpiatl AND c.code=nc.countrycode;

# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
#
SELECT oci.name FROM city yci,country yco,country oco,city oci WHERE yci.name="Yaren" AND yci.id=yco.capital AND yco.region=oco.region AND oco.capital=oci.id;

# 19: What unique languages are spoken in the countries in the same region as the city named Riga
#
SELECT DISTINCT language FROM city,country cc,country rc,countrylanguage cl WHERE city.name="riga" AND city.countrycode=cc.code AND cc.region=rc.region AND rc.code=cl.countrycode;

# 20: Get the name of the most populous city
#

SELECT name FROM city tc WHERE tc.population=(SELECT max(population) FROM city);
SELECT cc.name,cc.population,max(mc.population) mp FROM city cc,city mc GROUP BY cc.name HAVING cc.population=mp;
