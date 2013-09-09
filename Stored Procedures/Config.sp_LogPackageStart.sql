SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:			Shahzad Khan
-- Date Created:	Jan 31, 2011
-- Description:		Truns SSIS Package logging ON
-- =============================================
CREATE PROCEDURE [Config].[sp_LogPackageStart] 
	-- Add the parameters for the stored procedure here
(    @ETLControlID int
    ,@PackageName varchar(255) 
    ,@ExecutionInstanceID uniqueidentifier 
    ,@MachineName varchar(64) 
    ,@UserName varchar(64) 
    ,@StartDatetime datetime 
    ,@PackageVersionGUID uniqueidentifier 
    ,@VersionMajor int 
    ,@VersionMinor int 
    ,@VersionBuild int 
    ,@VersionComment varchar(1000) 
    ,@PackageGUID uniqueidentifier 
    ,@CreationDate datetime 
    ,@CreatedBy varchar(255)
    ,@WindowDateFrom varchar(25)
    ,@WindowDateTo varchar(25) 
    ,@SQLStatement varchar(max)
    ,@SQLPreProcess varchar(max)
    ,@SQLPostProcess varchar(max)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @PackageID int
		,@PackageVersionID int 
		,@PackageLogID int
		,@EndBatchAudit bit
		,@DataLoadWindow varchar(50) = @WindowDateFrom + ' | ' + @WindowDateTo
		
	/* Initialize Variables */
	SELECT @EndBatchAudit = 0

	/* Get Package Metadata ID */
	IF NOT EXISTS (SELECT 1 FROM Config.SSIS_Package WHERE PackageGUID = @PackageGUID AND PackageName = @PackageName)
	Begin
		INSERT INTO Config.SSIS_Package (PackageGUID, PackageName, CreationDate, CreatedBy, InsertDateTime, UpdateDateTime)
			VALUES (@PackageGUID, @PackageName, @CreationDate, @CreatedBy, GETDATE(), GETDATE())
	End

	SELECT @PackageID = PackageID
		FROM Config.SSIS_Package 
		WHERE PackageGUID = @PackageGUID
		AND PackageName = @PackageName

	/* Get Package Version MetaData ID */
	IF NOT EXISTS (SELECT 1 FROM Config.SSIS_PackageVersion WHERE PackageVersionGUID = @PackageVersionGUID)
	Begin
		INSERT INTO Config.SSIS_PackageVersion (PackageID, PackageVersionGUID, VersionMajor, VersionMinor, VersionBuild, VersionComment, SQLStatement, SQLPreProcess, SQLPostProcess, InsertDateTime, UpdateDateTime)
			VALUES (@PackageID, @PackageVersionGUID, @VersionMajor, @VersionMinor, @VersionBuild, @VersionComment, @SQLStatement, @SQLPreProcess, @SQLPostProcess, GETDATE(), GETDATE())
	End
	SELECT @PackageVersionID = PackageVersionID
		FROM Config.SSIS_PackageVersion
		WHERE PackageVersionGUID = @PackageVersionGUID

	/* Get BatchLogID */
	IF ISNULL(@ETLControlID,0) = 0
	Begin
		SET @ETLControlID = -1	--child package execution
		SELECT @EndBatchAudit = 1
	End

	/* Create PackageLog Record */
	INSERT INTO Config.SSIS_PackageLog (ETLControlID, PackageVersionID, ExecutionInstanceID, MachineName, UserName, StartDatetime, DataLoadWindow, [Status], InsertDateTime, UpdateDateTime)
		VALUES(@ETLControlID, @PackageVersionID, @ExecutionInstanceID, @MachineName, @UserName, @StartDatetime, @DataLoadWindow, 'R', GETDATE(), GETDATE())

	SELECT @PackageLogID = SCOPE_IDENTITY()

	SELECT @ETLControlID as ETLControlID, @PackageLogID as PackageLogID, @EndBatchAudit as EndBatchAudit
END
GO
