SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROC [dbo].[pRptDatabaseDDLLog]   
	
	@ipServerAlias VARCHAR(128)

AS 

/*

Reports all (last 10 days worth of) database level DDL changes based on the trDatabaseDDLModitication trigger

$Log$ 

*/ 

SET NOCOUNT ON; 

DECLARE @lvError int 
DECLARE @lvErrorMsg varchar(255), 
		@lvSQL nvarchar(max)

   
SELECT @lvSQL = 'SELECT	ServerName' + CHAR(10) +
		',[Database]' + CHAR(10) +
		',[Schema]' + CHAR(10) +
		',[Object]' + CHAR(10) +
		',[Action]' + CHAR(10) +
		',DatabaseUser' + CHAR(10) +
		',EventDateTime' + CHAR(10) +
		',DatabaseDDLLogID' + CHAR(10) +
		',TSQL' + CHAR(10) +
'FROM ' + @ipServerAlias + '.dba.dbo.tDatabaseDDLLog' + CHAR(10) +
'WHERE [Action] <> ' +'''' + 'UPDATE_STATISTICS' + '''' + CHAR(10) +
'ORDER BY [Database], EventDateTime DESC' + CHAR(10)

exec sp_executesql @lvSQL
GO
GRANT EXECUTE ON  [dbo].[pRptDatabaseDDLLog] TO [ltReportingService]
GO
