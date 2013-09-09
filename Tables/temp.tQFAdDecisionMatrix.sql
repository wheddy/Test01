CREATE TABLE [temp].[tQFAdDecisionMatrix]
(
[QFAdDecisionMatrixID] [int] NOT NULL IDENTITY(1, 1),
[Purpose] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[State] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LTV] [decimal] (9, 4) NULL,
[LTVRangeID] [int] NULL,
[LoanAmount] [decimal] (11, 2) NOT NULL,
[LoanAmountRangeID] [int] NULL,
[FICO] [smallint] NULL,
[FICORangeID] [int] NULL,
[FirstTimeHomeBuyer] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TransmitCount] [int] NOT NULL,
[LikelyToTransmit] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [temp].[tQFAdDecisionMatrix] ADD CONSTRAINT [PK_tQFAdDecisionMatrix] PRIMARY KEY CLUSTERED  ([QFAdDecisionMatrixID]) ON [PRIMARY]
GO
