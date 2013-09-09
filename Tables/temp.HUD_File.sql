CREATE TABLE [temp].[HUD_File]
(
[HUD_FileID] [int] NOT NULL,
[FileName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LocalFileName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RowWidth] [int] NULL,
[RowDelimiter] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InsertDateTime] [smalldatetime] NOT NULL CONSTRAINT [DF_HUD_File_InsertDateTime] DEFAULT (getdate()),
[UpdateDateTime] [smalldatetime] NOT NULL CONSTRAINT [DF_HUD_File_UpdateDateTime] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [temp].[HUD_File] ADD CONSTRAINT [PK_HUD_File] PRIMARY KEY CLUSTERED  ([HUD_FileID]) ON [PRIMARY]
GO
