SELECT menu.pizza_name, price, pizzeria.name, visit_date FROM person_visits
JOIN menu ON person_visits.pizzeria_id = menu.pizzeria_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
JOIN person ON person_visits.person_id = person.id 
WHERE person.name = 'Kate' AND menu.price BETWEEN 800 and 1000
ORDER BY 1, 2, 3