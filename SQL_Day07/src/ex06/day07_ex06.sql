SELECT pizzeria.name, 
COUNT(menu_id), 
ROUND(AVG(price), 2) AS average_price,
MAX(price) AS max_price,
MIN (price) AS min_price FROM person_order p_o
JOIN menu ON menu.id = p_o.menu_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY pizzeria.name
ORDER BY name