SELECT
    (SELECT name FROM person WHERE id = person_id) AS person_name,
	(SELECT name FROM pizzeria WHERE id = pizzeria_id ) AS pizzeria_name
FROM 
	(SELECT * FROM person_visits WHERE visit_date BETWEEN '2022/01/07' and '2022/01/09') AS pv -- this is an internal query in a main FROM clause
ORDER BY person_name ASC, pizzeria_name DESC
