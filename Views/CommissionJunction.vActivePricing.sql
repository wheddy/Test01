SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW CommissionJunction.vActivePricing  
AS  
SELECT PartnerUID, ProductTypeLookup, ProductSubTypeLookup, ActionCode,   
 CostPerAction, CJMinTransmitRevenue, CJMaxTransmitRevenue  
FROM CommissionJunction.tAffiliateGroupPricing WITH (NOLOCK)  
GO
