SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE CommissionJunction.pGetFICORangeListByEChannel
	@ipEChannelID			INT = 13801681	-- LendingTree
AS
/*
	Description:	Returns a list of FICORangeIDs and Descriptions, if the EChannel
					is GetSmart we return one value, otherwise we return the list of 
					standard ranges
	Created:		2008-APR-02, Jamie S. Smith
	Called By:		CommissionJunction pricing page (internal app)

$Log$

*/
SET NOCOUNT ON 
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

IF @ipEChannelID = 18171279	-- GetSmart
	SELECT FICORangeID, Description
	FROM CommissionJunction.tFICORanges
	WHERE FICORangeID = 4
		AND Enabled = 'Y'
ELSE
	SELECT FICORangeID, Description
	FROM CommissionJunction.tFICORanges
	WHERE FICORangeID != 4
		AND Enabled = 'Y'

GO
