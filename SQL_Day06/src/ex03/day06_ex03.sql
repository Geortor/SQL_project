CREATE UNIQUE INDEX idx_person_discounts_unique
ON person_discounts (person_id, pizzeria_id)

----------

SET ENABLE_SEQSCAN = OFF; 
EXPLAIN ANALYZE
SELECT person.name, pizza_name, price, CAST(price - (price * (discount / 100)) AS INT) AS discount_price, pizzeria.name FROM person_order p_o
JOIN person ON p_o.person_id = person.id
JOIN menu ON p_o.menu_id = menu.id
JOIN person_discounts p_d ON person.id = p_d.person_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY person.name, pizza_name 