SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.pGetMissingIndexesServerName
AS
/*
	Stored Procedure	dbo.pGetMissingIndexesServerName
	Author				Clayton Wilson
	Date				07/31/2007

$Log$
*/

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET NOCOUNT ON

SELECT DISTINCT ServerName
FROM dbo.tMissingIndexes
WHERE ServerName IS NOT NULL
GO
GRANT EXECUTE ON  [dbo].[pGetMissingIndexesServerName] TO [ltReportingService]
GO
