-- Создание таблиц и заполнение их данными:
CREATE TABLE IF NOT EXISTS tsp_data
  (
     point1    VARCHAR NOT NULL,
     point2    VARCHAR NOT NULL,
     path_cost INTEGER NOT NULL,
     CONSTRAINT point1_correct CHECK (point1 ~ '[a-z]'),
     CONSTRAINT point2_correct CHECK (point2 ~ '[a-z]'),
     CONSTRAINT path_cost_correct CHECK (path_cost >= 0)
  );

INSERT INTO tsp_data VALUES ('a', 'b', 10);
INSERT INTO tsp_data VALUES ('a', 'c', 15);
INSERT INTO tsp_data VALUES ('a', 'd', 20);
INSERT INTO tsp_data VALUES ('b', 'd', 25);
INSERT INTO tsp_data VALUES ('b', 'c', 35);
INSERT INTO tsp_data VALUES ('d', 'c', 30);

-- Поскольку стоимости путей (a, b) и (b, a) совпадают
-- добавим все симметричные значения:
INSERT INTO tsp_data
SELECT point2 AS point1,
       point1,
       path_cost
FROM   tsp_data;

WITH RECURSIVE roads AS (
--  первая часть рекурсии: выбираем все пути, начинающиеся с 'a'
    SELECT point1 AS path,
        point1,
        point2,
        path_cost
    FROM tsp_data
    WHERE point1 = 'a'
    UNION
-- ищем все возможные пути и суммируем стоимость
    SELECT CONCAT(roads.path, ',', tsp_data.point1) AS path,
        tsp_data.point1,
        tsp_data.point2,
        roads.path_cost + tsp_data.path_cost
    FROM roads
        JOIN tsp_data ON roads.point2 = tsp_data.point1
-- исключаем уже пройденные города
    WHERE path NOT LIKE CONCAT('%', tsp_data.point1, '%')
    )

-- Поиск маршрута, который проходит через все узлы
-- с минимальной стоимостью.
SELECT path_cost                AS total_cost,
       CONCAT('{', path, ',a}') AS tour
FROM   roads
WHERE  LENGTH(path) = 7
       AND point2 LIKE 'a'
       AND path_cost = (SELECT path_cost
                        FROM   roads
                        WHERE  LENGTH(path) = 7
                               AND point2 LIKE 'a'
                        ORDER  BY path_cost
                        LIMIT  1)
ORDER  BY path_cost,
          tour; 