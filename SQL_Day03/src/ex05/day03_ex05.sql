SELECT pizzeria.name FROM person_visits pv
FULL JOIN person_order po ON po.order_date = pv.visit_date
JOIN pizzeria ON pizzeria.id = pv.pizzeria_id
JOIN person ON person.id = pv.person_id
WHERE person.name = 'Andrey' AND order_date is NULL
ORDER BY 1
---COMPLETED