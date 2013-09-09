CREATE TABLE [Config].[SSIS_PackageVersion]
(
[PackageVersionID] [int] NOT NULL IDENTITY(1, 1),
[PackageVersionGUID] [uniqueidentifier] NOT NULL,
[PackageID] [int] NOT NULL,
[VersionMajor] [int] NOT NULL,
[VersionMinor] [int] NOT NULL,
[VersionBuild] [int] NOT NULL,
[VersionComment] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SQLStatement] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SQLPreProcess] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SQLPostProcess] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EnteredDateTime] [datetime] NOT NULL CONSTRAINT [DF_SSIS_PackageVersion_EnteredDateTime] DEFAULT (getdate()),
[InsertDateTime] [datetime] NULL,
[UpdateDateTime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Config].[SSIS_PackageVersion] ADD CONSTRAINT [PK_SSIS_PackageVersion] PRIMARY KEY CLUSTERED  ([PackageVersionID]) ON [PRIMARY]
GO
ALTER TABLE [Config].[SSIS_PackageVersion] ADD CONSTRAINT [FK_SSIS_PackageVersion_PackageID_SSIS_Package] FOREIGN KEY ([PackageID]) REFERENCES [Config].[SSIS_Package] ([PackageID]) ON DELETE CASCADE
GO
