CREATE TABLE [dbo].[OrderItems] (
    [OrderID]                UNIQUEIDENTIFIER NOT NULL,
    [SKU]                    NVARCHAR (50)    NOT NULL,
    [Quantity]               INT              CONSTRAINT [DF_ShoppingCartItem_Quantity] DEFAULT ((1)) NOT NULL,
    [DateAdded]              DATETIME         CONSTRAINT [DF_ShoppingCartItem_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [LineItemPrice]          DECIMAL (18)     CONSTRAINT [DF_OrderItems_LineItemPrice] DEFAULT ((0)) NOT NULL,
    [Discount]               DECIMAL (18)     CONSTRAINT [DF_OrderItems_Discount] DEFAULT ((0)) NOT NULL,
    [DiscountReason]         NVARCHAR (255)   NULL,
    [Version]                ROWVERSION       NOT NULL,
    [LineItemWeightInPounds] DECIMAL (18)     CONSTRAINT [DF_OrderItems_LineItemWeightInPounds] DEFAULT ((5)) NOT NULL,
    CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED ([OrderID] ASC, [SKU] ASC),
    CONSTRAINT [FK_OrderItems_Orders] FOREIGN KEY ([OrderID]) REFERENCES [dbo].[Orders] ([OrderID]),
    CONSTRAINT [FK_OrderItems_Products] FOREIGN KEY ([SKU]) REFERENCES [dbo].[Products] ([SKU])
);

