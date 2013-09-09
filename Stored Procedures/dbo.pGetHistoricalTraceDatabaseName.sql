SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.pGetHistoricalTraceDatabaseName
	@ipTraceType				VARCHAR(16),
	@ipServerName				NVARCHAR(448)
AS
/*
	Stored Procedure	dbo.pGetHistoricalTraceDatabaseName
	Author				Clayton Wilson
	Date				06/14/2007

$Log$
*/

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET NOCOUNT ON

IF @ipTraceType = 'Duration'
BEGIN

	SELECT DISTINCT DatabaseName
	FROM dbo.tTraceHistoricalDuration
	WHERE ServerName = ISNULL(@ipServerName, ServerName)
	AND DatabaseName IS NOT NULL
	UNION
	SELECT 'All'

END
ELSE IF @ipTraceType = 'CPU'
BEGIN

	SELECT DISTINCT DatabaseName
	FROM dbo.tTraceHistoricalCPU
	WHERE ServerName = ISNULL(@ipServerName, ServerName)
	AND DatabaseName IS NOT NULL
	UNION
	SELECT 'All'

END
ELSE
	SELECT 'All' AS DatabaseName
GO
GRANT EXECUTE ON  [dbo].[pGetHistoricalTraceDatabaseName] TO [ltReportingService]
GO
