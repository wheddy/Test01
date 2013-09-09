SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE CommissionJunction.pGetActiveAffiliateGroupPricingDefinitionList
AS
/*
	Description:	Returns a list of active Affiliate Group Pricing Definitions
	Created:		2008-APR-02, Jamie S. Smith
	Called By:		CommissionJunction pricing page (internal app)

$Log$

*/
SET NOCOUNT ON 
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

SELECT AffiliateGroupPricingDefinitionID, AffiliateGroupPricingID, FICORangeID, LoanAmountRangeID
FROM CommissionJunction.tAffiliateGroupPricingDefinition
WHERE EffectiveStartDate <= GETDATE()  
	AND ExpirationDate > GETDATE()  
GO
