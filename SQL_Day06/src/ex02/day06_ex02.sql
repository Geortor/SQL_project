-- Active: 1737051226311@@127.0.0.1@5432@postgres
SELECT person.name, pizza_name, menu.price, ROUND(menu.price - (menu.price * (discount/ 100)), 2) AS discount_price, pizzeria.name FROM person_order p_o
JOIN person ON p_o.person_id = person.id
JOIN menu ON p_o.menu_id = menu.id
JOIN person_discounts p_d ON person.id = p_d.person_id AND menu.pizzeria_id = p_d.pizzeria_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY 1, 2 