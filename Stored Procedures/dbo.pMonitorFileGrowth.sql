SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[pMonitorFileGrowth]
AS


/**********************************************************************************
-- Stored Proc       	dbo.pMonitorFileGrowth
-- Author               David Ekren
-- Date                 10/11/2006
-- Description          Inserts SQL file size info into table on CLTDB0101.
-- Called From          SQL Job
-- Change History      	
-- Notes
**********************************************************************************/

SET NOCOUNT ON 



CREATE TABLE [dbo].[#tDBFileUsagetemp](
	[NTServerName] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TrueServerName] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DatabaseName] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[fileGroupName] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[fileNameLogical] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[fileNamePhysical] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[fileSizeInMB] [int] NOT NULL,
	[fileSizeInKB] [int] NOT NULL,
	[spaceAvailableInMB] [int] NOT NULL,
	[InsertDateTime] [datetime] NOT NULL,
	[groupid] [int] NOT NULL,
	[dbid] [int] NOT NULL
) ON [PRIMARY] 

DECLARE @lvNTServerName  varchar(101)
DECLARE @lvInstanceNameStartPos int
SET @lvInstanceNameStartPos = charindex('\', @@servername)
IF @lvInstanceNameStartPos > 0
 SET @lvNTServerName  = substring(@@servername, 1, charindex('\', @@servername) -1 ) 
ELSE
 SET @lvNTServerName = @@servername

INSERT INTO #tDBFileUsagetemp
SELECT @lvNTServerName,(SELECT @@servername), b.name as dbname, 'Default' as filegroupname, a.name as filelogicalname, a.filename,
a.size, a.size, -1, getdate(), a.groupid, a.dbid
FROM master.dbo.sysaltfiles a
join master.dbo.sysdatabases b
ON a.dbid = b.dbid 

--DECLARE variables.
 
SET NOCOUNT ON 
 
DECLARE @dbid int
DECLARE @dbname VarChar(128) 
DECLARE @groupid varchar (128)
DECLARE @sSQL varchar(400)
DECLARE @groupname varchar(100)
DECLARE @fileLocicalName varchar(128)

--DECLARE the SQL cursor. 
 
DECLARE my_cursor CURSOR FOR 
 
SELECT dbid, databasename, groupid, fileNameLogical

FROM 
#tDBFileUsagetemp
 
--Open SQL the cursor. 
 
OPEN my_cursor 
 
--Push the first rows data INTO the variables. 

FETCH NEXT 
 
FROM my_cursor 
 
INTO
@dbid,
@dbName,
@groupid,
@fileLocicalName
 
WHILE (@@FETCH_STATUS = 0) 
 
BEGIN 
 
------------------------------------------------------(Begin Loop)-------------------------- 

SET @dbName = rtrim(@dbName)
SET @sSQL = 'DECLARE @groupname varchar(100) '
SET @sSQL = @sSQL + 'SELECT groupname INTO #gname FROM ' +  @dbName + '.dbo.sysfilegroups where groupid = ' + @groupid + ' SET @groupname = (SELECT top 1 * FROM #gname) '
SET @sSQL = @sSQL + 'SET @groupname = isnull(@groupname, ' + '''' + 'DDDDDDDD' + '''' + ') '
SET @sSQL = @sSQL + 'UPDATE #tDBFileUsagetemp '
SET @sSQL = @sSQL + 'SET fileGroupName = @groupname where groupid = ' + @groupid +  ' and databasename = ' + '''' + @dbName + ''''
Exec(@sSQL)


CREATE TABLE #FileDetails ( 
        FileId int , FileGroupId int , TotalExtents int , UsedExtents int , 
        [Name] nvarchar( 128 )  , [FileName] nvarchar( 500 ) , 
        TotalSize AS ( ( TotalExtents * 64.0 ) / 1024 ) , 
        UsedSize AS ( ( UsedExtents * 64.0 ) / 1024 ) 
)

-- Get data file info: 

INSERT INTO #FileDetails ( 
        FileId , FileGroupId , TotalExtents , UsedExtents , [Name] , [Filename]
) 
EXECUTE( 'use ' + @dbName + ' dbcc showfilestats with TABLEresults' ) 


DECLARE @usedsize numeric(10,2)
DECLARE @TotalSize numeric(10,2)

SET @usedsize = (SELECT usedsize FROM #FileDetails where FileGroupId = @groupid and name = @fileLocicalName)
SET @TotalSize = (SELECT totalsize FROM #FileDetails where FileGroupId = @groupid and name = @fileLocicalName)

if @usedsize is not null
begin

UPDATE #tDBFileUsagetemp
SET fileSizeInMB =  @TotalSize where dbid = @dbid and GroupId = @groupid
	 and fileNameLogical = @fileLocicalName

UPDATE #tDBFileUsagetemp
SET spaceAvailableInMB =  @TotalSize - @usedsize where dbid = @dbid and GroupId = @groupid
	 and fileNameLogical = @fileLocicalName

UPDATE #tDBFileUsagetemp
SET fileSizeInKB =  @TotalSize * 1024 where dbid = @dbid and GroupId = @groupid
	 and fileNameLogical = @fileLocicalName
end

DROP TABLE #FileDetails

------------------------------------------------------(End Loop)-------------------------- 
 
--Push the next rows data INTO the variables. 
 
FETCH NEXT 
 
FROM my_cursor 
 
INTO 
@dbid,
@DbName,
@groupid,
@fileLocicalName
 
END 
 
--Close the cursor and do any cleaning up. 
 
CLOSE my_cursor DEALLOCATE my_cursor 

UPDATE #tDBFileUsagetemp
SET fileGroupname = filenamelogical where filegroupname = 'Default' or filegroupname = 'DDDDDDDD'

--Insert INTO CLTDB0101 TABLE

INSERT INTO [0101].DBMONitoring.dbo.tDBFileUsage
SELECT [NTServerName],
	[TrueServerName],
	[DatabaseName],
	[fileGroupName],
	[fileNameLogical],
	[fileNamePhysical],
	[fileSizeInMB],
	[fileSizeInKB],
	[spaceAvailableInMB],
	[InsertDateTime]
FROM #tDBFileUsagetemp

DROP TABLE #tDBFileUsagetemp


GO
