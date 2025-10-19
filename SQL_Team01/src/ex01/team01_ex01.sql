insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

----------------------

SELECT 
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    cur.name AS currency_name,
	CAST(TRUNC((balance.money::numeric * cur.rate_to_usd::numeric), 3) AS real) AS currency_in_usd
FROM balance
LEFT JOIN "user" u ON balance.user_id = u.id
JOIN LATERAL (
    SELECT c.*
    FROM currency c
    WHERE c.id = balance.currency_id
    ORDER BY 
         CASE WHEN c.updated <= balance.updated THEN 0 ELSE 1 END,
         CASE WHEN c.updated <= balance.updated THEN c.updated END DESC, 
         c.updated ASC  
    LIMIT 1
) cur ON true
ORDER BY name DESC, lastname, currency_name;

