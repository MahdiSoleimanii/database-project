SELECT ID, IFNULL(AVG(publisher_revenue), 0) AS average_revenue
FROM Publishers LEFT JOIN PubBooks ON ID = publisher_ID
                                      AND strftime('%Y-%m', publish_date) = '2018-01'
GROUP BY ID;
