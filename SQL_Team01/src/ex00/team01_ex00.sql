WITH last_currency AS
(
SELECT *
FROM currency c1
WHERE updated=(SELECT c2.updated
               FROM currency c2
			   WHERE c2.id=c1.id
			   ORDER BY c2.updated DESC
			   LIMIT 1)
ORDER BY id ASC
       , updated DESC
)
SELECT COALESCE(u.name, 'not defined') AS name
     , COALESCE(u.lastname, 'not defined') AS lastname
	 , b.type
	 , SUM(b.money) AS volume
	 , MAX(COALESCE(lc.name, 'not defined')) AS currency_name
	 , MAX(COALESCE(lc.rate_to_usd, 1)) AS last_rate_to_usd
	 , SUM(b.money)*MAX(COALESCE(lc.rate_to_usd, 1)) AS total_volume_in_usd
FROM "user" u
FULL OUTER JOIN balance b ON b.user_id=u.id
LEFT JOIN last_currency lc ON lc.id=b.currency_id
GROUP BY u.id
       , b.type
ORDER BY 1 DESC
       , 2 ASC
	   , 3 ASC;