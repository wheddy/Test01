SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.pGetTrace
	@ipTraceType			VARCHAR(16),
	@ipServerName			NVARCHAR(448), 
	@ipObjectName			NVARCHAR(448) = 'All',
	@ipLoginName			NVARCHAR(448) = 'All',
	@ipHostName				NVARCHAR(448) = 'All',
	@ipDatabaseName			NVARCHAR(448) = 'All',
	@ipAllowNullObjectName	CHAR(1) = 'Y',
	@ipSortField			VARCHAR(48) = '',  
	@ipSortDirection		VARCHAR(5) = 'DESC',
	@ipTop					VARCHAR(5) = 'All',
	@ipBeginStartTime		DATETIME = '1/1/2000',
	@ipEndStartTime			DATETIME = '12/31/9999',
	@ipDebugFlag			CHAR(1) = 'N'
AS
/*
	Stored Procedure	dbo.pGetTrace
	Author				Clayton Wilson
	Date				06/12/2007

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

	IF @ipLoginName = 'All'
		SET @ipLoginName = NULL

	IF @ipHostName = 'All'
		SET @ipHostName = NULL

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
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',TextData'  
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',CONVERT(VARCHAR(23), StartTime, 21) AS StartTime'  
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',CONVERT(VARCHAR(23), EndTime, 21) AS EndTime'  
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',ROUND(CAST((CPU * .001) AS FLOAT), 3) AS CPU'  
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',ROUND(CAST((Duration * .000001) AS FLOAT), 6) AS Duration'  
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',Reads'  
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',Writes'  
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',LoginName'  
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',HostName'
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',DatabaseName'
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',ApplicationName'
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',ServerName'

	/*FROM*/
	IF @ipTraceType = 'Duration'
	BEGIN

		SELECT @lvSQL = @lvSQL + CHAR(13) + 'FROM dbo.tTraceDuration' 
		/*WHERE*/
		SELECT @lvSQL = @lvSQL + CHAR(13) + 'WHERE Duration IS NOT NULL'  

	END
	ELSE IF @ipTraceType = 'CPU'
	BEGIN

		SELECT @lvSQL = @lvSQL + CHAR(13) + 'FROM dbo.tTraceCPU' 
		/*WHERE*/
		SELECT @lvSQL = @lvSQL + CHAR(13) + 'WHERE CPU IS NOT NULL'  

	END
	ELSE IF @ipTraceType = 'ApplicationName'
	BEGIN

		SELECT @lvSQL = @lvSQL + CHAR(13) + 'FROM dbo.tTraceApplicationName' 
		/*WHERE*/
		SELECT @lvSQL = @lvSQL + CHAR(13) + 'WHERE ApplicationName IS NOT NULL'  

	END

	/*WHERE*/
	SELECT @lvSQL = @lvSQL + CHAR(13) + 'AND ServerName = ISNULL(@xServerName, ServerName)' 
	SELECT @lvSQL = @lvSQL + CHAR(13) + 'AND DatabaseName = ISNULL(@xDatabaseName, DatabaseName)'
	SELECT @lvSQL = @lvSQL + CHAR(13) + 'AND LoginName = ISNULL(@xLoginName, LoginName)' 
	SELECT @lvSQL = @lvSQL + CHAR(13) + 'AND HostName = ISNULL(@xHostName, HostName)' 
	SELECT @lvSQL = @lvSQL + CHAR(13) + 'AND ISNULL(ObjectName, ''Y'') = ISNULL(ObjectName, @xAllowNullObjectName)' 
	SELECT @lvSQL = @lvSQL + CHAR(13) + 'AND ISNULL(ObjectName, '''') = COALESCE(@xObjectName, ObjectName, '''')' 
	SELECT @lvSQL = @lvSQL + CHAR(13) + 'AND StartTime >= @xBeginStartTime'
	SELECT @lvSQL = @lvSQL + CHAR(13) + 'AND StartTime <= @xEndStartTime'

	/*ORDER BY*/
	SELECT @lvSQL = @lvSQL + CHAR(13) + 'ORDER BY ' + CASE @ipSortField 
														WHEN 'ObjectName' THEN 'ObjectName ' + @ipSortDirection
														WHEN 'ServerName' THEN 'ServerName ' + @ipSortDirection + ', ObjectName ASC'
														WHEN 'TextData' THEN 'TextData ' + @ipSortDirection + ', ObjectName ASC'
														WHEN 'StartTime' THEN 'StartTime ' + @ipSortDirection + ', ObjectName ASC'
														WHEN 'EndTime' THEN 'EndTime ' + @ipSortDirection + ', ObjectName ASC'
														WHEN 'CPU' THEN 'CPU ' + @ipSortDirection + ', ObjectName ASC'
														WHEN 'Duration' THEN 'Duration ' + @ipSortDirection + ', ObjectName ASC'
														WHEN 'Reads' THEN 'Reads ' + @ipSortDirection + ', ObjectName ASC'
														WHEN 'Writes' THEN 'Writes ' + @ipSortDirection + ', ObjectName ASC'
														WHEN 'LoginName' THEN 'LoginName ' + @ipSortDirection + ', ObjectName ASC'
														WHEN 'HostName' THEN 'HostName ' + @ipSortDirection + ', ObjectName ASC'
														WHEN 'DatabaseName' THEN 'DatabaseName ' + @ipSortDirection + ', ObjectName ASC'
														WHEN 'ApplicationName' THEN 'ApplicationName ' + @ipSortDirection + ', ObjectName ASC'
														ELSE 'ObjectName ' + @ipSortDirection
													  END

	SELECT @lvParams = ''  
	SELECT @lvParams = @lvParams + CHAR(13) + ' @xTop					INT'  
	SELECT @lvParams = @lvParams + CHAR(13) + ' ,@xServerName			NVARCHAR(448)' 	
	SELECT @lvParams = @lvParams + CHAR(13) + ' ,@xDatabaseName			NVARCHAR(448)' 
	SELECT @lvParams = @lvParams + CHAR(13) + ' ,@xLoginName			NVARCHAR(448)'  
	SELECT @lvParams = @lvParams + CHAR(13) + ' ,@xHostName				NVARCHAR(448)' 
	SELECT @lvParams = @lvParams + CHAR(13) + ' ,@xAllowNullObjectName	CHAR(1)'  
	SELECT @lvParams = @lvParams + CHAR(13) + ' ,@xObjectName			NVARCHAR(448)'  
	SELECT @lvParams = @lvParams + CHAR(13) + ' ,@xBeginStartTime			DATETIME' 
	SELECT @lvParams = @lvParams + CHAR(13) + ' ,@xEndStartTime				DATETIME' 

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
		,@ipDatabaseName
		,@ipLoginName
		,@ipHostName
		,@ipAllowNullObjectName
		,@ipObjectName
		,@ipBeginStartTime
		,@ipEndStartTime

END TRY
BEGIN CATCH

	SET @lvErrorMsg = ISNULL(@lvErrorMsg, 'RAISERROR: PROCEDURE: ' + ERROR_PROCEDURE() + ' -> ' + CAST(ERROR_NUMBER() AS VARCHAR) + ' -> ' + ERROR_MESSAGE())
	RAISERROR (@lvErrorMsg, 16, 1)

END CATCH

GO
GRANT EXECUTE ON  [dbo].[pGetTrace] TO [ltReportingService]
GO
