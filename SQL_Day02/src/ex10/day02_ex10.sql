SELECT n1.name AS name_one, n2.name AS name_two, n1.address
FROM person  n2
JOIN person  n1 ON n1.address = n2.address
AND n1.id > n2.id
ORDER BY 1, 2, 3 --- проверка