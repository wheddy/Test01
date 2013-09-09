SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.pGetTraceServerName
	@ipTraceType			VARCHAR(16)
AS
/*
	Stored Procedure	dbo.pGetTraceServerName
	Author				Clayton Wilson
	Date				07/27/2007

$Log$
*/

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET NOCOUNT ON

IF @ipTraceType = 'Duration'
BEGIN

	SELECT DISTINCT ServerName
	FROM dbo.tTraceDuration
	WHERE ServerName IS NOT NULL

END
ELSE IF @ipTraceType = 'CPU'
BEGIN

	SELECT DISTINCT ServerName
	FROM dbo.tTraceCPU
	WHERE ServerName IS NOT NULL

END
ELSE IF @ipTraceType = 'ApplicationName'
BEGIN

	SELECT DISTINCT ServerName
	FROM dbo.tTraceApplicationName
	WHERE ServerName IS NOT NULL

END
GO
GRANT EXECUTE ON  [dbo].[pGetTraceServerName] TO [ltReportingService]
GO
