SELECT address, pizzeria.name, COUNT(menu_id) FROM person_order p_o
JOIN menu ON p_o.menu_id = menu.id
JOIN person ON p_o.person_id = person.id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY address, pizzeria.name
ORDER BY 1, 2