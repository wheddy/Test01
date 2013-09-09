CREATE TABLE [temp].[LXQFFees]
(
[FeeName] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FeeCode] [int] NULL,
[IncludeInAPR] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PaidOutsideClosing] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BorrowerResponsibleFlag] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Financeable] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IncludeInPITIFlag] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MonthsToEscrowCount] [int] NULL,
[ClosingFeeTypeLookup] [int] NULL
) ON [PRIMARY]
GO
