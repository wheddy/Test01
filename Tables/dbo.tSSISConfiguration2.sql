CREATE TABLE [dbo].[tSSISConfiguration2]
(
[SSISConfigurationID] [int] NOT NULL,
[ConfigurationFilter] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ConfiguredValue] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PackagePath] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ConfiguredValueType] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[InsertDateTime] [datetime] NOT NULL,
[UpdateDateTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
