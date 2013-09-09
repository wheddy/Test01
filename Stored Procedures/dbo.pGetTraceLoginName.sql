SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.pGetTraceLoginName
	@ipServerName			NVARCHAR(448),
	@ipTraceType			VARCHAR(16),
	@ipDatabaseName			NVARCHAR(448),
	@ipHostName				NVARCHAR(448)
AS
/*
	Stored Procedure	dbo.pGetTraceLoginName
	Author				Clayton Wilson
	Date				06/12/2007

$Log$
*/

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET NOCOUNT ON

IF @ipDatabaseName = 'All'
	SET @ipDatabaseName = NULL

IF @ipHostName = 'All'
	SET @ipHostName = NULL

IF @ipTraceType = 'Duration'
BEGIN

	SELECT DISTINCT LoginName
	FROM dbo.tTraceDuration
	WHERE ServerName = ISNULL(@ipServerName, ServerName)
	AND DatabaseName = ISNULL(@ipDatabaseName, DatabaseName)
	AND HostName = ISNULL(@ipHostName, HostName)
	AND LoginName IS NOT NULL
	UNION
	SELECT 'All'

END
ELSE IF @ipTraceType = 'CPU'
BEGIN

	SELECT DISTINCT LoginName
	FROM dbo.tTraceCPU
	WHERE ServerName = ISNULL(@ipServerName, ServerName)
	AND DatabaseName = ISNULL(@ipDatabaseName, DatabaseName)
	AND HostName = ISNULL(@ipHostName, HostName)
	AND LoginName IS NOT NULL
	UNION
	SELECT 'All'

END
ELSE IF @ipTraceType = 'ApplicationName'
BEGIN

	SELECT DISTINCT LoginName
	FROM dbo.tTraceApplicationName
	WHERE ServerName = ISNULL(@ipServerName, ServerName)
	AND DatabaseName = ISNULL(@ipDatabaseName, DatabaseName)
	AND HostName = ISNULL(@ipHostName, HostName)
	AND LoginName IS NOT NULL
	UNION
	SELECT 'All'

END
ELSE
	SELECT 'All' AS LoginName
GO
GRANT EXECUTE ON  [dbo].[pGetTraceLoginName] TO [ltReportingService]
GO
