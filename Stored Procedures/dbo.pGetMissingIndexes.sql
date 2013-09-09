SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.pGetMissingIndexes
	@ipServerName			NVARCHAR(448),	
	@ipDatabaseName			NVARCHAR(448) = 'All',
	@ipTableName			NVARCHAR(448) = 'All',
	@ipSortField			VARCHAR(48) = '',  
	@ipSortDirection		VARCHAR(5) = 'DESC',
	@ipTop					VARCHAR(5) = 'All',
	@ipInsertDate			CHAR(10) = 'All',
	@ipDebugFlag			CHAR(1) = 'N'
AS
/*
	Stored Procedure	dbo.pGetMissingIndexes
	Author				Clayton Wilson
	Date				06/21/2007

$Log$
*/

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET NOCOUNT ON

BEGIN TRY 

	DECLARE @lvErrorMsg	VARCHAR(MAX)

	DECLARE @lvSQL		NVARCHAR(4000)
	DECLARE @lvParams	NVARCHAR(512) 

	DECLARE @lvTop		INT

	IF @ipDatabaseName = 'All'
		SET @ipDatabaseName = NULL

	IF @ipTableName = 'All'
		SET @ipTableName = NULL

	IF @ipInsertDate = 'All'
		SET @ipInsertDate = NULL

	IF @ipTop = 'All'
		SET @lvTop = 1000000
	ELSE
		SET @lvTop = CONVERT(INT, @ipTop)

	/*SELECT*/
	SELECT @lvSQL = ''
	SELECT @lvSQL = @lvSQL + 'SELECT TOP(@xTop)' 
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + 'DatabaseName'   
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',TableName'  
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',EqualityColumns'  
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',InequalityColumns'  
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',UniqueCompiles'  
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',UserSeeks'  
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',CONVERT(VARCHAR(23), LastUserSeek, 21) AS LastUserSeek'  
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',CAST(AvgTotalUserCost AS DECIMAL(9,4)) AS AvgTotalUserCost'  
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',CAST(AvgUserImpact AS DECIMAL(7,2)) AS AvgUserImpact'  
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',ServerName'
	SELECT @lvSQL = @lvSQL + CHAR(13) + CHAR(9) + ',InsertDate'

	/*FROM*/
	SELECT @lvSQL = @lvSQL + CHAR(13) + 'FROM dbo.tMissingIndexes' 

	/*WHERE*/
	SELECT @lvSQL = @lvSQL + CHAR(13) + 'WHERE ServerName = @xServerName' 
	SELECT @lvSQL = @lvSQL + CHAR(13) + 'AND DatabaseName = ISNULL(@xDatabaseName, DatabaseName)' 
	SELECT @lvSQL = @lvSQL + CHAR(13) + 'AND TableName = ISNULL(@xTableName, TableName)' 
	SELECT @lvSQL = @lvSQL + CHAR(13) + 'AND InsertDate = ISNULL(@xInsertDate, InsertDate)' 

	/*ORDER BY*/
	SELECT @lvSQL = @lvSQL + CHAR(13) + 'ORDER BY ' + CASE @ipSortField 
														WHEN 'TableName' THEN 'TableName ' + @ipSortDirection + ', InsertDate DESC'
														WHEN 'DatabaseName' THEN 'DatabaseName ' + @ipSortDirection + ', TableName ASC, InsertDate DESC'
														WHEN 'EqualityColumns' THEN 'EqualityColumns ' + @ipSortDirection + ', TableName ASC, InsertDate DESC'
														WHEN 'InequalityColumns' THEN 'InequalityColumns ' + @ipSortDirection + ', TableName ASC, InsertDate DESC'
														WHEN 'IncludedColumns' THEN 'IncludedColumns ' + @ipSortDirection + ', TableName ASC, InsertDate DESC'
														WHEN 'UniqueCompiles' THEN 'UniqueCompiles ' + @ipSortDirection + ', TableName ASC, InsertDate DESC'
														WHEN 'UserSeeks' THEN 'UserSeeks ' + @ipSortDirection + ', TableName ASC, InsertDate DESC'
														WHEN 'LastUserSeek' THEN 'LastUserSeek ' + @ipSortDirection + ', TableName ASC, InsertDate DESC'
														WHEN 'AvgTotalUserCost' THEN 'AvgTotalUserCost ' + @ipSortDirection + ', TableName ASC, InsertDate DESC'
														WHEN 'AvgUserImpact' THEN 'AvgUserImpact ' + @ipSortDirection + ', TableName ASC, InsertDate DESC'
														WHEN 'InsertDate' THEN 'InsertDate ' + @ipSortDirection + ', TableName ASC'
														ELSE 'TableName ' + @ipSortDirection + ', InsertDate DESC'
													  END

	SELECT @lvParams = ''  
	SELECT @lvParams = @lvParams + CHAR(13) + ' @xTop			INT'  
	SELECT @lvParams = @lvParams + CHAR(13) + ' ,@xServerName	NVARCHAR(448)'  
	SELECT @lvParams = @lvParams + CHAR(13) + ' ,@xDatabaseName	NVARCHAR(448)' 
	SELECT @lvParams = @lvParams + CHAR(13) + ' ,@xTableName	NVARCHAR(448)'
 	SELECT @lvParams = @lvParams + CHAR(13) + ' ,@xInsertDate	CHAR(10)'

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
		,@ipTableName
		,@ipInsertDate

END TRY
BEGIN CATCH

	SET @lvErrorMsg = ISNULL(@lvErrorMsg, 'RAISERROR: PROCEDURE: ' + ERROR_PROCEDURE() + ' -> ' + CAST(ERROR_NUMBER() AS VARCHAR) + ' -> ' + ERROR_MESSAGE())
	RAISERROR (@lvErrorMsg, 16, 1)

END CATCH

GO
GRANT EXECUTE ON  [dbo].[pGetMissingIndexes] TO [ltReportingService]
GO
