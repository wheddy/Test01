SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Shahzad Khan
-- Create date: Nov 12, 2010
-- Description:	Log package error information
-- =============================================
CREATE PROCEDURE [Config].[sp_MasterPackageLogError] 
	-- Add the parameters for the stored procedure here
(    @ExtractID int
    ,@ETLControlID int
    ,@SourceName varchar(64)
    ,@SourceID uniqueidentifier
    ,@ErrorCode int
    ,@ErrorDescription varchar(2000)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    INSERT INTO Config.SSIS_ObjectExtractsErrorLog (ExtractID, SourceName, SourceGUID, ErrorCode, ErrorDescription, ETLControlID, InsertDateTime, UpdateDateTime)
    VALUES (@ExtractID, @SourceName, @SourceID, @ErrorCode, @ErrorDescription, @ETLControlID, GETDATE(), GETDATE())

    UPDATE Config.SSIS_ObjectExtracts
        SET Status = 'F'
            , EndDatetime = GETDATE()
            , UpdateDateTime = GETDATE()
        WHERE ExtractID = @ExtractID

END
GO
