SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Shahzad Khan
-- Create date: Jan 31, 2011
-- Description:	Turn SSIS Logging Off
-- =============================================
CREATE PROCEDURE [Config].[sp_LogPackageEnd] 
	-- Add the parameters for the stored procedure here
(    @PackageLogID int
    ,@ETLControlID int
    ,@EndBatchAudit bit
    --source specific information
    ,@DataTableName varchar(100)
    ,@SourceRowCount int
    ,@InsertRowCount int
    ,@UpdateRowCount int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    UPDATE Config.SSIS_PackageLog
        SET Status = 'S'
        , EndDatetime = getdate()
        , DataTableName = @DataTableName
        , SourceRowCount = @SourceRowCount
        , InsertRowCount = @InsertRowCount
        , UpdateRowCount = @UpdateRowCount
        , UpdateDateTime = GETDATE()
        WHERE PackageLogID = @PackageLogID
END
GO
