"Pyspark program to find the top selling products in each category"
from pyspark.sql import SparkSession as session
from pyspark.sql.window import Window
from pyspark.sql.functions import dense_rank, desc

spark = session.builder.appName('Top seeling products').getOrCreate()

product = [
    (1, 'Laptop', 'Electronics', 120),
    (2, 'Smartphone', 'Electronics', 200),
    (3, 'Tablet', 'Electronics', 150),
    (4, 'Headphones', 'Electronics', 300),
    (5, 'Keyboard', 'Electronics', 80),
    (6, 'Mouse', 'Electronics', 95),
    (7, 'Monitor', 'Electronics', 70),
    (8, 'Printer', 'Electronics', 50),
    (9, 'Router', 'Electronics', 60),
    (10, 'Webcam', 'Electronics', 40),
    (11, 'Chair', 'Furniture', 120),
    (12, 'Desk', 'Furniture', 80),
    (13, 'Sofa', 'Furniture', 20),
    (14, 'Bookshelf', 'Furniture', 30),
    (15, 'Bed', 'Furniture', 25),
    (16, 'Wardrobe', 'Furniture', 15),
    (17, 'Dining Table', 'Furniture', 40),
    (18, 'Coffee Table', 'Furniture', 50),
    (19, 'Stool', 'Furniture', 60),
    (20, 'Cupboard', 'Furniture', 10),
    (21, 'Shirt', 'Clothing', 150),
    (22, 'Jeans', 'Clothing', 140),
    (23, 'Jacket', 'Clothing', 60),
    (24, 'Shoes', 'Clothing', 200),
    (25, 'Hat', 'Clothing', 80),
    (26, 'Sweater', 'Clothing', 90),
    (27, 'Gloves', 'Clothing', 70),
    (28, 'Scarf', 'Clothing', 50),
    (29, 'Socks', 'Clothing', 180),
    (30, 'Belt', 'Clothing', 110),
    (31, 'Notebook', 'Stationery', 300),
    (32, 'Pen', 'Stationery', 500),
    (33, 'Pencil', 'Stationery', 400),
    (34, 'Eraser', 'Stationery', 350),
    (35, 'Ruler', 'Stationery', 200),
    (36, 'Marker', 'Stationery', 250),
    (37, 'Highlighter', 'Stationery', 220),
    (38, 'Stapler', 'Stationery', 150),
    (39, 'Glue', 'Stationery', 180),
    (40, 'Tape', 'Stationery', 170),
    (41, 'Rice Cooker', 'Appliances', 40),
    (42, 'Blender', 'Appliances', 50),
    (43, 'Microwave', 'Appliances', 30),
    (44, 'Refrigerator', 'Appliances', 25),
    (45, 'Washing Machine', 'Appliances', 15),
    (46, 'Air Conditioner', 'Appliances', 10),
    (47, 'Vacuum Cleaner', 'Appliances', 35),
    (48, 'Toaster', 'Appliances', 60),
    (49, 'Fan', 'Appliances', 70),
    (50, 'Iron', 'Appliances', 90)
]

schema = ["ProductId", "ProductName", "Category", "QuantitySold"]

product_df = spark.createDataFrame(product, schema)

window = Window.partitionBy('Category').orderBy(desc('QuantitySold'))

product_df1 = product_df.withColumn('rank', dense_rank().over(window))
product_df1.select("*").where("rank == 1").show()
