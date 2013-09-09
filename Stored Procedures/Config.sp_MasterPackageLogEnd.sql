SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Shahzad Khan
-- Create date: Mar 04, 2011
-- Description:	End master package stage process
-- =============================================
CREATE PROCEDURE [Config].[sp_MasterPackageLogEnd] 
	-- Add the parameters for the stored procedure here
	@ExtractID int
	,@ETLControlID	int
	,@PackageID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- used to grab meta info from child tables - ssis doesn't help
	DECLARE @PackageLogID int;
	
	SELECT @PackageLogID = 
		MAX(pkglog.PackageLogID) FROM [Config].[SSIS_PackageLog] pkglog
	WHERE pkglog.PackageVersionID =
		(SELECT MAX(packageversionid) PackageVersionID 
			FROM [Config].[SSIS_PackageVersion] 
			WHERE PackageID = @PackageID)
	
	--update extract table	
	UPDATE ObjEx SET
		SourceCount = pkglog.SourceRowCount
		,InsertCount = pkglog.InsertRowCount
		,UpdateCount = pkglog.UpdateRowCount
		,DataTableName = pkglog.DataTableName
		,EndDateTime = GETDATE()
		,[Status] = 'S'
		,UpdateDateTime = GETDATE()	
	
	FROM [Config].SSIS_ObjectExtracts objEx
	JOIN [Config].SSIS_PackageLog pkglog ON objEx.ETLControlID = pkglog.ETLControlID
	WHERE objEx.ExtractID = @ExtractID
	AND pkglog.PackageLogID = @PackageLogID
	--AND pkglog.ETLControlID = @ETLControlID 
	AND pkglog.[Status] = 'S'
			
END
GO
