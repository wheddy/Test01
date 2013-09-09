CREATE TABLE [Config].[SSIS_ObjectDomain]
(
[DomainID] [int] NOT NULL IDENTITY(1, 1),
[DomainShortName] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DomainLongName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EnabledFlag] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[InsertDateTime] [datetime] NOT NULL,
[UpdateDateTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Config].[SSIS_ObjectDomain] ADD CONSTRAINT [PK_Config.SSIS_ObjectDomain] PRIMARY KEY CLUSTERED  ([DomainID]) ON [PRIMARY]
GO
ALTER TABLE [Config].[SSIS_ObjectDomain] ADD CONSTRAINT [UC_SSIS_ObjectDomain] UNIQUE NONCLUSTERED  ([DomainShortName]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'Database Schema', N'Config', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', NULL, NULL
GO
EXEC sp_addextendedproperty N'Display Name', N'SSIS_ObjectDomain', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', NULL, NULL
GO
EXEC sp_addextendedproperty N'Table Description', N'Master Package Main Table', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', NULL, NULL
GO
EXEC sp_addextendedproperty N'Table Name', N'SSIS_ObjectDomain', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', NULL, NULL
GO
EXEC sp_addextendedproperty N'Table Type', N'Parent', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', NULL, NULL
GO
EXEC sp_addextendedproperty N'Used In Models', N'Configurations', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', NULL, NULL
GO
EXEC sp_addextendedproperty N'View Name', N'SSIS_ObjectDomain_View', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', NULL, NULL
GO
EXEC sp_addextendedproperty N'Description', N'Business primary keys', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', 'COLUMN', N'DomainID'
GO
EXEC sp_addextendedproperty N'Display Name', N'Domain ID', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', 'COLUMN', N'DomainID'
GO
EXEC sp_addextendedproperty N'Example Values', N'1, 2, 3…', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', 'COLUMN', N'DomainID'
GO
EXEC sp_addextendedproperty N'Source System', N'Derived in ETL', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', 'COLUMN', N'DomainID'
GO
EXEC sp_addextendedproperty N'Comments', N'will be used to do data audit', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', 'COLUMN', N'DomainLongName'
GO
EXEC sp_addextendedproperty N'Description', N'Domain Long Name', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', 'COLUMN', N'DomainLongName'
GO
EXEC sp_addextendedproperty N'Display Name', N'Domain Long Name', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', 'COLUMN', N'DomainLongName'
GO
EXEC sp_addextendedproperty N'Example Values', N'LendingTree, LendingTree Loans, Tree', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', 'COLUMN', N'DomainLongName'
GO
EXEC sp_addextendedproperty N'Description', N'Domain Short Name', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', 'COLUMN', N'DomainShortName'
GO
EXEC sp_addextendedproperty N'Display Name', N'Domain Short Name', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', 'COLUMN', N'DomainShortName'
GO
EXEC sp_addextendedproperty N'Example Values', N'LT, LTL, Tree', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', 'COLUMN', N'DomainShortName'
GO
EXEC sp_addextendedproperty N'Description', N'Should this domain is allowed to run', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', 'COLUMN', N'EnabledFlag'
GO
EXEC sp_addextendedproperty N'Display Name', N'Enabled Flag', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', 'COLUMN', N'EnabledFlag'
GO
EXEC sp_addextendedproperty N'Example Values', N'Y,N', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', 'COLUMN', N'EnabledFlag'
GO
EXEC sp_addextendedproperty N'Comments', N'source insert time stamp', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Description', N'Row insertion time stamp', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Display Name', N'Row Insert Date and Time', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Example Values', N'2011-01-01 00:00:00.000', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Source System', N'Derived in ETL', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', 'COLUMN', N'InsertDateTime'
GO
EXEC sp_addextendedproperty N'Comments', N'source update time stamp', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Description', N'Row update time stamp', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Display Name', N'Row update date and time', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Example Values', N'2011-01-01 00:00:00.000', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', 'COLUMN', N'UpdateDateTime'
GO
EXEC sp_addextendedproperty N'Source System', N'Derived in ETL', 'SCHEMA', N'Config', 'TABLE', N'SSIS_ObjectDomain', 'COLUMN', N'UpdateDateTime'
GO
