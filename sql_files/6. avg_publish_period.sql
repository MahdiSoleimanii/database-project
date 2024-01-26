SELECT ID, IFNULL(AVG(strftime('%s', pb.publish_date) - strftime('%s', (
    SELECT MAX(pb2.publish_date)
    FROM PubBooks pb2
    WHERE pb2.publisher_ID = ID AND pb2.publish_date < pb.publish_date
  ))), 0) / (24 * 60 * 60) AS avg_publish_period_days
FROM Publishers LEFT JOIN PubBooks pb ON ID = pb.publisher_ID
GROUP BY ID;
