SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.pGetHistoricalTraceServerName
	@ipTraceType			VARCHAR(16)
AS
/*
	Stored Procedure	dbo.pGetHistoricalTraceServerName
	Author				Clayton Wilson
	Date				07/27/2007

$Log$
*/

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET NOCOUNT ON

IF @ipTraceType = 'Duration'
BEGIN

	SELECT DISTINCT ServerName
	FROM dbo.tTraceHistoricalDuration
	WHERE ServerName IS NOT NULL

END
ELSE IF @ipTraceType = 'CPU'
BEGIN

	SELECT DISTINCT ServerName
	FROM dbo.tTraceHistoricalCPU
	WHERE ServerName IS NOT NULL

END
GO
GRANT EXECUTE ON  [dbo].[pGetHistoricalTraceServerName] TO [ltReportingService]
GO
