CREATE TABLE [dbo].[tRewardStreamTransactions]
(
[TransactionID] [int] NOT NULL,
[InsertDateTime] [datetime] NOT NULL CONSTRAINT [DF_tRewardStreamTransactions_InsertDateTime] DEFAULT (getdate())
) ON [PRIMARY]
GO
