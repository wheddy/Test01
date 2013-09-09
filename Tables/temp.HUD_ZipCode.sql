CREATE TABLE [temp].[HUD_ZipCode]
(
[HUD_ZipCodeID] [int] NOT NULL IDENTITY(1, 1),
[FieldOffice] [int] NULL,
[ZipCode] [int] NULL,
[CityName] [varchar] (17) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StateCode] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CountyCode] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CountyName] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LenderOptionJurisd] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InsertDateTime] [smalldatetime] NOT NULL CONSTRAINT [DF_HUD_ZipCode_InsertDateTime] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [temp].[HUD_ZipCode] ADD CONSTRAINT [PK_HUD_ZipCode] PRIMARY KEY CLUSTERED  ([HUD_ZipCodeID]) ON [PRIMARY]
GO
