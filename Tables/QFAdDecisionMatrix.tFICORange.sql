CREATE TABLE [QFAdDecisionMatrix].[tFICORange]
(
[FICORangeID] [int] NOT NULL,
[RangeDescription] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MinRangeValue] [smallint] NOT NULL,
[MaxRangeValue] [smallint] NOT NULL,
[DisplayOrder] [int] NOT NULL,
[Enabled] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tFICORange_Enabled] DEFAULT ('Y'),
[XMLText] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[InsertDateTime] [datetime] NOT NULL CONSTRAINT [DF_tFICORange_InsertDateTime] DEFAULT (getdate()),
[UpdateDateTime] [datetime] NOT NULL CONSTRAINT [DF_tFICORange_UpdateDateTime] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [QFAdDecisionMatrix].[tFICORange] ADD CONSTRAINT [CK_tFICORange_Enabled] CHECK (([Enabled]='Y' OR [Enabled]='N'))
GO
ALTER TABLE [QFAdDecisionMatrix].[tFICORange] ADD CONSTRAINT [PK_tFICORange_ID] PRIMARY KEY CLUSTERED  ([FICORangeID]) ON [PRIMARY]
GO
ALTER TABLE [QFAdDecisionMatrix].[tFICORange] ADD CONSTRAINT [UC_tFICORange_DisplayOrder] UNIQUE NONCLUSTERED  ([DisplayOrder]) ON [PRIMARY]
GO
ALTER TABLE [QFAdDecisionMatrix].[tFICORange] ADD CONSTRAINT [UC_tFICORange_MaxRangeValue] UNIQUE NONCLUSTERED  ([MaxRangeValue]) ON [PRIMARY]
GO
ALTER TABLE [QFAdDecisionMatrix].[tFICORange] ADD CONSTRAINT [UC_tFICORange_MinRangeValue] UNIQUE NONCLUSTERED  ([MinRangeValue]) ON [PRIMARY]
GO
ALTER TABLE [QFAdDecisionMatrix].[tFICORange] ADD CONSTRAINT [UC_tFICORange_Description] UNIQUE NONCLUSTERED  ([RangeDescription]) ON [PRIMARY]
GO
ALTER TABLE [QFAdDecisionMatrix].[tFICORange] ADD CONSTRAINT [UC_tFICORange_XMLText] UNIQUE NONCLUSTERED  ([XMLText]) ON [PRIMARY]
GO
