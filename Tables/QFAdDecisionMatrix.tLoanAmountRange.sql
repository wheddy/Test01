CREATE TABLE [QFAdDecisionMatrix].[tLoanAmountRange]
(
[LoanAmountRangeID] [int] NOT NULL,
[RangeDescription] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MinRangeValue] [int] NOT NULL,
[MaxRangeValue] [int] NOT NULL,
[DisplayOrder] [int] NOT NULL,
[Enabled] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tLoanAmountRange_Enabled] DEFAULT ('Y'),
[XMLText] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[InsertDateTime] [datetime] NOT NULL CONSTRAINT [DF_tLoanAmountRange_InsertDateTime] DEFAULT (getdate()),
[UpdateDateTime] [datetime] NOT NULL CONSTRAINT [DF_tLoanAmountRange_UpdateDateTime] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [QFAdDecisionMatrix].[tLoanAmountRange] ADD CONSTRAINT [CK_tLoanAmountRange_Enabled] CHECK (([Enabled]='Y' OR [Enabled]='N'))
GO
ALTER TABLE [QFAdDecisionMatrix].[tLoanAmountRange] ADD CONSTRAINT [PK_tLoanAmountRange_ID] PRIMARY KEY CLUSTERED  ([LoanAmountRangeID]) ON [PRIMARY]
GO
ALTER TABLE [QFAdDecisionMatrix].[tLoanAmountRange] ADD CONSTRAINT [UC_tLoanAmountRange_DisplayOrder] UNIQUE NONCLUSTERED  ([DisplayOrder]) ON [PRIMARY]
GO
ALTER TABLE [QFAdDecisionMatrix].[tLoanAmountRange] ADD CONSTRAINT [UC_tLoanAmountRange_MaxRangeValue] UNIQUE NONCLUSTERED  ([MaxRangeValue]) ON [PRIMARY]
GO
ALTER TABLE [QFAdDecisionMatrix].[tLoanAmountRange] ADD CONSTRAINT [UC_tLoanAmountRange_MinRangeValue] UNIQUE NONCLUSTERED  ([MinRangeValue]) ON [PRIMARY]
GO
ALTER TABLE [QFAdDecisionMatrix].[tLoanAmountRange] ADD CONSTRAINT [UC_tLoanAmountRange_Description] UNIQUE NONCLUSTERED  ([RangeDescription]) ON [PRIMARY]
GO
ALTER TABLE [QFAdDecisionMatrix].[tLoanAmountRange] ADD CONSTRAINT [UC_tLoanAmountRange_XMLText] UNIQUE NONCLUSTERED  ([XMLText]) ON [PRIMARY]
GO
