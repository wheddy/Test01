SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Shahzad Khan
-- Create date: Jan 31, 2011
-- Description:	Log post execute tasks of packages
-- =============================================
CREATE PROCEDURE [Config].[sp_LogPackageTaskPostExecute] 
	-- Add the parameters for the stored procedure here
(    @PackageLogID int
    ,@SourceID uniqueidentifier
    ,@PackageID uniqueidentifier
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    IF @PackageID <> @SourceID
        UPDATE Config.SSIS_PackageTaskLog 
            SET EndDateTime = getdate()
            ,UpdateDateTime = GETDATE()
            WHERE PackageLogID = @PackageLogID AND SourceGUID = @SourceID
                AND EndDateTime is null
END
GO
