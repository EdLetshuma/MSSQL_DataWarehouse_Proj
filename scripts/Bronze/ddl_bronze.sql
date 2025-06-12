/*
=====================================================
DDL SCRIPT FOR CREATING TABLES IN THE BRONZE SCHEMA
====================================================

Purpose of the DDL script is to create tables in the Bronze Schema, It will check wether the table exist and will drop it.

Run the scrip to re-define the DDL Structure  of 'bronze'
*/

------------------------------------------------------------------
IF OBJECT_ID('bronze.crm_customer_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_customer_info;
GO

--TABLE FOR SOURCE FILE (cust_info.csv)
CREATE TABLE bronze.crm_customer_info(
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_material_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATETIME
);

GO
------------------------------------------------------------------
IF OBJECT_ID('bronze.crm_prod_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_prod_info;
GO

--TABLE FOR SOURCE FILE (prd_info.csv)
CREATE TABLE bronze.crm_prod_info(
    prd_id INT,
    prd_key NVARCHAR(50),
    prd_nm NVARCHAR(50),
    prd_cost INT,
    prd_line NVARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt DATETIME
);
GO
------------------------------------------------------------------
IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;
GO

--TABLE FOR SOURCE FILE (sales_detail.csv)
CREATE TABLE bronze.crm_sales_details(
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);
GO
------------------------------------------------------------------
IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE bronze.erp_cust_az12;
GO

--TABLE FOR SOURCE FILE (CUST_AZ12.csv)
CREATE TABLE bronze.erp_cust_az12(
	cid NVARCHAR(50),
	bdate DATETIME,
	gen NVARCHAR(50)
);
GO
------------------------------------------------------------------
IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;
GO

--TABLE FOR SOURCE FILE (LOC_A101.csv)
CREATE TABLE bronze.erp_loc_a101(
	cid NVARCHAR(50),
	cntry NVARCHAR(50)
);
GO
------------------------------------------------------------------
IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;
GO

--TABLE FOR SOURCE FILE (PX_CAT_G1V2.csv)
CREATE TABLE bronze.erp_px_cat_g1v2 (
    id NVARCHAR(50),
    cat NVARCHAR(50),
    subcat NVARCHAR(50),
    maintenance NVARCHAR(50)
);
