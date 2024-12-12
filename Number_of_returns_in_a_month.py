from pyspark.sql import SparkSession
from pyspark.sql.functions import col, coalesce, count, month

spark = SparkSession.builder.appName('Number return in a month').getOrCreate()


orders = [
    (1, '2023-01-15', 300),
    (2, '2024-09-23', 200),
    (3, '2022-08-03', 400),
    (4, '2023-01-15', 300),
    (5, '2024-09-23', 200),
    (6, '2022-08-03', 400),
    (7, '2023-01-15', 300),
    (8, '2024-09-23', 200),
    (9, '2022-08-03', 400),
    (10, '2023-01-15', 300),
    (11, '2024-09-23', 200),
    (12, '2022-08-03', 400)
]

orders_schema = ["orderId", "orderDate", "totalPrice"]

returns = [
    (401, 1),
    (402, 4),
    (403, 2),
    (404, 3),
    (405, 6),
    (406, 7),
    (407, 8),
    (408, 9),
    (409, 11)
]

returns_schema = ["returnId", "orderId"]

orders_df = spark.createDataFrame(orders, orders_schema)

returns_df = spark.createDataFrame(returns, returns_schema)

print(f"orders datt {orders_df.show()}")
print(f"returns data {returns_df.show()}")

#returns_df.join(orders_df, returns_df.OrderId == orders_df.OrderId, "left")

## Joining orders and returns dataframes

joined_df = returns_df.join(orders_df, returns_df.orderId == orders_df.orderId, "left")

result_df = joined_df.withColumn('month', 
                                coalesce(month(col('orderDate')))).groupby('month').agg(count('returnId').alias('total_returns'))



result_df.show()