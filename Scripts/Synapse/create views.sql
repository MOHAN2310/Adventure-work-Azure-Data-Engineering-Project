--- Create DataBase
CREATE DATABASE de_database;

-- CREATE SCHEMA
CREATE SCHEMA gold;

--- calendar
CREATE VIEW gold.calendar
AS
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://dedatalakegen.dfs.core.windows.net/silver/AdventureWorks_Calendar/',
        FORMAT = 'PARQUET'
    ) as QUER1

----AdventureWorks_Customers
CREATE VIEW gold.customers
AS
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://dedatalakegen.dfs.core.windows.net/silver/AdventureWorks_Customers/',
        FORMAT = 'PARQUET'
    ) as QUER2

---AdventureWorks_Product_Categories
CREATE VIEW gold.product_categories
AS
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://dedatalakegen.dfs.core.windows.net/silver/AdventureWorks_Product_Categories/',
        FORMAT = 'PARQUET'
    ) as QUER3

---AdventureWorks_Products
CREATE VIEW gold.AdventureWorks_Products
AS
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://dedatalakegen.dfs.core.windows.net/silver/AdventureWorks_Products/',
        FORMAT = 'PARQUET'
    ) as QUER4

---AdventureWorks_Returns
CREATE VIEW gold.AdventureWorks_Returns
AS
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://dedatalakegen.dfs.core.windows.net/silver/AdventureWorks_Returns/',
        FORMAT = 'PARQUET'
    ) as QUER5

---AdventureWorks_Sales
CREATE VIEW gold.AdventureWorks_Sales
AS
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://dedatalakegen.dfs.core.windows.net/silver/AdventureWorks_Sales/',
        FORMAT = 'PARQUET'
    ) as QUER6

---AdventureWorks_Territories
CREATE VIEW gold.AdventureWorks_Territories
AS
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://dedatalakegen.dfs.core.windows.net/silver/AdventureWorks_Territories/',
        FORMAT = 'PARQUET'
    ) as QUER7

---Product_Subcategories
CREATE VIEW gold.Product_Subcategories
AS
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://dedatalakegen.dfs.core.windows.net/silver/Product_Subcategories/',
        FORMAT = 'PARQUET'
    ) as QUER8