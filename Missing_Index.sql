-- Retrive database id
SELECT DB_ID(N'AdventureWorks2014') AS [Database ID];
GO
-- Retrieve table id 
USE master
SELECT OBJECT_ID(N'Adventureworks2014.[Sales].[SalesOrderHeader]') AS 'Object ID';
GO

SELECT
--DB_NAME(7) AS database_name-- Insert the id in the live code
DB_NAME(7) AS database_name
--,OBJECT_NAME(object_id, database_id) AS table_name Insert object_id(table id) and database id
,OBJECT_NAME(1266103551,7) AS table_name
,mid.equality_columns
,mid.inequality_columns
,mid.included_columns
,(migs.user_seeks + migs.user_scans) * migs.avg_user_impact AS Impact
,migs.avg_total_user_cost * (migs.avg_user_impact / 100.0) * (migs.user_seeks + migs.user_scans) AS Score
,migs.user_seeks
,migs.user_scans
FROM sys.dm_db_missing_index_details mid
INNER JOIN sys.dm_db_missing_index_groups mig ON mid.index_handle = mig.index_handle
INNER JOIN sys.dm_db_missing_index_group_stats migs ON mig.index_group_handle = migs.
group_handle
ORDER BY migs.avg_total_user_cost * (migs.avg_user_impact / 100.0) * (migs.user_seeks + migs.
user_scans) DESC
GO

