CREATE TABLE [Config].[SSIS_Package]
(
[PackageID] [int] NOT NULL IDENTITY(1, 1),
[PackageGUID] [uniqueidentifier] NOT NULL,
[PackageName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreationDate] [datetime] NOT NULL,
[CreatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EnteredDateTime] [datetime] NOT NULL CONSTRAINT [DF_SSIS_Package_EnteredDateTime] DEFAULT (getdate()),
[InsertDateTime] [datetime] NULL,
[UpdateDateTime] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Config].[SSIS_Package] ADD CONSTRAINT [PK_SSIS_Package] PRIMARY KEY CLUSTERED  ([PackageID]) ON [PRIMARY]
GO
