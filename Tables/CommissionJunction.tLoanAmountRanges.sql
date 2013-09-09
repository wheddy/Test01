CREATE TABLE [CommissionJunction].[tLoanAmountRanges]
(
[LoanAmountRangeID] [int] NOT NULL,
[Description] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MinLoanAmount] [int] NOT NULL,
[MaxLoanAmount] [int] NOT NULL,
[Enabled] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tLoanAmountRanges_Enabled] DEFAULT ('Y'),
[InsertHost] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tLoanAmountRanges_InsertHost] DEFAULT (substring(host_name(),(1),(32))),
[InsertDateTime] [datetime] NOT NULL CONSTRAINT [DF_tLoanAmountRanges_InsertDateTime] DEFAULT (getdate()),
[UpdateHost] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tLoanAmountRanges_UpdateHost] DEFAULT (substring(host_name(),(1),(32))),
[UpdateDateTime] [datetime] NOT NULL CONSTRAINT [DF_tLoanAmountRanges_UpdateDateTime] DEFAULT (getdate()),
[EChannelID] [int] NULL,
[ProductTypeLookup] [int] NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER CommissionJunction.tutLoanAmountRanges_UpdateAudit ON CommissionJunction.tLoanAmountRanges
FOR UPDATE
AS
UPDATE tbl SET 
	tbl.UpdateHost = SUBSTRING(HOST_NAME(),1,32),
	tbl.UpdateDateTime	= CURRENT_TIMESTAMP
FROM CommissionJunction.tLoanAmountRanges tbl 
	JOIN (SELECT *,CHECKSUM(*) AS CSUM FROM inserted) i ON tbl.LoanAmountRangeID = i.LoanAmountRangeID
	JOIN (SELECT *,CHECKSUM(*) AS CSUM FROM deleted) d ON i.LoanAmountRangeID = d.LoanAmountRangeID
WHERE i.CSUM != d.CSUM
	AND SUSER_SNAME() NOT IN ('sa','PKX\prodsqlsvc')

GO
ALTER TABLE [CommissionJunction].[tLoanAmountRanges] ADD CONSTRAINT [CK_tLoanAmountRanges_Enabled] CHECK (([Enabled]='Y' OR [Enabled]='N'))
GO
ALTER TABLE [CommissionJunction].[tLoanAmountRanges] ADD CONSTRAINT [PK_tLoanAmountRanges] PRIMARY KEY CLUSTERED  ([LoanAmountRangeID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'Description', N'Defines the loan amount ranges for a given product.', 'SCHEMA', N'CommissionJunction', 'TABLE', N'tLoanAmountRanges', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary Key, Unique Identifier', 'SCHEMA', N'CommissionJunction', 'TABLE', N'tLoanAmountRanges', 'COLUMN', N'LoanAmountRangeID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The maximum loan amount boundary used for determining pricing for Commission Junction', 'SCHEMA', N'CommissionJunction', 'TABLE', N'tLoanAmountRanges', 'COLUMN', N'MaxLoanAmount'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The minimum loan amount boundary used for determining pricing for Commission Junction', 'SCHEMA', N'CommissionJunction', 'TABLE', N'tLoanAmountRanges', 'COLUMN', N'MinLoanAmount'
GO
