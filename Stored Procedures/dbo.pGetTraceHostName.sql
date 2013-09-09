SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.pGetTraceHostName
	@ipServerName			NVARCHAR(448),
	@ipTraceType			VARCHAR(16),
	@ipDatabaseName			NVARCHAR(448)
AS
/*
	Stored Procedure	dbo.pGetTraceHostName
	Author				Clayton Wilson
	Date				06/12/2007

$Log$
*/

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET NOCOUNT ON

IF @ipDatabaseName = 'All'
	SET @ipDatabaseName = NULL

IF @ipTraceType = 'Duration'
BEGIN

	SELECT DISTINCT HostName
	FROM dbo.tTraceDuration
	WHERE ServerName = ISNULL(@ipServerName, ServerName)
	AND DatabaseName = ISNULL(@ipDatabaseName, DatabaseName)
	AND HostName IS NOT NULL
	UNION
	SELECT 'All'

END
ELSE IF @ipTraceType = 'CPU'
BEGIN

	SELECT DISTINCT HostName
	FROM dbo.tTraceCPU
	WHERE ServerName = ISNULL(@ipServerName, ServerName)
	AND DatabaseName = ISNULL(@ipDatabaseName, DatabaseName)
	AND HostName IS NOT NULL
	UNION
	SELECT 'All'

END
ELSE IF @ipTraceType = 'ApplicationName'
BEGIN

	SELECT DISTINCT HostName
	FROM dbo.tTraceApplicationName
	WHERE ServerName = ISNULL(@ipServerName, ServerName)
	AND DatabaseName = ISNULL(@ipDatabaseName, DatabaseName)
	AND HostName IS NOT NULL
	UNION
	SELECT 'All'

END
ELSE
	SELECT 'All' AS HostName
GO
GRANT EXECUTE ON  [dbo].[pGetTraceHostName] TO [ltReportingService]
GO
