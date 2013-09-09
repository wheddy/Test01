SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE CommissionJunction.pAddModAffiliateGroupPricingDefinition
	@ipAffiliateGroupPricingDefinitionID	INT,
	@ipAffiliateGroupPricingID				INT, 
	@ipEffectiveStartDate					DATETIME = NULL,
	@ipExpirationDate						DATETIME = NULL,
	@opAffiliateGroupPricingDefinitionID	INT OUTPUT
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

DECLARE @lvFICORangeID			INT
DECLARE @lvLoanAmountRangeID	INT
DECLARE @lvErrorMsg				VARCHAR(500)

BEGIN TRY

--	Validate our input parameters
IF @ipAffiliateGroupPricingDefinitionID IS NULL
	RAISERROR ('@ipAffiliateGroupPricingDefinitionID cannot be NULL.', 11, 1)

IF @ipAffiliateGroupPricingID IS NULL
	RAISERROR ('@ipAffiliateGroupPricingID cannot be NULL.', 11, 1)

--	Retrieve current FICO and Loan Amount Range
SELECT @lvFICORangeID = FICORangeID, @lvLoanAmountRangeID = LoanAmountRangeID
FROM CommissionJunction.tAffiliateGroupPricingDefinition
WHERE AffiliateGroupPricingDefinitionID = @ipAffiliateGroupPricingDefinitionID

BEGIN TRANSACTION 
	--	Expire existing record
	UPDATE CommissionJunction.tAffiliateGroupPricingDefinition SET
		ExpirationDate = ISNULL(@ipExpirationDate, GETDATE())
	WHERE AffiliateGroupPricingDefinitionID = @ipAffiliateGroupPricingDefinitionID

	--	Add our new record
	INSERT INTO CommissionJunction.tAffiliateGroupPricingDefinition (
		AffiliateGroupPricingID, 
		FICORangeID, 
		LoanAmountRangeID, 
		EffectiveStartDate)
	VALUES (
		@ipAffiliateGroupPricingID,
		@lvFICORangeID,
		@lvLoanAmountRangeID,
		ISNULL(@ipEffectiveStartDate, GETDATE())
		)

	SET @opAffiliateGroupPricingDefinitionID = SCOPE_IDENTITY()

COMMIT TRANSACTION 

RETURN (0)

END TRY
BEGIN CATCH
    IF (XACT_STATE()) != 0
    BEGIN
        SET @lvErrorMsg = ERROR_MESSAGE()
		RAISERROR(@lvErrorMsg, 16, 1)
        ROLLBACK TRANSACTION
    END
	RETURN (-1)
END CATCH
GO
