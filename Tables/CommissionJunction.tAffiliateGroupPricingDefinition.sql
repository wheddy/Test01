CREATE TABLE [CommissionJunction].[tAffiliateGroupPricingDefinition]
(
[AffiliateGroupPricingDefinitionID] [int] NOT NULL IDENTITY(1, 1),
[AffiliateGroupPricingID] [int] NOT NULL,
[FICORangeID] [int] NOT NULL,
[LoanAmountRangeID] [int] NOT NULL,
[EffectiveStartDate] [datetime] NOT NULL,
[ExpirationDate] [datetime] NOT NULL CONSTRAINT [DF_tAffiliateGroupPricingDefinition_ExpirationDate] DEFAULT ('12/31/9999'),
[InsertHost] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tAffiliateGroupPricingDefinition_InsertHost] DEFAULT (substring(host_name(),(1),(32))),
[InsertDateTime] [datetime] NOT NULL CONSTRAINT [DF_tAffiliateGroupPricingDefinition_InsertDateTime] DEFAULT (getdate()),
[UpdateHost] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tAffiliateGroupPricingDefinition_UpdateHost] DEFAULT (substring(host_name(),(1),(32))),
[UpdateDateTime] [datetime] NOT NULL CONSTRAINT [DF_tAffiliateGroupPricingDefinition_UpdateDateTime] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER CommissionJunction.tutAffiliateGroupPricingDefinition_UpdateAudit ON CommissionJunction.tAffiliateGroupPricingDefinition
FOR UPDATE
AS
UPDATE tbl SET 
	tbl.UpdateHost = SUBSTRING(HOST_NAME(),1,32),
	tbl.UpdateDateTime	= CURRENT_TIMESTAMP
FROM CommissionJunction.tAffiliateGroupPricingDefinition tbl 
	JOIN (SELECT *,CHECKSUM(*) AS CSUM FROM inserted) i ON tbl.AffiliateGroupPricingDefinitionID = i.AffiliateGroupPricingDefinitionID
	JOIN (SELECT *,CHECKSUM(*) AS CSUM FROM deleted) d ON i.AffiliateGroupPricingDefinitionID = d.AffiliateGroupPricingDefinitionID
WHERE i.CSUM != d.CSUM
	AND SUSER_SNAME() NOT IN ('sa','PKX\prodsqlsvc')

GO
ALTER TABLE [CommissionJunction].[tAffiliateGroupPricingDefinition] ADD CONSTRAINT [PK_tAffiliateGroupPricingDefinition_AffiliateGroupPricingDefinitionID] PRIMARY KEY CLUSTERED  ([AffiliateGroupPricingDefinitionID]) ON [PRIMARY]
GO
ALTER TABLE [CommissionJunction].[tAffiliateGroupPricingDefinition] ADD CONSTRAINT [UC_tAffiliateGroupPricingDefinition_Group_FICO_LoanAmount_ExpirationDate] UNIQUE NONCLUSTERED  ([AffiliateGroupPricingID], [FICORangeID], [LoanAmountRangeID], [ExpirationDate] DESC) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tAffiliateGroupPricingDefinition] ON [CommissionJunction].[tAffiliateGroupPricingDefinition] ([AffiliateGroupPricingID], [FICORangeID], [LoanAmountRangeID], [EffectiveStartDate], [ExpirationDate]) ON [PRIMARY]
GO
ALTER TABLE [CommissionJunction].[tAffiliateGroupPricingDefinition] ADD CONSTRAINT [FK_tAffiliateGroupPricingDefinition_tAffiliateGroupPricing] FOREIGN KEY ([AffiliateGroupPricingID]) REFERENCES [CommissionJunction].[tAffiliateGroupPricing] ([AffiliateGroupPricingID])
GO
ALTER TABLE [CommissionJunction].[tAffiliateGroupPricingDefinition] ADD CONSTRAINT [FK_tAffiliateGroupPricingDefinition_tFICORanges] FOREIGN KEY ([FICORangeID]) REFERENCES [CommissionJunction].[tFICORanges] ([FICORangeID])
GO
ALTER TABLE [CommissionJunction].[tAffiliateGroupPricingDefinition] ADD CONSTRAINT [FK_tAffiliateGroupPricingDefinition_tLoanAmountRanges] FOREIGN KEY ([LoanAmountRangeID]) REFERENCES [CommissionJunction].[tLoanAmountRanges] ([LoanAmountRangeID])
GO
EXEC sp_addextendedproperty N'Description', N'Defines the upper and lower boundaries for each pricing group.', 'SCHEMA', N'CommissionJunction', 'TABLE', N'tAffiliateGroupPricingDefinition', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary Key, Unique Identifier, Auto-Incrementing', 'SCHEMA', N'CommissionJunction', 'TABLE', N'tAffiliateGroupPricingDefinition', 'COLUMN', N'AffiliateGroupPricingDefinitionID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Foreign-key, see CommissionJunction.tAffiliateGroupPricing', 'SCHEMA', N'CommissionJunction', 'TABLE', N'tAffiliateGroupPricingDefinition', 'COLUMN', N'AffiliateGroupPricingID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Date pricing boundary becomes effective', 'SCHEMA', N'CommissionJunction', 'TABLE', N'tAffiliateGroupPricingDefinition', 'COLUMN', N'EffectiveStartDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Date pricing boundary is no longer valid/expires', 'SCHEMA', N'CommissionJunction', 'TABLE', N'tAffiliateGroupPricingDefinition', 'COLUMN', N'ExpirationDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Foreign-key, see CommissionJunction.tFICORanges', 'SCHEMA', N'CommissionJunction', 'TABLE', N'tAffiliateGroupPricingDefinition', 'COLUMN', N'FICORangeID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Foreign-key, see CommissionJunction.tLoanAmountRanges', 'SCHEMA', N'CommissionJunction', 'TABLE', N'tAffiliateGroupPricingDefinition', 'COLUMN', N'LoanAmountRangeID'
GO
