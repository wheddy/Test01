SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Shahzad Khan
-- Create date: Jan 31, 2011
-- Description:	Log all pre execute tasks for packages
-- =============================================
CREATE PROCEDURE [Config].[sp_LogPackageTaskPreExecute] 
	-- Add the parameters for the stored procedure here
(    @PackageLogID int
    ,@SourceName varchar(64)
    ,@SourceID uniqueidentifier
    ,@PackageID uniqueidentifier
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	-- pre-execute SSIS event send packagelogid = 0 at startup
	-- so > 0
	SET NOCOUNT ON;
    IF @PackageID <> @SourceID 
		AND @PackageLogID > 0		--Pre-execute SSIS task generate 0
        AND @SourceName <> 'TSQL - Log Package Starts'
        AND @SourceName <> 'TSQL - Log Package Ends'
        INSERT INTO Config.SSIS_PackageTaskLog (PackageLogID, SourceName, SourceGUID, StartDateTime, InsertDateTime, UpdateDateTime)
        VALUES (@PackageLogID, @SourceName, @SourceID, getdate(), GETDATE(), GETDATE())
END
GO
