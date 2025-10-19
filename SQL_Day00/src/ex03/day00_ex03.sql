SELECT DISTINCT person_id from person_visits
WHERE visit_date BETWEEN '2022/01/06' and '2022/01/09' OR person_id = '2'
ORDER BY person_id DESC