CREATE TABLE [CommissionJunction].[tFICORanges]
(
[FICORangeID] [int] NOT NULL,
[Description] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MinFICO] [int] NOT NULL,
[MaxFICO] [int] NOT NULL,
[Enabled] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tFICORanges_Enabled] DEFAULT ('Y'),
[InsertHost] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tFICORanges_InsertHost] DEFAULT (substring(host_name(),(1),(32))),
[InsertDateTime] [datetime] NOT NULL CONSTRAINT [DF_tFICORanges_InsertDateTime] DEFAULT (getdate()),
[UpdateHost] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tFICORanges_UpdateHost] DEFAULT (substring(host_name(),(1),(32))),
[UpdateDateTime] [datetime] NOT NULL CONSTRAINT [DF_tFICORanges_UpdateDateTime] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER CommissionJunction.tutFICORanges_UpdateAudit ON CommissionJunction.tFICORanges
FOR UPDATE
AS
UPDATE tbl SET 
	tbl.UpdateHost = SUBSTRING(HOST_NAME(),1,32),
	tbl.UpdateDateTime	= CURRENT_TIMESTAMP
FROM CommissionJunction.tFICORanges tbl 
	JOIN (SELECT *,CHECKSUM(*) AS CSUM FROM inserted) i ON tbl.FICORangeID = i.FICORangeID
	JOIN (SELECT *,CHECKSUM(*) AS CSUM FROM deleted) d ON i.FICORangeID = d.FICORangeID
WHERE i.CSUM != d.CSUM
	AND SUSER_SNAME() NOT IN ('sa','PKX\prodsqlsvc')

GO
ALTER TABLE [CommissionJunction].[tFICORanges] ADD CONSTRAINT [CK_tFICORanges_Enabled] CHECK (([Enabled]='Y' OR [Enabled]='N'))
GO
ALTER TABLE [CommissionJunction].[tFICORanges] ADD CONSTRAINT [PK_tFICORanges] PRIMARY KEY CLUSTERED  ([FICORangeID]) ON [PRIMARY]
GO
ALTER TABLE [CommissionJunction].[tFICORanges] ADD CONSTRAINT [UC_tFICORanges_MinFICO_MaxFICO] UNIQUE NONCLUSTERED  ([MinFICO], [MaxFICO]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'Description', N'Defines the FICO ranges used for Commission Junction pricing.', 'SCHEMA', N'CommissionJunction', 'TABLE', N'tFICORanges', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary Key, Unique Identifier', 'SCHEMA', N'CommissionJunction', 'TABLE', N'tFICORanges', 'COLUMN', N'FICORangeID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The maximum FICO boundary used for determining pricing for Commission Junction', 'SCHEMA', N'CommissionJunction', 'TABLE', N'tFICORanges', 'COLUMN', N'MaxFICO'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The minimum FICO boundary used for determining pricing for Commission Junction', 'SCHEMA', N'CommissionJunction', 'TABLE', N'tFICORanges', 'COLUMN', N'MinFICO'
GO
