CREATE TABLE [CommissionJunction].[tAffiliateGroupPricing]
(
[AffiliateGroupPricingID] [int] NOT NULL,
[GroupID] [int] NOT NULL,
[ProductTypeLookup] [int] NOT NULL,
[ProductSubTypeLookup] [int] NULL,
[ActionCode] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CostPerAction] [decimal] (18, 2) NOT NULL,
[Enabled] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tAffiliateGroupPricing_Enabled] DEFAULT ('Y'),
[InsertHost] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tAffiliateGroupPricing_InsertHost] DEFAULT (substring(host_name(),(1),(32))),
[InsertDateTime] [datetime] NOT NULL CONSTRAINT [DF_tAffiliateGroupPricing_InsertDateTime] DEFAULT (getdate()),
[UpdateHost] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tAffiliateGroupPricing_UpdateHost] DEFAULT (substring(host_name(),(1),(32))),
[UpdateDateTime] [datetime] NOT NULL CONSTRAINT [DF_tAffiliateGroupPricing_UpdateDateTime] DEFAULT (getdate()),
[CJMinTransmitRevenue] [decimal] (6, 2) NULL,
[CJMaxTransmitRevenue] [decimal] (6, 2) NULL,
[PartnerUID] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER CommissionJunction.tutAffiliateGroupPricing_UpdateAudit ON CommissionJunction.tAffiliateGroupPricing
FOR UPDATE
AS
UPDATE tbl SET 
	tbl.UpdateHost = SUBSTRING(HOST_NAME(),1,32),
	tbl.UpdateDateTime	= CURRENT_TIMESTAMP
FROM CommissionJunction.tAffiliateGroupPricing tbl 
	JOIN (SELECT *,CHECKSUM(*) AS CSUM FROM inserted) i ON tbl.AffiliateGroupPricingID = i.AffiliateGroupPricingID
	JOIN (SELECT *,CHECKSUM(*) AS CSUM FROM deleted) d ON i.AffiliateGroupPricingID = d.AffiliateGroupPricingID
WHERE i.CSUM != d.CSUM
	AND SUSER_SNAME() NOT IN ('sa','PKX\prodsqlsvc')

GO
ALTER TABLE [CommissionJunction].[tAffiliateGroupPricing] ADD CONSTRAINT [CK_tAffiliateGroupPricing_Enabled] CHECK (([Enabled]='Y' OR [Enabled]='N'))
GO
ALTER TABLE [CommissionJunction].[tAffiliateGroupPricing] ADD CONSTRAINT [PK_tAffiliateGroupPricing] PRIMARY KEY CLUSTERED  ([AffiliateGroupPricingID]) ON [PRIMARY]
GO
ALTER TABLE [CommissionJunction].[tAffiliateGroupPricing] ADD CONSTRAINT [UC_tAffiliateGroupPricing_PartnerUID_ProductTypeLookup_ProductSubTypeLookup_CJMaxTransmitRevenue] UNIQUE NONCLUSTERED  ([PartnerUID], [ProductTypeLookup], [ProductSubTypeLookup], [CJMaxTransmitRevenue]) ON [PRIMARY]
GO
ALTER TABLE [CommissionJunction].[tAffiliateGroupPricing] ADD CONSTRAINT [UC_tAffiliateGroupPricing_PartnerUID_ProductTypeLookup_ProductSubTypeLookup_CJMinTransmitRevenue] UNIQUE NONCLUSTERED  ([PartnerUID], [ProductTypeLookup], [ProductSubTypeLookup], [CJMinTransmitRevenue]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'Description', N'Defines the cost per action variable pricing for Commission Junction.', 'SCHEMA', N'CommissionJunction', 'TABLE', N'tAffiliateGroupPricing', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'A numeric value provided by marketing and used for reporting figures to commission junction', 'SCHEMA', N'CommissionJunction', 'TABLE', N'tAffiliateGroupPricing', 'COLUMN', N'ActionCode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary Key, Unique Identifier', 'SCHEMA', N'CommissionJunction', 'TABLE', N'tAffiliateGroupPricing', 'COLUMN', N'AffiliateGroupPricingID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'A dollar per action value provided by marketing', 'SCHEMA', N'CommissionJunction', 'TABLE', N'tAffiliateGroupPricing', 'COLUMN', N'CostPerAction'
GO
EXEC sp_addextendedproperty N'MS_Description', N'A numeric value provided by Marketing used for internal purposes', 'SCHEMA', N'CommissionJunction', 'TABLE', N'tAffiliateGroupPricing', 'COLUMN', N'GroupID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The sub-type of product for example see Lendx.dbo.tMortgageClassLookup', 'SCHEMA', N'CommissionJunction', 'TABLE', N'tAffiliateGroupPricing', 'COLUMN', N'ProductSubTypeLookup'
GO
EXEC sp_addextendedproperty N'MS_Description', N'See Lendx.dbo.tProductTypeLookup for acceptable values', 'SCHEMA', N'CommissionJunction', 'TABLE', N'tAffiliateGroupPricing', 'COLUMN', N'ProductTypeLookup'
GO
