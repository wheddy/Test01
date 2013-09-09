SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.pGetHistoricalTrace
	@ipTraceType			VARCHAR(16),
	@ipServerName			NVARCHAR(448),
	@ipDatabaseName			NVARCHAR(448) = 'All',
	@ipObjectName			NVARCHAR(448) = 'All',
	@ipSortField			VARCHAR(48) = '',  
	@ipSortDirection		VARCHAR(5) = 'DESC',
	@ipTop					VARCHAR(5) = 'All',
	@ipDebugFlag			CHAR(1) = 'N'
AS
/*
	Stored Procedure	dbo.pGetHistoricalTrace
	Author				Clayton Wilson
	Date				06/14/2007

$Log$
*/

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET NOCOUNT ON

BEGIN TRY 

	DECLARE @lvErrorMsg	VARCHAR(MAX)

	DECLARE @lvSQL		NVARCHAR(4000)
	DECLARE @lvParams	NVARCHAR(512) 

	DECLARE @lvTop		INT

	IF @ipObjectName = 'All'
		SET @ipObjectName = NULL

	IF @ipDatabaseName = 'All'
		SET @ipDatabaseName = NULL

	IF @ipTop = 'All'
		SET @lvTop = 1000000
	ELSE
		SET @lvTop = CONVERT(INT, @ipTop)

	/*SELECT*/
	SELECT @lvSQL = ''
	SELECT @lvSQL = @lvSQL + 'SELECT TOP(@xTop)' 
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + 'ObjectName'   
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',ExecutionCount'  
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',CONVERT(VARCHAR(23), LastStartTime, 21) AS LastStartTime'  
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',ROUND(CAST((MinCPU * .001) AS FLOAT), 3) AS MinCPU'  
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',ROUND(CAST((MaxCPU * .001) AS FLOAT), 3) AS MaxCPU'
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',ROUND(CAST((MinDuration * .000001) AS FLOAT), 6) AS MinDuration'  
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',ROUND(CAST((MaxDuration * .000001) AS FLOAT), 6) AS MaxDuration'  
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',MinReads'  
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',MaxReads'  
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',MinWrites'  
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',MaxWrites' 
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',DatabaseName' 
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',ServerName' 

	/*FROM*/
	IF @ipTraceType = 'Duration'
	BEGIN

		SELECT @lvSQL = @lvSQL + CHAR(13) + 'FROM dbo.tTraceHistoricalDuration' 

	END
	ELSE IF @ipTraceType = 'CPU'
	BEGIN

		SELECT @lvSQL = @lvSQL + CHAR(13) + 'FROM dbo.tTraceHistoricalCPU' 

	END

	/*WHERE*/
	SELECT @lvSQL = @lvSQL + CHAR(13) + 'WHERE ServerName = ISNULL(@xServerName, ServerName)' 
	SELECT @lvSQL = @lvSQL + CHAR(13) + 'AND ISNULL(ObjectName, '''') = COALESCE(@xObjectName, ObjectName, '''')' 
	SELECT @lvSQL = @lvSQL + CHAR(13) + 'AND DatabaseName = ISNULL(@xDatabaseName, DatabaseName)' 

	/*ORDER BY*/
	SELECT @lvSQL = @lvSQL + CHAR(13) + 'ORDER BY ' + CASE @ipSortField 
														WHEN 'ObjectName' THEN 'ObjectName ' + @ipSortDirection
														WHEN 'LastStartTime' THEN 'LastStartTime ' + @ipSortDirection + ', ObjectName ASC'
														WHEN 'MinCPU' THEN 'MinCPU ' + @ipSortDirection + ', ObjectName ASC'
														WHEN 'MinDuration' THEN 'MinDuration ' + @ipSortDirection + ', ObjectName ASC'
														WHEN 'MinReads' THEN 'MinReads ' + @ipSortDirection + ', ObjectName ASC'
														WHEN 'MinWrites' THEN 'MinWrites ' + @ipSortDirection + ', ObjectName ASC'
														WHEN 'MaxCPU' THEN 'MaxCPU ' + @ipSortDirection + ', ObjectName ASC'
														WHEN 'MaxDuration' THEN 'MaxDuration ' + @ipSortDirection + ', ObjectName ASC'
														WHEN 'MaxReads' THEN 'MaxReads ' + @ipSortDirection + ', ObjectName ASC'
														WHEN 'MaxWrites' THEN 'MaxWrites ' + @ipSortDirection + ', ObjectName ASC'
														WHEN 'DatabaseName' THEN 'DatabaseName ' + @ipSortDirection + ', ObjectName ASC'
														WHEN 'ExecutionCount' THEN 'ExecutionCount ' + @ipSortDirection + ', ObjectName ASC'
														WHEN 'ServerName' THEN 'ServerName ' + @ipSortDirection + ', ObjectName ASC'
														ELSE 'ObjectName ' + @ipSortDirection
													  END

	SELECT @lvParams = ''  
	SELECT @lvParams = @lvParams + CHAR(13) + ' @xTop					INT'  
	SELECT @lvParams = @lvParams + CHAR(13) + ' ,@xServerName			NVARCHAR(448)'  
	SELECT @lvParams = @lvParams + CHAR(13) + ' ,@xObjectName			NVARCHAR(448)'  
	SELECT @lvParams = @lvParams + CHAR(13) + ' ,@xDatabaseName			NVARCHAR(448)' 

	IF @ipDebugFlag = 'Y'  
	BEGIN  

		PRINT @lvSQL  
		PRINT ''  
		PRINT @lvParams  

	END

	EXEC sp_executesql   
		@lvSQL  
		,@lvParams  
		,@lvTop
		,@ipServerName
		,@ipObjectName
		,@ipDatabaseName
END TRY
BEGIN CATCH

	SET @lvErrorMsg = ISNULL(@lvErrorMsg, 'RAISERROR: PROCEDURE: ' + ERROR_PROCEDURE() + ' -> ' + CAST(ERROR_NUMBER() AS VARCHAR) + ' -> ' + ERROR_MESSAGE())
	RAISERROR (@lvErrorMsg, 16, 1)

END CATCH

GO
GRANT EXECUTE ON  [dbo].[pGetHistoricalTrace] TO [ltReportingService]
GO
