CREATE TABLE [dbo].[OrderStatus] (
    [OrderStatusID] INT           NOT NULL,
    [Description]   NVARCHAR (50) NULL,
    CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED ([OrderStatusID] ASC)
);

