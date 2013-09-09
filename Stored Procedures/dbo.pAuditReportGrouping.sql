SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS OFF
GO
CREATE proc [dbo].[pAuditReportGrouping] 
@StartDate varchar(22) = '01/01/2000',
@EndDate varchar(22) = '01/01/2000',
@ReportGrouping varchar(101) = NULL
as
if @StartDate = '01/01/2000'
begin
	set @EndDate = getdate()
	set @StartDate = dateadd(dy, -7, getdate())
end

select a.Name, UserName, TimeStart, TimeProcessing, TimeDataRetrieval, TimeRendering, [RowCount]
FROM ReportServer.dbo.Catalog a
	JOIN ReportServer.dbo.ExecutionLog b
		ON a.ItemID = ReportID
        JOIN ReportServer.dbo.Catalog c
	 	on c.ItemID = a.ParentID	
WHERE c.Name = @ReportGrouping
and RequestType = 0
and timestart > convert(datetime, @StartDate)
and timestart < convert(datetime, @EndDate)
order by a.name, timestart

GO
