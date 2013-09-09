CREATE TABLE [Protagona].[tTableTruncationList]
(
[TableID] [int] NOT NULL IDENTITY(1, 1),
[SchemaName] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TableName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Truncated] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tTableTruncationList_Truncated] DEFAULT ('N'),
[Enabled] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tTableTruncationList_Enabled] DEFAULT ('Y'),
[InsertHost] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tTableTruncationList_InsertHost] DEFAULT (substring(host_name(),(1),(32))),
[InsertDateTime] [datetime] NOT NULL CONSTRAINT [DF_tTableTruncationList_InsertDateTime] DEFAULT (getdate()),
[UpdateHost] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tTableTruncationList_UpdateHost] DEFAULT (substring(host_name(),(1),(32))),
[UpdateDateTime] [datetime] NOT NULL CONSTRAINT [DF_tTableTruncationList_UpdateDateTime] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER Protagona.tutTableTruncationList_UpdateAudit ON Protagona.tTableTruncationList
FOR UPDATE
AS
UPDATE tbl SET 
	tbl.UpdateHost = SUBSTRING(HOST_NAME(),1,32),
	tbl.UpdateDateTime	= CURRENT_TIMESTAMP
FROM Protagona.tTableTruncationList tbl 
	JOIN (SELECT *,CHECKSUM(*) AS CSUM FROM inserted) i ON tbl.TableID = i.TableID
	JOIN (SELECT *,CHECKSUM(*) AS CSUM FROM deleted) d ON i.TableID = d.TableID
WHERE i.CSUM != d.CSUM
	AND SUSER_SNAME() NOT IN ('sa','PKX\prodsqlsvc')

GO
ALTER TABLE [Protagona].[tTableTruncationList] ADD CONSTRAINT [CK_tTableTruncationList_Enabled] CHECK (([Enabled]='Y' OR [Enabled]='N'))
GO
ALTER TABLE [Protagona].[tTableTruncationList] ADD CONSTRAINT [CK_tTableTruncationList_Truncated] CHECK (([Truncated]='Y' OR [Truncated]='N'))
GO
ALTER TABLE [Protagona].[tTableTruncationList] ADD CONSTRAINT [PK_tTableTruncationList] PRIMARY KEY CLUSTERED  ([TableID]) ON [PRIMARY]
GO
ALTER TABLE [Protagona].[tTableTruncationList] ADD CONSTRAINT [UC_tTableTruncationList_SchemaName_TableName] UNIQUE NONCLUSTERED  ([SchemaName], [TableName]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'Description', N'Lists the tables that are truncated daily from Protagona DWSource database.', 'SCHEMA', N'Protagona', 'TABLE', N'tTableTruncationList', NULL, NULL
GO
