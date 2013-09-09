SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =========================================================================
-- Author:		Shahzad Khan
-- Create date: Jan 31, 2011
-- Description:	Returns Packages Logging Information alongwith execution time
-- Input parameters:	Package Name, for example, STG_Reciprocal
-- ==========================================================================
CREATE PROCEDURE [Config].[sp_GetPackagesLogInfo]
(
	@PackageName	varchar(100)
) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT pkglog.StartDateTime 
		,pkg.PackageName
		,convert(time,pkglog.EndDateTime - pkglog.StartDateTime) as Duration
		,pkglog.Status
		,pkglog.ETLControlID
		,pkglog.DataLoadWindow		
		,pkgerr.ErrorCode 
		,pkgerr.ErrorDescription 
		,pkgerr.SourceName
		,pkglog.EndDateTime 
		,pkgerr.LogDateTime ErrDateTime
		,pkglog.DataTableName
		,pkglog.SourceRowCount 
		,pkgvers.SQLStatement
		,pkgvers.SQLPreProcess
		,pkgvers.SQLPostProcess
	FROM Config.SSIS_PackageLog pkglog
	JOIN Config.SSIS_PackageVersion pkgvers on pkglog.PackageVersionID=pkgvers.PackageVersionID
	JOIN Config.SSIS_Package pkg on pkgvers.PackageID=pkg.PackageID
	LEFT JOIN Config.SSIS_PackageErrorLog pkgerr on pkgerr.PackageLogID = pkglog.PackageLogID
	WHERE pkg.PackageName = @PackageName 
	ORDER BY pkglog.StartDateTime desc
END
GO
