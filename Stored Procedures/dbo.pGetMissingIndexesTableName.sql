SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.pGetMissingIndexesTableName
	@ipServerName			NVARCHAR(448),
	@ipDatabaseName			NVARCHAR(448)
AS
/*
	Stored Procedure	dbo.pGetMissingIndexesTableName
	Author				Clayton Wilson
	Date				06/21/2007

$Log$
*/

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET NOCOUNT ON

IF @ipDatabaseName = 'All'
	SET @ipDatabaseName = NULL

SELECT DISTINCT TableName
FROM dbo.tMissingIndexes
WHERE ServerName = @ipServerName 
AND DatabaseName = ISNULL(@ipDatabaseName, DatabaseName)
UNION
SELECT 'All'
GO
GRANT EXECUTE ON  [dbo].[pGetMissingIndexesTableName] TO [ltReportingService]
GO
