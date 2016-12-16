CREATE TABLE [dbo].[Transactions] (
    [TransactionID]     UNIQUEIDENTIFIER NOT NULL,
    [OrderID]           UNIQUEIDENTIFIER NOT NULL,
    [TransactionDate]   DATETIME         CONSTRAINT [DF_Transactions_TransactionDate] DEFAULT (getdate()) NOT NULL,
    [Amount]            MONEY            CONSTRAINT [DF_Transactions_Amount] DEFAULT ((0)) NOT NULL,
    [AuthorizationCode] NVARCHAR (50)    NULL,
    [Notes]             NVARCHAR (50)    NULL,
    [Processor]         NVARCHAR (50)    NULL,
    CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED ([TransactionID] ASC),
    CONSTRAINT [FK_Transactions_Orders] FOREIGN KEY ([OrderID]) REFERENCES [dbo].[Orders] ([OrderID])
);

