SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.pGetTraceServerLookupFlags
	@ipServerInstanceName	VARCHAR(64),
	@ipTraceType			VARCHAR(15),
	@opAllowFlag			CHAR(1)	OUTPUT,
	@opSuccessfulFlag		CHAR(1)	OUTPUT
AS
/*
	Stored Procedure	dbo.pGetTraceServerLookupFlags  
	Author				Clayton Wilson
	Date				07/26/2007

$Log$
*/

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET NOCOUNT ON

BEGIN TRY 

	DECLARE @lvErrorMsg	VARCHAR(MAX)

	IF @ipTraceType = 'CPU'
	BEGIN

		SELECT	@opAllowFlag = AllowCPUTrace,
				@opSuccessfulFlag = CPUTraceSuccessful				
		FROM dbo.tTraceServerLookup
		WHERE ServerInstanceName = @ipServerInstanceName

	END
	ELSE IF @ipTraceType = 'Duration'
	BEGIN

		SELECT	@opAllowFlag = AllowDurationTrace,
				@opSuccessfulFlag = DurationTraceSuccessful
		FROM dbo.tTraceServerLookup
		WHERE ServerInstanceName = @ipServerInstanceName

	END
	ELSE IF @ipTraceType = 'ApplicationName'
	BEGIN

		SELECT	@opAllowFlag = AllowApplicationNameTrace,
				@opSuccessfulFlag = ApplicationNameTraceSuccessful
		FROM dbo.tTraceServerLookup
		WHERE ServerInstanceName = @ipServerInstanceName

	END
	ELSE IF @ipTraceType = 'MissingIndexes'
	BEGIN

		SELECT	@opAllowFlag = AllowMissingIndexes,
				@opSuccessfulFlag = NULL
		FROM dbo.tTraceServerLookup
		WHERE ServerInstanceName = @ipServerInstanceName

	END

END TRY
BEGIN CATCH

	SET @lvErrorMsg = ISNULL(@lvErrorMsg, 'RAISERROR: PROCEDURE: ' + ERROR_PROCEDURE() + ' -> ' + CAST(ERROR_NUMBER() AS VARCHAR) + ' -> ' + ERROR_MESSAGE())
	RAISERROR (@lvErrorMsg, 16, 1)

END CATCH
GO
