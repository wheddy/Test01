CREATE TABLE [QFAdDecisionMatrix].[tLTVRange]
(
[LTVRangeID] [int] NOT NULL,
[RangeDescription] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MinRangeValue] [smallint] NOT NULL,
[MaxRangeValue] [smallint] NOT NULL,
[DisplayOrder] [int] NOT NULL,
[Enabled] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tLTVRange_Enabled] DEFAULT ('Y'),
[XMLText] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[InsertDateTime] [datetime] NOT NULL CONSTRAINT [DF_tLTVRange_InsertDateTime] DEFAULT (getdate()),
[UpdateDateTime] [datetime] NOT NULL CONSTRAINT [DF_tLTVRange_UpdateDateTime] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [QFAdDecisionMatrix].[tLTVRange] ADD CONSTRAINT [CK_tLTVRange_Enabled] CHECK (([Enabled]='Y' OR [Enabled]='N'))
GO
ALTER TABLE [QFAdDecisionMatrix].[tLTVRange] ADD CONSTRAINT [PK_tLTVRange_ID] PRIMARY KEY CLUSTERED  ([LTVRangeID]) ON [PRIMARY]
GO
ALTER TABLE [QFAdDecisionMatrix].[tLTVRange] ADD CONSTRAINT [UC_tLTVRange_DisplayOrder] UNIQUE NONCLUSTERED  ([DisplayOrder]) ON [PRIMARY]
GO
ALTER TABLE [QFAdDecisionMatrix].[tLTVRange] ADD CONSTRAINT [UC_tLTVRange_MaxRangeValue] UNIQUE NONCLUSTERED  ([MaxRangeValue]) ON [PRIMARY]
GO
ALTER TABLE [QFAdDecisionMatrix].[tLTVRange] ADD CONSTRAINT [UC_tLTVRange_MinRangeValue] UNIQUE NONCLUSTERED  ([MinRangeValue]) ON [PRIMARY]
GO
ALTER TABLE [QFAdDecisionMatrix].[tLTVRange] ADD CONSTRAINT [UC_tLTVRange_Description] UNIQUE NONCLUSTERED  ([RangeDescription]) ON [PRIMARY]
GO
ALTER TABLE [QFAdDecisionMatrix].[tLTVRange] ADD CONSTRAINT [UC_tLTVRange_XMLText] UNIQUE NONCLUSTERED  ([XMLText]) ON [PRIMARY]
GO
