CREATE TABLE [temp].[HUD_FHA_LoanLimit]
(
[HUD_FHA_LoanLimitID] [int] NOT NULL IDENTITY(1, 1),
[FileName] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MSACode] [int] NULL,
[MetroDivCode] [int] NULL,
[MSAName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SOACode] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LimitType] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MedianPrice] [int] NULL,
[Limit1LivingUnit] [int] NULL,
[Limit2LivingUnit] [int] NULL,
[Limit3LivingUnit] [int] NULL,
[Limit4LivingUnit] [int] NULL,
[StateAbbrev] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CountyCodeFIPS] [int] NULL,
[StateName] [varchar] (26) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CountyName] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CountyTransDate] [smalldatetime] NULL,
[LimitTransDate] [smalldatetime] NULL,
[InsertDateTime] [smalldatetime] NOT NULL CONSTRAINT [DF_HUD_FHA_LoanLimit_InsertDateTime] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [temp].[HUD_FHA_LoanLimit] ADD CONSTRAINT [PK_HUD_FHA_LoanLimit] PRIMARY KEY CLUSTERED  ([HUD_FHA_LoanLimitID]) ON [PRIMARY]
GO
