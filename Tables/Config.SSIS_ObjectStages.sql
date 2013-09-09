CREATE TABLE [Config].[SSIS_ObjectStages]
(
[StageID] [int] NOT NULL IDENTITY(1, 1),
[ObjectID] [int] NOT NULL,
[PackageID] [int] NOT NULL,
[PackageOrderList] [int] NULL,
[StageShortName] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[StageLongName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SQLStatement] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SQLPreProcess] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SQLPostProcess] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LoadType] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__SSIS_Obje__LoadT__3AA2ABD9] DEFAULT ('IMPORT'),
[PackageLocation] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EnabledFlag] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[InsertDateTime] [datetime] NOT NULL,
[UpdateDateTime] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Config].[SSIS_ObjectStages] ADD CONSTRAINT [PK_Config.SSIS_ObjectStages] PRIMARY KEY CLUSTERED  ([StageID]) ON [PRIMARY]
GO
ALTER TABLE [Config].[SSIS_ObjectStages] WITH NOCHECK ADD CONSTRAINT [FK_Config_SSIS_ObjectStages_ObjectID] FOREIGN KEY ([ObjectID]) REFERENCES [Config].[SSIS_ObjectSetting] ([ObjectID])
GO
ALTER TABLE [Config].[SSIS_ObjectStages] WITH NOCHECK ADD CONSTRAINT [FK_Config_SSIS_ObjectStages_PackageID] FOREIGN KEY ([PackageID]) REFERENCES [Config].[SSIS_Package] ([PackageID])
GO
ALTER TABLE [Config].[SSIS_ObjectStages] NOCHECK CONSTRAINT [FK_Config_SSIS_ObjectStages_ObjectID]
GO
ALTER TABLE [Config].[SSIS_ObjectStages] NOCHECK CONSTRAINT [FK_Config_SSIS_ObjectStages_PackageID]
GO
EXEC sp_addextendedproperty N'Database Schema', N'Config', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', NULL, NULL
GO
EXEC sp_addextendedproperty N'Display Name', N'SSIS_ObjectStages', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', NULL, NULL
GO
EXEC sp_addextendedproperty N'Table Description', N'Object Setting tables', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', NULL, NULL
GO
EXEC sp_addextendedproperty N'Table Name', N'SSIS_ObjectStages', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', NULL, NULL
GO
EXEC sp_addextendedproperty N'Table Type', N'Child', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', NULL, NULL
GO
EXEC sp_addextendedproperty N'Used In Models', N'Configurations', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', NULL, NULL
GO
EXEC sp_addextendedproperty N'View Name', N'SSIS_ObjectStagesView', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', NULL, NULL
GO
EXEC sp_addextendedproperty N'Description', N'enable / disable flag', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'EnabledFlag'
GO
EXEC sp_addextendedproperty N'Display Name', N'Enabled Flag', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'EnabledFlag'
GO
EXEC sp_addextendedproperty N'Example Values', N'Y, N', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'EnabledFlag'
GO
EXEC sp_addextendedproperty N'Comments', N'source insert time stamp', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Description', N'Row insertion time stamp', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Display Name', N'Row Insert Date and Time', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Example Values', N'2011-01-01 00:00:00.000', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Source Datatype', N'datetime', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Source Field Name', N'InsertDateTime', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Source System', N'Derived in ETL', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Source Table', N'tMortgageRefinancePurpose', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Description', N'Load type of this stage', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'LoadType'
GO
EXEC sp_addextendedproperty N'Display Name', N'Load type', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'LoadType'
GO
EXEC sp_addextendedproperty N'Example Values', N'FULL, DELTA', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'LoadType'
GO
EXEC sp_addextendedproperty N'Comments', N'FK to Parent table', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'ObjectID'
GO
EXEC sp_addextendedproperty N'Description', N'Foreign key to Setting', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'ObjectID'
GO
EXEC sp_addextendedproperty N'Display Name', N'Object ID', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'ObjectID'
GO
EXEC sp_addextendedproperty N'Example Values', N'1, 2, 3…', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'ObjectID'
GO
EXEC sp_addextendedproperty N'FK To', N'SSIS_ObjectSetting.ObjectID', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'ObjectID'
GO
EXEC sp_addextendedproperty N'Source Datatype', N'int', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'ObjectID'
GO
EXEC sp_addextendedproperty N'Source Field Name', N'ObjectID', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'ObjectID'
GO
EXEC sp_addextendedproperty N'Source Schema', N'DBA', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'ObjectID'
GO
EXEC sp_addextendedproperty N'Source System', N'Derived in ETL', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'ObjectID'
GO
EXEC sp_addextendedproperty N'Source Table', N'SSIS_ObjectSetting', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'ObjectID'
GO
EXEC sp_addextendedproperty N'Comments', N'FK to Parent table', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'PackageID'
GO
EXEC sp_addextendedproperty N'Description', N'Foreign key to SSIS Package Store', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'PackageID'
GO
EXEC sp_addextendedproperty N'Display Name', N'Package ID', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'PackageID'
GO
EXEC sp_addextendedproperty N'FK To', N'SSIS_Package.PackageID', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'PackageID'
GO
EXEC sp_addextendedproperty N'Source Datatype', N'int', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'PackageID'
GO
EXEC sp_addextendedproperty N'Source Field Name', N'PackageID', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'PackageID'
GO
EXEC sp_addextendedproperty N'Source Schema', N'DBA', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'PackageID'
GO
EXEC sp_addextendedproperty N'Source Table', N'SSIS_Package', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'PackageID'
GO
EXEC sp_addextendedproperty N'Description', N'Location of this package', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'PackageLocation'
GO
EXEC sp_addextendedproperty N'Display Name', N'Package Location', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'PackageLocation'
GO
EXEC sp_addextendedproperty N'Example Values', N'\DW\STAGE\LENDING\', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'PackageLocation'
GO
EXEC sp_addextendedproperty N'Description', N'SQL Statement for post processing', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'SQLPostProcess'
GO
EXEC sp_addextendedproperty N'Display Name', N'SQL Post Process', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'SQLPostProcess'
GO
EXEC sp_addextendedproperty N'Example Values', N'Counts etc', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'SQLPostProcess'
GO
EXEC sp_addextendedproperty N'Description', N'SQL Statement for pre processing (Truncate abcd table)', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'SQLPreProcess'
GO
EXEC sp_addextendedproperty N'Display Name', N'SQL Pre Process', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'SQLPreProcess'
GO
EXEC sp_addextendedproperty N'Example Values', N'Truncate Table abcd', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'SQLPreProcess'
GO
EXEC sp_addextendedproperty N'Description', N'SQL Statement of this stage', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'SQLStatement'
GO
EXEC sp_addextendedproperty N'Display Name', N'SQL Statement', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'SQLStatement'
GO
EXEC sp_addextendedproperty N'Example Values', N'SELECT 1', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'SQLStatement'
GO
EXEC sp_addextendedproperty N'Description', N'Primary key', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'StageID'
GO
EXEC sp_addextendedproperty N'Display Name', N'Stage ID', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'StageID'
GO
EXEC sp_addextendedproperty N'Example Values', N'1, 2, 3…', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'StageID'
GO
EXEC sp_addextendedproperty N'Source System', N'Derived in ETL', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'StageID'
GO
EXEC sp_addextendedproperty N'Description', N'long name of this stage', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'StageLongName'
GO
EXEC sp_addextendedproperty N'Display Name', N'Stage Long Name', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'StageLongName'
GO
EXEC sp_addextendedproperty N'Example Values', N'LendingTree Main Qform', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'StageLongName'
GO
EXEC sp_addextendedproperty N'Comments', N'will be used to do data audit', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'StageShortName'
GO
EXEC sp_addextendedproperty N'Description', N'short name of this stage', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'StageShortName'
GO
EXEC sp_addextendedproperty N'Display Name', N'Stage Short Name', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'StageShortName'
GO
EXEC sp_addextendedproperty N'Example Values', N'STG_tQForm', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'StageShortName'
GO
EXEC sp_addextendedproperty N'Comments', N'source update time stamp', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Description', N'Row update time stamp', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Display Name', N'Row update date and time', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Example Values', N'2011-01-01 00:00:00.000', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Source Datatype', N'datetime', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Source Field Name', N'UpdateDateTime', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Source System', N'Derived in ETL', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Source Table', N'tMortgageRefinancePurpose', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectStages', 'COLUMN', N'UpdateDateTime'
GO
