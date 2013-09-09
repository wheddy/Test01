SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.pGetMissingIndexesInsertDate
AS
/*
	Stored Procedure	dbo.pGetMissingIndexesInsertDate
	Author				Clayton Wilson
	Date				10/03/2007

$Log$
*/

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET NOCOUNT ON

SELECT DISTINCT InsertDate
FROM dbo.tMissingIndexes
WHERE InsertDate IS NOT NULL
UNION
SELECT 'All'
ORDER BY InsertDate DESC
GO
GRANT EXECUTE ON  [dbo].[pGetMissingIndexesInsertDate] TO [ltReportingService]
GO
