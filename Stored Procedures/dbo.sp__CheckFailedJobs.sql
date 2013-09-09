SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create proc [dbo].[sp__CheckFailedJobs] 
as
set nocount on 

declare @environment varchar(10)
set 	@environment = 'NonProd'	--Set to either 'Prod' or 'NonProd'

delete from [0101].DBMonitoring.dbo.tFailedJobs
where servername = @@servername

insert into [0101].DBMonitoring.dbo.tFailedJobs select TOP 100 Percent @@servername As Servername, name as JobName, b.step_name As StepName, 
'Failed'as LastRun, 
substring(convert(char(8) , last_run_date) , 5, 2)  + '/' +  
substring(convert(char(8) , last_run_date) , 7, 2)  + '/' +  
substring(convert(char(8) , last_run_date) , 1, 4)  + ' ' + 

Substring (REPLICATE ('0', 6 - LEN(last_run_time)) + convert(char(6), last_run_time), 1 , 2) + ':' + 
Substring (REPLICATE ('0', 6 - LEN(last_run_time)) + convert(char(6), last_run_time), 3 , 2) + ':' + 
Substring (REPLICATE ('0', 6 - LEN(last_run_time)) + convert(char(6), last_run_time), 5 , 2) As LastRunDateTime
, message AS Message, sql_message_id AS SqlErrorID, sql_severity As Severity, @environment as Environment, getdate() as InsertDateTime

from 	msdb..sysjobs a JOIN
	 msdb..sysjobsteps b 
 ON a.job_id = b.job_id JOIN
	msdb..sysjobhistory c 
ON a.job_id = c.job_id 
	and 	b.step_id = c.step_id
 	and c.instance_id in (
 		 Select max(instance_id) from
 		 msdb..sysjobhistory 
 		 group by job_id, step_id)
	and last_run_outcome = 0
	and last_run_date > 0
order by 1, b.step_id

insert into [0101].DBMonitoring.dbo.tFailedJobs values(@@servername, 'MonitorFailedJobs job is working', 'test', 'test', '01/01/1900 01:00:00','test', 0, 0, 'Test', getdate())


GO
