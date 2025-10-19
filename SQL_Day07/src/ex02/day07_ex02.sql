( SELECT pizzeria.name, COUNT(pizzeria_id) AS count, 'order' AS action_type FROM person_order p_o
JOIN menu ON  menu.id = p_o.menu_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.NAME
ORDER BY count DESC
LIMIT 3 )
UNION
( SELECT pizzeria.name, COUNT(pizzeria_id) AS count, 'visit' AS action_type FROM person_visits p_v
JOIN pizzeria ON pizzeria.id = p_v.pizzeria_id
GROUP BY pizzeria.NAME
ORDER BY count DESC
LIMIT 3 )
ORDER BY action_type ASC, count DESC