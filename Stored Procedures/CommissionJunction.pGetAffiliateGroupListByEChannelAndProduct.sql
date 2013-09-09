SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE CommissionJunction.pGetAffiliateGroupListByEChannelAndProduct
	@ipEChannelID			INT = 13801681, -- LendingTree
	@ipProductTypeLookup	INT = 0,
	@ipProductSubTypeLookup	INT = 0
AS
/*
	Description:	Returns a list of AffiliateGroupPricingIDs and GroupIDs 
					for a given EChannel/Product/ProductSubType
	Created:		2008-APR-02, Jamie S. Smith
	Called By:		CommissionJunction pricing page (internal app)

$Log$

*/
SET NOCOUNT ON 
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

SELECT AffiliateGroupPricingID, GroupID
FROM CommissionJunction.tAffiliateGroupPricing
WHERE EChannelID = @ipEChannelID
	AND ProductTypeLookup = @ipProductTypeLookup
	AND ISNULL(ProductSubTypeLookup, 0) = ISNULL(@ipProductSubTypeLookup, 0)
	AND Enabled = 'Y'
ORDER BY GroupID
GO
