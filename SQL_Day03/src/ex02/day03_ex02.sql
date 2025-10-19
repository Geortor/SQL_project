SELECT menu.pizza_name, menu.price, pizzeria.name
FROM menu
LEFT JOIN person_order po ON menu.id = po.menu_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE po.menu_id IS NULL
ORDER BY 1,2