SELECT name FROM menu 
JOIN person_order ON person_order.menu_id = menu.id
JOIN person ON person_order.person_id = person.id 
WHERE person.gender = 'male' AND address IN ('Moscow', 'Samara') AND 
(menu.pizza_name = 'pepperoni pizza' OR menu.pizza_name = 'mushroom pizza')
ORDER BY 1 DESC; 