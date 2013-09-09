CREATE TABLE [dbo].[TempSSISConfiguration]
(
[SSISConfigurationID] [varchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ConfigurationFilter] [varchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ConfiguredValue] [varchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PackagePath] [varchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ConfiguredValueType] [varchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InsertDateTime] [varchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UpdateDateTime] [varchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
