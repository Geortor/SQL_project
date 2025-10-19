SELECT missing_date::date AS missing_date
FROM generate_series('2022-01-01'::timestamp, '2022-01-10'::timestamp, '1 day') AS missing_date
LEFT JOIN person_visits ON missing_date::date = visit_date::date AND ( person_id = 1 or person_id = 2)
WHERE visit_date IS NULL;