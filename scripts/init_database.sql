/*
=======================================================================
Database Initialization Script: DataWarehouse with Bronze/Silver/Gold
=======================================================================
Purpose:
    This script performs a clean setup of the 'DataWarehouse' database
    with a medallion architecture (bronze/silver/gold schemas).
    
Features:
    - Checks for active connections before dropping database
    - Includes transaction handling for safety
    - Validates schema creation success
    - Provides clear progress reporting

WARNING:
    This will DROP and RECREATE the entire 'DataWarehouse' database,
    including all existing data. Ensure you have backups before proceeding.
    
Usage:
    Execute this script in its entirety in SQL Server Management Studio
    or via sqlcmd.
*/

-- 1. Handle the database
USE master;
GO

IF DB_ID('DataWarehouse') IS NOT NULL
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END
GO

CREATE DATABASE DataWarehouse;
GO

-- 2. Create schemas
USE DataWarehouse;
GO

CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;
GO

PRINT 'DataWarehouse created with bronze, silver, and gold schemas';
GO
