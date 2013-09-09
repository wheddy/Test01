SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE CommissionJunction.pGetLoanAmountRangeListByEChannelAndProduct
	@ipEChannelID			INT = 13801681, -- LendingTree
	@ipProductTypeLookup	INT = 0
AS
/*
	Description:	Returns a list of Loan Amount Ranges for a given EChannel/Product
	Created:		2008-APR-02, Jamie S. Smith
	Called By:		CommissionJunction pricing page (internal app)

$Log$

*/
SET NOCOUNT ON 
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

SELECT LoanAmountRangeID, Description
FROM CommissionJunction.tLoanAmountRanges
WHERE EChannelID = @ipEChannelID
	AND ProductTypeLookup = @ipProductTypeLookup
	AND Enabled = 'Y'
ORDER BY Description
GO
