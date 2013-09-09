CREATE TABLE [temp].[LeadRelevanceUnsubscribe]
(
[txtSource] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[intUnsubscribe_Id] [int] NOT NULL,
[txtEmail_Id] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[intAffiliate_Id] [int] NOT NULL,
[txtIPAddress] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[txtReferer] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[intDomainName] [tinyint] NOT NULL,
[datetimeAdded] [datetime] NOT NULL
) ON [PRIMARY]
GO
