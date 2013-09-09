SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





-- =============================================
-- Author:		Shahzad Khan
-- Create date: Mar 10, 2011
-- Description:	Master package execution results
-- =============================================
CREATE PROCEDURE [Config].[sp_GetMasterExecutionResults] 
	-- Add the parameters for the stored procedure here
	@DataLoadWindow varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT 
		objEx.StageID, objEx.ETLControlID
		,convert(time,objEx.EndDateTime - objEx.StartDateTime) as Duration
		,objEx.LoadType
		,objEx.ExtractDescription
		,objEx.DataLoadWindow
		,objEx.DataTableName
		,pkg.PackageName
		,objEx.SourceCount
		,objEx.InsertCount
		,objEx.UpdateCount
		,objEx.Status
		,objEx.MachineName
		,objEx.UserName
		,objEx.StartDateTime
		,objEx.EndDateTime
		,objexErr.ErrorCode
		,objexErr.ErrorDescription
	
		
	FROM Config.SSIS_ObjectExtracts objEx
	JOIN Config.SSIS_ObjectStages objStg ON objEx.StageID = objStg.StageID
	JOIN SSIS_Package pkg ON objStg.PackageID = pkg.PackageID
	
	LEFT JOIN SSIS_ObjectExtractsErrorLog objexErr ON objex.ExtractID = objexErr.ExtractID
	
	WHERE DataLoadWindow = @DataLoadWindow

	ORDER BY objEx.ExtractID DESC	
END





GO
