SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.pGetTraceServerLookup
	@ipGetAllFlag	CHAR(1) = 'N'
AS
/*
	Stored Procedure	dbo.pGetTraceServerLookup  
	Author				Clayton Wilson
	Date				07/26/2007

$Log$
*/

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET NOCOUNT ON

BEGIN TRY 

	DECLARE @lvErrorMsg	VARCHAR(MAX)

	OPEN SYMMETRIC KEY Trace_Key  
	   DECRYPTION BY CERTIFICATE TraceServerConnectionStrings

	IF @ipGetAllFlag = 'N'
	BEGIN

		SELECT	CONVERT(VARCHAR(512), DecryptByKey(EncryptedConnectionString)) AS ConnectionString,
				CONVERT(VARCHAR(512), DecryptByKey(EncryptedShareUserName)) AS ShareUserName,
				CONVERT(VARCHAR(512), DecryptByKey(EncryptedSharePassword)) AS SharePassword,
				ServerInstanceName,
				ServerTraceFileName,
				ServerTraceFilePath,
				AllowCPUTrace,
				AllowDurationTrace,
				AllowApplicationNameTrace,
				CPUTraceSuccessful,
				DurationTraceSuccessful,
				ApplicationNameTraceSuccessful
		FROM dbo.tTraceServerLookup
		WHERE CPUTraceSuccessful = 'N' OR DurationTraceSuccessful = 'N' OR ApplicationNameTraceSuccessful = 'N'

	END
	ELSE IF @ipGetAllFlag = 'Y'
	BEGIN

		SELECT	CONVERT(VARCHAR(512), DecryptByKey(EncryptedConnectionString)) AS ConnectionString,
				CONVERT(VARCHAR(512), DecryptByKey(EncryptedShareUserName)) AS ShareUserName,
				CONVERT(VARCHAR(512), DecryptByKey(EncryptedSharePassword)) AS SharePassword,
				ServerInstanceName,
				ServerTraceFileName,
				ServerTraceFilePath,
				AllowCPUTrace,
				AllowDurationTrace,
				AllowApplicationNameTrace,
				CPUTraceSuccessful,
				DurationTraceSuccessful,
				ApplicationNameTraceSuccessful
		FROM dbo.tTraceServerLookup
		WHERE AllowCPUTrace = 'Y' OR AllowDurationTrace = 'Y' OR AllowApplicationNameTrace = 'Y'

	END

END TRY
BEGIN CATCH

	SET @lvErrorMsg = ISNULL(@lvErrorMsg, 'RAISERROR: PROCEDURE: ' + ERROR_PROCEDURE() + ' -> ' + CAST(ERROR_NUMBER() AS VARCHAR) + ' -> ' + ERROR_MESSAGE())
	RAISERROR (@lvErrorMsg, 16, 1)

END CATCH
GO
