WITH RECURSIVE roads AS (
    SELECT point1 AS path,
        point1,
        point2,
        path_cost
    FROM tsp_data
    WHERE point1 = 'a'
    UNION
    SELECT CONCAT(roads.path, ',', tsp_data.point1) AS path,
        tsp_data.point1,
        tsp_data.point2,
        roads.path_cost + tsp_data.path_cost
    FROM roads
        JOIN tsp_data ON roads.point2 = tsp_data.point1
    WHERE path NOT LIKE CONCAT('%', tsp_data.point1, '%')
    )

SELECT path_cost                AS total_cost,
       Concat('{', path, ',a}') AS tour
FROM   roads
WHERE  Length(path) = 7
       AND point2 LIKE 'a'
       AND path_cost IN (SELECT Min(path_cost)
                         FROM   roads
                         WHERE  Length(path) = 7
                                AND point2 LIKE 'a'
                         UNION
                         SELECT Max(path_cost)
                         FROM   roads
                         WHERE  Length(path) = 7
                                AND point2 LIKE 'a')
ORDER  BY total_cost,
          tour; 