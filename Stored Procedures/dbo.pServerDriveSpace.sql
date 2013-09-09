SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[pServerDriveSpace]
AS


/**********************************************************************************
-- Stored Proc       	dbo.pServerDriveSpace
-- Author               David Ekren
-- Date                 09/21/2006
-- Description          Inserts server's drive space info into table on CLTDB0101.
-- Called From          SQL Job
-- Change History      	
-- Notes
**********************************************************************************/

SET NOCOUNT ON 
DECLARE @hr int 
DECLARE @fso int 
DECLARE @drive char(1) 
DECLARE @odrive int 
DECLARE @TotalSize varchar(20) DECLARE @MB Numeric ; SET @MB = 1048576 

CREATE TABLE #drives (drive char(1) PRIMARY KEY, FreeSpace int NULL,
TotalSize int NULL) INSERT #drives(drive,FreeSpace) EXEC
master.dbo.xp_fixeddrives EXEC @hr=sp_OACreate
'Scripting.FileSystemObject',@fso OUT IF @hr <> 0 EXEC sp_OAGetErrorInfo
@fso 
DECLARE dcur CURSOR LOCAL FAST_FORWARD 
FOR SELECT drive from #drives ORDER by drive 
OPEN dcur FETCH NEXT FROM dcur INTO @drive 
WHILE @@FETCH_STATUS=0 
BEGIN 
EXEC @hr = sp_OAMethod @fso,'GetDrive', @odrive OUT, @drive 
IF @hr <> 0 EXEC sp_OAGetErrorInfo @fso EXEC @hr =
sp_OAGetProperty
@odrive,'TotalSize', @TotalSize OUT IF @hr <> 0 EXEC sp_OAGetErrorInfo
@odrive UPDATE #drives SET TotalSize=@TotalSize/@MB WHERE
drive=@drive FETCH NEXT FROM dcur INTO @drive 
End 
Close dcur 
DEALLOCATE dcur 
EXEC @hr=sp_OADestroy @fso IF @hr <> 0 EXEC sp_OAGetErrorInfo @fso

DECLARE @lvNTServerName  varchar(101)
declare @lvInstanceNameStartPos int
set @lvInstanceNameStartPos = charindex('\', @@servername)
if @lvInstanceNameStartPos > 0
 SET @lvNTServerName  = substring(@@servername, 1, charindex('\', @@servername) -1 ) 
else
 SET @lvNTServerName = @@servername

Insert into [0101].dbmonitoring.dbo.tServerDriveUtilization
SELECT @lvNTServerName, drive + ':', TotalSize, FreeSpace,
CAST((FreeSpace/(TotalSize*1.0))*100.0 as int),getdate() FROM #drives


DROP TABLE #drives Return



GO
