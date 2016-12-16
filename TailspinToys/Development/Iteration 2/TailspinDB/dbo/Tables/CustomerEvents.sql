CREATE TABLE [dbo].[CustomerEvents] (
    [EventID]        INT              IDENTITY (1, 1) NOT NULL,
    [UserBehaviorID] INT              NOT NULL,
    [UserName]       NVARCHAR (50)    NOT NULL,
    [EventDate]      DATETIME         CONSTRAINT [DF_UserEvents_EventDate] DEFAULT (getdate()) NOT NULL,
    [IP]             NVARCHAR (50)    NOT NULL,
    [SKU]            NVARCHAR (50)    NULL,
    [CategoryID]     INT              NULL,
    [OrderID]        UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_UserEvents] PRIMARY KEY CLUSTERED ([EventID] ASC),
    CONSTRAINT [FK_CustomerEvents_Customers] FOREIGN KEY ([UserName]) REFERENCES [dbo].[Customers] ([UserName]),
    CONSTRAINT [FK_UserEvents_UseBehaviors] FOREIGN KEY ([UserBehaviorID]) REFERENCES [dbo].[CustomerBehaviors] ([UserBehaviorID])
);

