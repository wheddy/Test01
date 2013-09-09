CREATE TABLE [dbo].[tSSISPackageCatalog]
(
[SSISPackageCatalogID] [int] NOT NULL,
[PackageName] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PackageDescription] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[JobName] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastSuccessfulDate] [datetime] NULL,
[EnabledFlag] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_SSISPackageCatalog_EnabledFlag] DEFAULT ('Y'),
[InsertDateTime] [datetime] NOT NULL CONSTRAINT [DF_SSISPackageCatalog_InsertDateTime] DEFAULT (getdate()),
[UpdateDateTime] [datetime] NOT NULL CONSTRAINT [DF_SSISPackageCatalog_UpdateDateTime] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[tuSSISPackageCatalog_UpdateAudit] ON [dbo].[tSSISPackageCatalog]
FOR UPDATE
AS
BEGIN
	UPDATE 	tbl
		SET tbl.UpdateDateTime = CURRENT_TIMESTAMP
	FROM	dbo.tSSISPackageCatalog tbl INNER JOIN inserted i ON tbl.SSISPackageCatalogID = i.SSISPackageCatalogID
END
GO
ALTER TABLE [dbo].[tSSISPackageCatalog] ADD CONSTRAINT [CK_SSISPackageCatalog_EnabledFlag] CHECK (([EnabledFlag]='Y' OR [EnabledFlag]='N'))
GO
ALTER TABLE [dbo].[tSSISPackageCatalog] ADD CONSTRAINT [PK_SSISPackageCatalog] PRIMARY KEY CLUSTERED  ([SSISPackageCatalogID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tSSISPackageCatalog] ADD CONSTRAINT [UC_SSISPackageCatalog_PackageName] UNIQUE NONCLUSTERED  ([PackageName]) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tSSISPackageCatalog] TO [DS1\kgibson]
GRANT INSERT ON  [dbo].[tSSISPackageCatalog] TO [DS1\kgibson]
GRANT UPDATE ON  [dbo].[tSSISPackageCatalog] TO [DS1\kgibson]
GRANT REFERENCES ON  [dbo].[tSSISPackageCatalog] TO [ds1\pwang]
GRANT SELECT ON  [dbo].[tSSISPackageCatalog] TO [ds1\pwang]
GRANT INSERT ON  [dbo].[tSSISPackageCatalog] TO [ds1\pwang]
GRANT DELETE ON  [dbo].[tSSISPackageCatalog] TO [ds1\pwang]
GRANT UPDATE ON  [dbo].[tSSISPackageCatalog] TO [ds1\pwang]
GO
EXEC sp_addextendedproperty N'Description', N'SSIS package details for the transactional DBA packages only.', 'SCHEMA', N'dbo', 'TABLE', N'tSSISPackageCatalog', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Is package still used?', 'SCHEMA', N'dbo', 'TABLE', N'tSSISPackageCatalog', 'COLUMN', N'EnabledFlag'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Date record was inserted into table.', 'SCHEMA', N'dbo', 'TABLE', N'tSSISPackageCatalog', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Name of job that executes package.', 'SCHEMA', N'dbo', 'TABLE', N'tSSISPackageCatalog', 'COLUMN', N'JobName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Last date package was successfully executed.', 'SCHEMA', N'dbo', 'TABLE', N'tSSISPackageCatalog', 'COLUMN', N'LastSuccessfulDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Brief description of package and purpose.', 'SCHEMA', N'dbo', 'TABLE', N'tSSISPackageCatalog', 'COLUMN', N'PackageDescription'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Unique SSIS package name.', 'SCHEMA', N'dbo', 'TABLE', N'tSSISPackageCatalog', 'COLUMN', N'PackageName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary Key; Unique Identifier; Manual Entry Required', 'SCHEMA', N'dbo', 'TABLE', N'tSSISPackageCatalog', 'COLUMN', N'SSISPackageCatalogID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Date record was last updated.', 'SCHEMA', N'dbo', 'TABLE', N'tSSISPackageCatalog', 'COLUMN', N'UpdateDateTime'
GO
