SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION dbo.fnGetUTCDate (
	@ipDate	DATETIME
	)
RETURNS DATETIME
AS
/*
	Description:	Converts any supplied EST datetime value to UTC datetime
	Created:		2008-MAY-27, Jamie S. Smith
	Called By:		excCommissionJunction.dtsx

$Log$

*/
BEGIN
	DECLARE @lvYear			CHAR(4)
	DECLARE @lvDTSStartWeek	SMALLDATETIME
	DECLARE @lvDTSEndWeek	SMALLDATETIME
	DECLARE @lvHours		INT
	DECLARE @lvUTCDateTime	DATETIME

	SET @lvYear = CONVERT(CHAR(4), DATEPART(YEAR, @ipDate))

	--	Starting in 2007, daylight time begins on the second Sunday in March 
	--	and ends on the first Sunday in November. The change occurs at 2:00AM
	SET @lvDTSStartWeek = '03/01/' + @lvYear
	SET @lvDTSEndWeek = '11/01/' + @lvYear

	--	Determine the Daylight Savings Time Start & End dates
	SELECT 
		@lvDTSStartWeek = CASE DATEPART(dw,@lvDTSStartWeek)
			WHEN 1 THEN DATEADD(HOUR,170,@lvDTSStartWeek)
			WHEN 2 THEN DATEADD(HOUR,314,@lvDTSStartWeek)
			WHEN 3 THEN DATEADD(HOUR,290,@lvDTSStartWeek)
			WHEN 4 THEN DATEADD(HOUR,266,@lvDTSStartWeek)
			WHEN 5 THEN DATEADD(HOUR,242,@lvDTSStartWeek)
			WHEN 6 THEN DATEADD(HOUR,218,@lvDTSStartWeek)
			WHEN 7 THEN DATEADD(HOUR,194,@lvDTSStartWeek)
		END,
		@lvDTSEndWeek = CASE DATEPART(DW,DATEADD(WEEK,1,@lvDTSEndWeek))
			WHEN 1 THEN DATEADD(HOUR,2,@lvDTSEndWeek)
			WHEN 2 THEN DATEADD(HOUR,146,@lvDTSEndWeek)
			WHEN 3 THEN DATEADD(HOUR,122,@lvDTSEndWeek)
			WHEN 4 THEN DATEADD(HOUR,98,@lvDTSEndWeek)
			WHEN 5 THEN DATEADD(HOUR,74,@lvDTSEndWeek)
			WHEN 6 THEN DATEADD(HOUR,50,@lvDTSEndWeek)
			WHEN 7 THEN DATEADD(HOUR,26,@lvDTSEndWeek)
		END

	--	Determine if our date occurs during DST, and assign hour adjustment accordingly
	IF @ipDate BETWEEN @lvDTSStartWeek AND @lvDTSEndWeek
		SET @lvHours = 4
	ELSE
		SET @lvHours = 5

	--	Calculate our UTC date/time
	SET @lvUTCDateTime = DATEADD(HOUR, @lvHours, @ipDate)

	RETURN @lvUTCDateTime
END
GO
