SELECT DISTINCT city, SUM(total_printed)
FROM Publishers
GROUP BY city
ORDER BY SUM(total_printed) DESC
LIMIT 3;