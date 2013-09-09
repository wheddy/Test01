CREATE TABLE [dbo].[tRewardStream]
(
[TransactionID] [int] NOT NULL,
[InsertDateTime] [datetime] NOT NULL CONSTRAINT [DF_tRewardStream_InsertDateTime] DEFAULT (getdate())
) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'Description', N'SSIS package extRewardStream runs weekly and inserts the extracted QFormIDs into this table; subsequently every four weeks the SSIS package extRewardStream runs and extracts the data from this table and upon successful extraction truncates the table.', 'SCHEMA', N'dbo', 'TABLE', N'tRewardStream', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Audit column; date/time record was initially inserted', 'SCHEMA', N'dbo', 'TABLE', N'tRewardStream', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Equivalent to the QFormID, inserted via SSIS package', 'SCHEMA', N'dbo', 'TABLE', N'tRewardStream', 'COLUMN', N'TransactionID'
GO
