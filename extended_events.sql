-- Extended Events
USE AdventureWorks2014
SELECT o.name, o.description
FROM sys.dm_xe_objects o
WHERE object_type = 'event'
ORDER BY o.name
GO

USE AdventureWorks2012
SELECT o.name, o.description
FROM sys.dm_xe_objects o
WHERE object_type = 'event'
ORDER BY o.name
GO
-- Display columns of events
SELECT 
o.name as 'Name', c.name AS 'Column name',
c.description AS 'Description'
FROM sys.dm_xe_objects AS o
JOIN sys.dm_xe_object_columns AS c
ON o.name = c.object_name
WHERE object_type ='event'
ORDER BY o.name, c.name
GO 
-- Display list of actions available
USE AdventureWorks2014
SELECT o.name, o.description
FROM sys.dm_xe_objects o
WHERE object_type = 'action' -- code change to action
ORDER BY o.name
GO

-- Display predicates
USE AdventureWorks2014
SELECT o.name, o.description
FROM sys.dm_xe_objects o
WHERE object_type = 'pred_source'
ORDER BY o.name
GO

-- List of targets
USE AdventureWorks2014
SELECT o.name, o.description
FROM sys.dm_xe_objects o
WHERE object_type = 'target'
ORDER BY o.name
GO