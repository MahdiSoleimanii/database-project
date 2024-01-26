SELECT 
    CASE
        WHEN day_of_week = '0' THEN 'Sunday'
        WHEN day_of_week = '1' THEN 'Monday'
        WHEN day_of_week = '2' THEN 'Tuesday'
        WHEN day_of_week = '3' THEN 'Wednesday'
        WHEN day_of_week = '4' THEN 'Thursday'
        WHEN day_of_week = '5' THEN 'Friday'
        WHEN day_of_week = '6' THEN 'Saturday'
    END AS day_of_week, AVG(books_published) AS avg_books_per_day
FROM (
  SELECT strftime('%w', publish_date) AS day_of_week, COUNT(*) AS books_published
  FROM PubBooks
  GROUP BY day_of_week, strftime('%Y-%W', publish_date)
)
GROUP BY day_of_week;