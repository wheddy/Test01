CREATE TABLE [temp].[tSchoolLenderGroupError]
(
[xLenderID] [int] NULL,
[xPartnerUID] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__tSchoolLe__xPart__3FBB9B5A] DEFAULT ('SchoolLenderGroup is not enabled'),
[xGroupName] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[xErrorCode] [int] NULL CONSTRAINT [DF__tSchoolLe__xErro__40AFBF93] DEFAULT ((-1))
) ON [PRIMARY]
GO
