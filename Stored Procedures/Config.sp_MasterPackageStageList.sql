SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- =============================================
-- Author:		Shahzad Khan
-- Create date: Mar 04, 2011
-- Description:	Returns Stage List to be process by eHUB Master Package
-- Example:		SubjectArea = 'Enterprise', SubjectLine = 'Lendx-Import'
-- =============================================
CREATE PROCEDURE [Config].[sp_MasterPackageStageList] 
	-- Add the parameters for the stored procedure here
	@SubjectArea varchar(20)
	,@SubjectLine varchar(20)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT
		objStg.StageID
		,objDom.DomainShortName + ' : ' + objSet.ObjectLongName + ' ' + objStg.LoadType + ' : Package Name: ' + pkg.PackageName  ExtractDescription
		,objStg.PackageLocation + pkg.PackageName + '.dtsx' PackageLocation
		,ISNULL(objStg.LoadType, '') LoadType
		,ISNULL(objStg.SQLStatement, '') SQLStatement
		,ISNULL(objStg.SQLPreProcess, '') SQLPreProcess 
		,ISNULL(objStg.SQLPostProcess, '') SQLPostProcess
		,pkg.PackageID
		
	FROM [DBA].[Config].[SSIS_ObjectDomain] objDom
	JOIN [DBA].[Config].[SSIS_ObjectSetting] objSet ON objDom.DomainID = objSet.DomainID
	JOIN [DBA].[Config].[SSIS_ObjectStages] objStg ON objSet.ObjectID = objStg.ObjectID
	JOIN [DBA].[Config].[SSIS_Package] pkg ON objStg.PackageID = pkg.PackageID
	WHERE
		objDom.EnabledFlag = 'Y' AND objSet.EnabledFlag = 'Y' AND objStg.EnabledFlag = 'Y'
		AND objDom.DomainShortName = @SubjectArea AND objSet.ObjectShortName = @SubjectLine
	ORDER BY objStg.PackageOrderList ASC
END



GO
