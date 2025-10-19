SELECT pizzeria.name AS pizzeria_name FROM person_visits 
JOIN  pizzeria ON person_visits.pizzeria_id = pizzeria.id
JOIN  menu ON menu.pizzeria_id = person_visits.pizzeria_id
WHERE  person_visits.person_id IN 
    (SELECT id FROM person WHERE name IN ('Dmitriy'))
     AND menu.price <= 800
	 AND  person_visits.visit_date = '2022/01/08'
ORDER BY 1; --- это точно оно