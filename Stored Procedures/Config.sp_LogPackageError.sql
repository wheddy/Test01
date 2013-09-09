SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Shahzad Khan
-- Create date: Jan 31, 2011
-- Description:	Log package error information
-- =============================================
CREATE PROCEDURE [Config].[sp_LogPackageError] 
	-- Add the parameters for the stored procedure here
(    @PackageLogID int
    ,@SourceName varchar(64)
    ,@SourceID uniqueidentifier
    ,@ErrorCode int
    ,@ErrorDescription varchar(2000)
    ,@EndBatchAudit bit
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    INSERT INTO Config.SSIS_PackageErrorLog (PackageLogID, SourceName, SourceGUID, ErrorCode, ErrorDescription, LogDateTime, InsertDateTime, UpdateDateTime)
    VALUES (@PackageLogID, @SourceName, @SourceID, @ErrorCode, @ErrorDescription, getdate(), GETDATE(),	GETDATE())
	
    UPDATE Config.SSIS_PackageLog
        SET Status = 'F'
            , EndDatetime = getdate()
            , UpdateDateTime = GETDATE()
        WHERE PackageLogID = @PackageLogID

END
GO
