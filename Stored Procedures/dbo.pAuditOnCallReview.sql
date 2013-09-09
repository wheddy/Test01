SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE proc [dbo].[pAuditOnCallReview]
@StartDate varchar(22) = '01/01/2000',
@EndDate varchar(22) = '01/01/2000'

as
if @StartDate = '01/01/2000'
begin
	set @EndDate = getdate()
	set @StartDate = dateadd(dy, -7, getdate())
end


select a.Name, UserName, TimeStart
FROM ReportServer.dbo.Catalog a
	JOIN ReportServer.dbo.ExecutionLog b
		ON a.ItemID = ReportID
WHERE a.Name in ('Auditing NonProduction',
		 'Auditing Production SOX',
		'Oncall Summary')   
and RequestType = 0
and timestart > convert(datetime, @StartDate)
and timestart < convert(datetime, @EndDate)
order by name, timestart
GO
