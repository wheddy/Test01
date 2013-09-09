SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Shahzad Khan
-- Create date: Mar 03, 2011
-- Description:	Start Master Package Logging
-- =============================================
CREATE PROCEDURE [Config].[sp_MasterPackageLogStart] 
	-- Add the parameters for the stored procedure here
	@StageID int
	,@ETLControlID int
	,@ExtractDescription varchar(100)
	,@LoadType varchar(10)
	,@WindowDateFrom varchar(25)
	,@WindowDateTo varchar(25)
	,@MachineName varchar(64)
	,@UserName varchar(74)
	,@StartDateTime datetime
AS
DECLARE 
	@DataLoadWindow varchar(50) = @WindowDateFrom + ' | ' + @WindowDateTo,
	@ExtractID int
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO Config.SSIS_ObjectExtracts
	(StageID, ETLControlID, ExtractDescription, LoadType, DataLoadWindow, StartDateTime, [Status], MachineName, UserName, InsertDateTime, UpdateDateTime)
	VALUES
	(@StageID, @ETLControlID, @ExtractDescription, @LoadType, @DataLoadWindow, @StartDateTime, 'R', @MachineName, @UserName, GETDATE(), GETDATE())

	SELECT @ExtractID = SCOPE_IDENTITY()

	SELECT @ExtractID as ExtractID
	
END
GO
