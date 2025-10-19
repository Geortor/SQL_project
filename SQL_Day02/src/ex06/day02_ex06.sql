SELECT menu.pizza_name, pizzeria.name AS pizzeria_name FROM menu 
JOIN  pizzeria ON menu.pizzeria_id = pizzeria.id
JOIN  person_order ON menu.id = person_order.menu_id
WHERE  person_order.person_id IN 
    (SELECT id FROM person WHERE name IN ('Anna', 'Denis'))
ORDER BY 1, 2; 