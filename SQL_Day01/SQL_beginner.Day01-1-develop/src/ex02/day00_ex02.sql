SELECT pizza_name
FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY pizza_name) AS rn
    FROM menu
)
WHERE rn = 1