SELECT t1.name,
       coalesce(t1.count, 0) + coalesce(t2.count, 0) AS total_count
FROM (SELECT piz.name, COUNT(*)
      FROM person_visits AS p_v
               JOIN pizzeria AS piz ON piz.id = p_v.pizzeria_id
      GROUP BY piz.name
      ORDER BY 2 DESC) AS t1
         FULL JOIN
     (SELECT piz.name, COUNT(*)
      FROM person_order AS p_o
               JOIN menu AS m ON m.id = p_o.menu_id
               JOIN pizzeria AS piz ON piz.id = m.pizzeria_id
      GROUP BY piz.name
      ORDER BY 2 DESC) AS t2 ON t1.name = t2.name
ORDER BY 2 DESC, 1 ASC