CREATE TABLE [temp].[tRewardStream]
(
[TransactionID] [int] NOT NULL,
[TransactionDate] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TransactionCloseDate] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TransactionType] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TransactionAmount] [int] NULL,
[PartnerCode] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MemberNumber] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressLine1] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressLine2] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[State] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PropertyState] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Zipcode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailAddress] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneNumber] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HUDReceivedFlag] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CommissionReceivedFlag] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CommissionPercentage] [numeric] (4, 2) NULL,
[ReservationCode] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PartnerSpecific1] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PartnerSpecific2] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Brand] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
