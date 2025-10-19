WITH CTE as (
    SELECT address, 
    ROUND((MAX(age) - (MIN(age)::numeric / MAX(age)::numeric)), 2) AS formula, 
    ROUND(AVG(age),2) AS averge 
    FROM person
    GROUP BY person.address)
SELECT address, formula, averge,
CASE 
    WHEN formula > averge THEN true
    ELSE  false
END AS comparison
FROM CTE

ORDER BY address