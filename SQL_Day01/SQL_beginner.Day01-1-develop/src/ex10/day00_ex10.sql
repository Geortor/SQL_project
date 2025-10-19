SELECT person.name AS person_name, pizza_name, pizzeria.name AS pizzeria_name
FROM person_order
INNER JOIN person ON person_order.person_id = person.id
INNER JOIN menu ON person_order.menu_id = menu.id
INNER JOIN pizzeria ON  pizzeria.id = menu.pizzeria_id
ORDER BY 1 ASC, 2 ASC, 3 ASC
