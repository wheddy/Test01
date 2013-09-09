SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.pGetTraceObjectName
	@ipServerName			NVARCHAR(448),
	@ipTraceType			VARCHAR(16),
	@ipDatabaseName			NVARCHAR(448),
	@ipHostName				NVARCHAR(448),
	@ipLoginName			NVARCHAR(448)
AS
/*
	Stored Procedure	dbo.pGetTraceObjectName
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

IF @ipLoginName = 'All'
	SET @ipLoginName = NULL

IF @ipTraceType = 'Duration'
BEGIN

	SELECT DISTINCT ObjectName
	FROM dbo.tTraceDuration
	WHERE ServerName = ISNULL(@ipServerName, ServerName)
	AND DatabaseName = ISNULL(@ipDatabaseName, DatabaseName)
	AND HostName = ISNULL(@ipHostName, HostName)
	AND LoginName = ISNULL(@ipLoginName, LoginName)	
	AND ObjectName IS NOT NULL
	UNION
	SELECT 'All'

END
ELSE IF @ipTraceType = 'CPU'
BEGIN

	SELECT DISTINCT ObjectName
	FROM dbo.tTraceCPU
	WHERE ServerName = ISNULL(@ipServerName, ServerName)
	AND DatabaseName = ISNULL(@ipDatabaseName, DatabaseName)
	AND HostName = ISNULL(@ipHostName, HostName)
	AND LoginName = ISNULL(@ipLoginName, LoginName)	
	AND ObjectName IS NOT NULL
	UNION
	SELECT 'All'

END
ELSE IF @ipTraceType = 'ApplicationName'
BEGIN

	SELECT DISTINCT ObjectName
	FROM dbo.tTraceApplicationName
	WHERE ServerName = ISNULL(@ipServerName, ServerName)
	AND DatabaseName = ISNULL(@ipDatabaseName, DatabaseName)
	AND HostName = ISNULL(@ipHostName, HostName)
	AND LoginName = ISNULL(@ipLoginName, LoginName)	
	AND ObjectName IS NOT NULL
	UNION
	SELECT 'All'

END
ELSE
	SELECT 'All' AS ObjectName
GO
GRANT EXECUTE ON  [dbo].[pGetTraceObjectName] TO [ltReportingService]
GO
