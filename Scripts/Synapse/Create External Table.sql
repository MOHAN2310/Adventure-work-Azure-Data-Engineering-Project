-- CREATE MASTER KEY  ENCRYPTION BY PASSWORD = 'EnterThePassword'

-- CREATE DATABASE SCOPED CREDENTIAL cred_mohan
-- WITH
--     IDENTITY = 'Managed Identity'


-- CREATE EXTERNAL DATA SOURCE FOR SILVER LAYER
CREATE EXTERNAL DATA SOURCE source_silver
WITH
(
    LOCATION = 'https://dedatalakegen.dfs.core.windows.net/silver',
    CREDENTIAL = cred_mohan
)


-- CREATE EXTERNAL DATA SOURCE FOR GOLD LAYER
CREATE EXTERNAL DATA SOURCE source_gold
WITH
(
    LOCATION = 'https://dedatalakegen.dfs.core.windows.net/gold',
    CREDENTIAL = cred_mohan
)


-- CREATE FILE FORMAT
CREATE EXTERNAL FILE FORMAT format_parquet
WITH
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)

-- CREATE A EXTERNAL TABLE
CREATE EXTERNAL TABLE gold.extsales
WITH
(
    LOCATION = 'extsales',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.AdventureWorks_Sales

SELECT * FROM gold.extsales;


-- CREATE A EXTERNAL TABLE customer
CREATE EXTERNAL TABLE gold.extcustomers
WITH
(
    LOCATION = 'extcustomers',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.customers


-- CREATE A EXTERNAL TABLE AdventureWorks_Product_Categories
CREATE EXTERNAL TABLE gold.extProduct_Categories
WITH
(
    LOCATION = 'extProduct_Categories',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.product_categories


-- CREATE A EXTERNAL TABLE AdventureWorks_Products
CREATE EXTERNAL TABLE gold.extAdventureWorks_Products
WITH
(
    LOCATION = 'extAdventureWorks_Products',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.AdventureWorks_Products


-- CREATE A EXTERNAL TABLE AdventureWorks_Returns
CREATE EXTERNAL TABLE gold.extAdventureWorks_Returns
WITH
(
    LOCATION = 'extAdventureWorks_Returns',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.AdventureWorks_Returns


-- CREATE A EXTERNAL TABLE AdventureWorks_Territories
CREATE EXTERNAL TABLE gold.extAdventureWorks_Territories
WITH
(
    LOCATION = 'extAdventureWorks_Territories',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.AdventureWorks_Territories


-- CREATE A EXTERNAL TABLE Product_Subcategories
CREATE EXTERNAL TABLE gold.extProduct_Subcategories
WITH
(
    LOCATION = 'extProduct_Subcategories',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.Product_Subcategories


--CHECKING
SELECT * from gold.AdventureWorks_Territories;




















