CREATE TABLE [Config].[SSIS_ObjectSetting]
(
[ObjectID] [int] NOT NULL IDENTITY(1, 1),
[DomainID] [int] NOT NULL,
[ObjectShortName] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ObjectLongName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EnabledFlag] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[InsertDateTime] [datetime] NOT NULL,
[UpdateDateTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Config].[SSIS_ObjectSetting] ADD CONSTRAINT [PK_Config.SSIS_ObjectSetting] PRIMARY KEY CLUSTERED  ([ObjectID]) ON [PRIMARY]
GO
ALTER TABLE [Config].[SSIS_ObjectSetting] WITH NOCHECK ADD CONSTRAINT [FK_Config_SSIS_ObjectSetting_DomainID] FOREIGN KEY ([DomainID]) REFERENCES [Config].[SSIS_ObjectDomain] ([DomainID])
GO
ALTER TABLE [Config].[SSIS_ObjectSetting] NOCHECK CONSTRAINT [FK_Config_SSIS_ObjectSetting_DomainID]
GO
EXEC sp_addextendedproperty N'Database Schema', N'Config', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', NULL, NULL
GO
EXEC sp_addextendedproperty N'Display Name', N'SSIS_ObjectSetting', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', NULL, NULL
GO
EXEC sp_addextendedproperty N'Table Description', N'Object Setting tables', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', NULL, NULL
GO
EXEC sp_addextendedproperty N'Table Name', N'SSIS_ObjectSetting', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', NULL, NULL
GO
EXEC sp_addextendedproperty N'Table Type', N'Child', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', NULL, NULL
GO
EXEC sp_addextendedproperty N'Used In Models', N'Configurations', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', NULL, NULL
GO
EXEC sp_addextendedproperty N'View Name', N'SSIS_ObjectSettingView', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', NULL, NULL
GO
EXEC sp_addextendedproperty N'Comments', N'FK to Parent table', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'DomainID'
GO
EXEC sp_addextendedproperty N'Description', N'Foreign key to domain', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'DomainID'
GO
EXEC sp_addextendedproperty N'Display Name', N'Domain ID', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'DomainID'
GO
EXEC sp_addextendedproperty N'Example Values', N'1, 2, 3…', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'DomainID'
GO
EXEC sp_addextendedproperty N'FK To', N'SSIS_ObjectDomain.DomainID', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'DomainID'
GO
EXEC sp_addextendedproperty N'Source Datatype', N'int', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'DomainID'
GO
EXEC sp_addextendedproperty N'Source Field Name', N'DomainID', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'DomainID'
GO
EXEC sp_addextendedproperty N'Source Schema', N'DBA', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'DomainID'
GO
EXEC sp_addextendedproperty N'Source System', N'Derived in ETL', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'DomainID'
GO
EXEC sp_addextendedproperty N'Source Table', N'SSIS_ObjectDomain', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'DomainID'
GO
EXEC sp_addextendedproperty N'Description', N'enable / disable flag', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'EnabledFlag'
GO
EXEC sp_addextendedproperty N'Display Name', N'Enabled Flag', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'EnabledFlag'
GO
EXEC sp_addextendedproperty N'Example Values', N'Y, N', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'EnabledFlag'
GO
EXEC sp_addextendedproperty N'Comments', N'source insert time stamp', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Description', N'Row insertion time stamp', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Display Name', N'Row Insert Date and Time', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Example Values', N'2011-01-01 00:00:00.000', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Source Datatype', N'datetime', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Source Field Name', N'InsertDateTime', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Source System', N'Derived in ETL', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Source Table', N'tMortgageRefinancePurpose', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Description', N'Primary key', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'ObjectID'
GO
EXEC sp_addextendedproperty N'Display Name', N'Object ID', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'ObjectID'
GO
EXEC sp_addextendedproperty N'Example Values', N'1, 2, 3…', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'ObjectID'
GO
EXEC sp_addextendedproperty N'Source System', N'Derived in ETL', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'ObjectID'
GO
EXEC sp_addextendedproperty N'Description', N'long name of this object', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'ObjectLongName'
GO
EXEC sp_addextendedproperty N'Display Name', N'Object Long Name', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'ObjectLongName'
GO
EXEC sp_addextendedproperty N'Example Values', N'Lendx Data Source, Enterprise Data Warehouse Data Source', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'ObjectLongName'
GO
EXEC sp_addextendedproperty N'Comments', N'will be used to do data audit', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'ObjectShortName'
GO
EXEC sp_addextendedproperty N'Description', N'short name of this object', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'ObjectShortName'
GO
EXEC sp_addextendedproperty N'Display Name', N'Object Short Name', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'ObjectShortName'
GO
EXEC sp_addextendedproperty N'Example Values', N'Lendx:FULL, Lendx:DELTA, EDW:FULL, EDW:DELTA', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'ObjectShortName'
GO
EXEC sp_addextendedproperty N'Comments', N'source update time stamp', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Description', N'Row update time stamp', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Display Name', N'Row update date and time', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Example Values', N'2011-01-01 00:00:00.000', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Source Datatype', N'datetime', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Source Field Name', N'UpdateDateTime', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Source System', N'Derived in ETL', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Source Table', N'tMortgageRefinancePurpose', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectSetting', 'COLUMN', N'UpdateDateTime'
GO
