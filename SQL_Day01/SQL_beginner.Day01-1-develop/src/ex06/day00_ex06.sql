SELECT person_visits.visit_date AS action_date, name
FROM person_visits
INNER JOIN person ON person_visits.person_id = person.id

INTERSECT

SELECT person_order.order_date, person.name
FROM person_order
INNER JOIN person ON person_order.person_id = person.id

ORDER BY action_date ASC, name DESC