/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Purpose:
    Loads raw data from CSV files into the bronze layer tables.
    For each table: truncates existing data, then bulk inserts fresh data from CSV.

Setup:
    Sample CSVs are included in this repo under /datasets/source_crm/ and
    /datasets/source_erp/. Update the file paths below to point to wherever
    you've cloned this repo locally. BULK INSERT requires the SQL Server
    service account to have read access to that path.

Usage:
    EXEC bronze.load_bronze;
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    BEGIN TRY
        PRINT 'Loading Bronze Layer...';

        -- ===== CRM Tables =====
        PRINT '>> Loading bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;
        BULK INSERT bronze.crm_cust_info
        FROM 'C:\sql\dwh_project\datasets\source_crm\cust_info.csv'  -- UPDATE PATH
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

        PRINT '>> Loading bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;
        BULK INSERT bronze.crm_prd_info
        FROM 'C:\sql\dwh_project\datasets\source_crm\prd_info.csv'  -- UPDATE PATH
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

        PRINT '>> Loading bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;
        BULK INSERT bronze.crm_sales_details
        FROM 'C:\sql\dwh_project\datasets\source_crm\sales_details.csv'  -- UPDATE PATH
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

        -- ===== ERP Tables =====
        PRINT '>> Loading bronze.erp_loc_a101';
        TRUNCATE TABLE bronze.erp_loc_a101;
        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\sql\dwh_project\datasets\source_erp\loc_a101.csv'  -- UPDATE PATH
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

        PRINT '>> Loading bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_cust_az12;
        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\sql\dwh_project\datasets\source_erp\cust_az12.csv'  -- UPDATE PATH
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

        PRINT '>> Loading bronze.erp_px_cat_g1v2';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'C:\sql\dwh_project\datasets\source_erp\px_cat_g1v2.csv'  -- UPDATE PATH
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

        PRINT 'Bronze Layer Loaded Successfully.';
    END TRY
    BEGIN CATCH
        PRINT 'ERROR loading bronze layer: ' + ERROR_MESSAGE();
    END CATCH
END

EXEC bronze.load_bronze;
