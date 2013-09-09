SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.pGetHistoricalTraceObjectName
	@ipTraceType			VARCHAR(16),
	@ipServerName			NVARCHAR(448),
	@ipDatabaseName			NVARCHAR(448)
AS
/*
	Stored Procedure	dbo.pGetHistoricalTraceObjectName
	Author				Clayton Wilson
	Date				06/14/2007

$Log$
*/

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET NOCOUNT ON

IF @ipDatabaseName = 'All'
	SET @ipDatabaseName = NULL

IF @ipTraceType = 'Duration'
BEGIN

	SELECT DISTINCT ObjectName
	FROM dbo.tTraceHistoricalDuration
	WHERE ServerName = ISNULL(@ipServerName, ServerName)
	AND DatabaseName = ISNULL(@ipDatabaseName, DatabaseName)
	AND ObjectName IS NOT NULL
	UNION
	SELECT 'All'

END
ELSE IF @ipTraceType = 'CPU'
BEGIN

	SELECT DISTINCT ObjectName
	FROM dbo.tTraceHistoricalCPU
	WHERE ServerName = ISNULL(@ipServerName, ServerName)
	AND DatabaseName = ISNULL(@ipDatabaseName, DatabaseName)
	AND ObjectName IS NOT NULL
	UNION
	SELECT 'All'

END
ELSE
	SELECT 'All' AS ObjectName
GO
GRANT EXECUTE ON  [dbo].[pGetHistoricalTraceObjectName] TO [ltReportingService]
GO
