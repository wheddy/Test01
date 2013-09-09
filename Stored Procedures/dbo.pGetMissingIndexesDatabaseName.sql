SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.pGetMissingIndexesDatabaseName
	@ipServerName	NVARCHAR(448)
AS
/*
	Stored Procedure	dbo.pGetMissingIndexesDatabaseName
	Author				Clayton Wilson
	Date				06/21/2007

$Log$
*/

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET NOCOUNT ON

SELECT DISTINCT DatabaseName
FROM dbo.tMissingIndexes
WHERE ServerName = @ipServerName
UNION
SELECT 'All'
GO
GRANT EXECUTE ON  [dbo].[pGetMissingIndexesDatabaseName] TO [ltReportingService]
GO
