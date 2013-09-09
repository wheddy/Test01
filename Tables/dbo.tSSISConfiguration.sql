CREATE TABLE [dbo].[tSSISConfiguration]
(
[SSISConfigurationID] [int] NOT NULL IDENTITY(1, 1),
[ConfigurationFilter] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ConfiguredValue] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PackagePath] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ConfiguredValueType] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[InsertDateTime] [datetime] NOT NULL CONSTRAINT [DF_SSISConfiguration_InsertDateTime] DEFAULT (getdate()),
[UpdateDateTime] [datetime] NOT NULL CONSTRAINT [DF_SSISConfiguration_UpdateDateTime] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[tuSSISConfiguration_UpdateAudit] ON [dbo].[tSSISConfiguration]
FOR UPDATE
AS
BEGIN
	UPDATE 	tbl
		SET tbl.UpdateDateTime = CURRENT_TIMESTAMP
	FROM	dbo.tSSISConfiguration tbl INNER JOIN inserted i ON tbl.SSISConfigurationID = i.SSISConfigurationID
END
GO
ALTER TABLE [dbo].[tSSISConfiguration] ADD CONSTRAINT [PK_SSISConfiguration] PRIMARY KEY NONCLUSTERED  ([SSISConfigurationID]) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tSSISConfiguration] TO [DS1\kgibson]
GRANT INSERT ON  [dbo].[tSSISConfiguration] TO [DS1\kgibson]
GRANT UPDATE ON  [dbo].[tSSISConfiguration] TO [DS1\kgibson]
GRANT SELECT ON  [dbo].[tSSISConfiguration] TO [ds1\pwang]
GRANT INSERT ON  [dbo].[tSSISConfiguration] TO [ds1\pwang]
GRANT UPDATE ON  [dbo].[tSSISConfiguration] TO [ds1\pwang]
GO
EXEC sp_addextendedproperty N'Description', N'SSIS package configuration values for transactional DBA packages only.', 'SCHEMA', N'dbo', 'TABLE', N'tSSISConfiguration', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name given to a configuration value or group of configuration values for identification purposes; synonymous with Configuration Name', 'SCHEMA', N'dbo', 'TABLE', N'tSSISConfiguration', 'COLUMN', N'ConfigurationFilter'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The actual value of the configuration record (i.e., complete connection string).', 'SCHEMA', N'dbo', 'TABLE', N'tSSISConfiguration', 'COLUMN', N'ConfiguredValue'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The data type of the value (i.e., string, integer, boolean, etc.).', 'SCHEMA', N'dbo', 'TABLE', N'tSSISConfiguration', 'COLUMN', N'ConfiguredValueType'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Current system date/time record was inserted.', 'SCHEMA', N'dbo', 'TABLE', N'tSSISConfiguration', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The SSIS package path to the configured value. ', 'SCHEMA', N'dbo', 'TABLE', N'tSSISConfiguration', 'COLUMN', N'PackagePath'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary Key, Auto-Incrementing', 'SCHEMA', N'dbo', 'TABLE', N'tSSISConfiguration', 'COLUMN', N'SSISConfigurationID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Current system date/time record was last updated.', 'SCHEMA', N'dbo', 'TABLE', N'tSSISConfiguration', 'COLUMN', N'UpdateDateTime'
GO
