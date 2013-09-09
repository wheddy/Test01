SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.pGetTraceDatabaseName
	@ipServerName			NVARCHAR(448),
	@ipTraceType			VARCHAR(16)
AS
/*
	Stored Procedure	dbo.pGetTraceDatabaseName
	Author				Clayton Wilson
	Date				06/12/2007

$Log$
*/

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET NOCOUNT ON

IF @ipTraceType = 'Duration'
BEGIN

	SELECT DISTINCT DatabaseName
	FROM dbo.tTraceDuration
	WHERE ServerName = ISNULL(@ipServerName, ServerName)
	AND DatabaseName IS NOT NULL
	UNION
	SELECT 'All'

END
ELSE IF @ipTraceType = 'CPU'
BEGIN

	SELECT DISTINCT DatabaseName
	FROM dbo.tTraceCPU
	WHERE ServerName = ISNULL(@ipServerName, ServerName)
	AND DatabaseName IS NOT NULL
	UNION
	SELECT 'All'

END
ELSE IF @ipTraceType = 'ApplicationName'
BEGIN

	SELECT DISTINCT DatabaseName
	FROM dbo.tTraceApplicationName
	WHERE ServerName = ISNULL(@ipServerName, ServerName)
	AND DatabaseName IS NOT NULL
	UNION
	SELECT 'All'

END
ELSE
	SELECT 'All' AS DatabaseName

GO
GRANT EXECUTE ON  [dbo].[pGetTraceDatabaseName] TO [ltReportingService]
GO
