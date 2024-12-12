
## Importing required Modules

from pyspark.sql import SparkSession
from pyspark.sql.functions import row_number as rn
from pyspark.sql.functions import dense_rank as ds
from pyspark.sql.window import Window as wn

## Creating spark context
spark = SparkSession.builder.appName('Second Highest salary').getOrCreate()

## Intilizing the data
data = [
    ('Employee1', 23, 'USA', 'HR', 1000000),
    ('Employee2', 32, 'USA', 'HR', 2000000),
    ('Employee3', 24, 'IND', 'Marketing', 1000000),
    ('Employee4', 28, 'IND', 'Marketing', 3000000),
    ('Employee5', 29, 'ENG', 'Finance', 10000),
    ('Employee6', 24, 'ENG', 'Finance', 40000),
    ('Employee7', 27, 'AUS', 'IT', 55000),
    ('Employee8', 26, 'AUS', 'IT', 10000),
    ('Employee9', 36, 'PAK', 'Production', 13000),
    ('Employee10', 38, 'PAk', 'Production', 67000),
    ('Employee11', 29, 'RSA', 'R&D', 120000),
]

## Columns
schema = ["Name", "AGE", "COUNTRY", "Department", "SALARY"]

## Creating the data frame
Employee_df = spark.createDataFrame(data, schema)

#Employee_df.show()

# Creating Window for Salary column
window = wn.orderBy("SALARY")

## Applying window function to employee data
Employee_df1 = Employee_df.withColumn('Dense_rank', ds().over(window))

Employee_df1.select("*").where('Dense_rank=2').show()