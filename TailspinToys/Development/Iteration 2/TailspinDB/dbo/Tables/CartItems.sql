CREATE TABLE [dbo].[CartItems] (
    [SKU]            NVARCHAR (50)  NOT NULL,
    [UserName]       NVARCHAR (50)  NOT NULL,
    [Quantity]       INT            NOT NULL,
    [DateAdded]      DATETIME       CONSTRAINT [DF_CartItems_DateAdded] DEFAULT (getdate()) NOT NULL,
    [DiscountAmount] DECIMAL (18)   CONSTRAINT [DF_CartItems_DiscountAmount] DEFAULT ((0)) NOT NULL,
    [DiscountReason] NVARCHAR (255) NULL,
    CONSTRAINT [PK_CartItems_1] PRIMARY KEY CLUSTERED ([SKU] ASC, [UserName] ASC),
    CONSTRAINT [FK_CartItems_Customers] FOREIGN KEY ([UserName]) REFERENCES [dbo].[Customers] ([UserName]),
    CONSTRAINT [FK_CartItems_Products] FOREIGN KEY ([SKU]) REFERENCES [dbo].[Products] ([SKU])
);

