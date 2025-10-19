-- Active: 1737051226311@@127.0.0.1@5432@TEAM00
SELECT person.name, COUNT(pizzeria_id) AS count_of_visits FROM person_visits
JOIN person ON person_visits.person_id = person.id
GROUP BY person.name
ORDER BY 2 DESC, 1 ASC
LIMIT 4