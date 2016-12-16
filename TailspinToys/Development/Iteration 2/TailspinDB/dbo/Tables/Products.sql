CREATE TABLE [dbo].[Products] (
    [SKU]               NVARCHAR (50)  NOT NULL,
    [DeliveryMethodID]  INT            CONSTRAINT [DF_Products_DeliveryMethodID] DEFAULT ((1)) NOT NULL,
    [ProductName]       NVARCHAR (50)  NOT NULL,
    [Blurb]             NVARCHAR (127) NOT NULL,
    [BasePrice]         DECIMAL (18)   CONSTRAINT [DF_Products_UnitPrice] DEFAULT ((0)) NOT NULL,
    [WeightInPounds]    MONEY          CONSTRAINT [DF_Products_WeightInPounds] DEFAULT ((0)) NOT NULL,
    [DateAvailable]     DATETIME       CONSTRAINT [DF_Products_DateAvailable] DEFAULT ('1/1/2003') NOT NULL,
    [InventoryStatusID] INT            CONSTRAINT [DF_Products_InventoryStatusID] DEFAULT ((1)) NOT NULL,
    [EstimatedDelivery] NVARCHAR (50)  CONSTRAINT [DF_Products_EstimatedDelivery] DEFAULT (N'3-5 Days') NOT NULL,
    [AllowBackOrder]    BIT            CONSTRAINT [DF_Products_AllowBackOrder] DEFAULT ((1)) NOT NULL,
    [IsTaxable]         BIT            CONSTRAINT [DF_Products_IsTaxable] DEFAULT ((1)) NOT NULL,
    [DefaultImageFile]  NVARCHAR (255) NULL,
    [Version]           ROWVERSION     NOT NULL,
    [AmountOnHand]      INT            CONSTRAINT [DF_Products_AmountOnHand] DEFAULT ((10)) NOT NULL,
    [AllowPreOrder]     BIT            CONSTRAINT [DF_Products_AllowPreOrder] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED ([SKU] ASC),
    CONSTRAINT [FK_Products_DeliveryMethod] FOREIGN KEY ([DeliveryMethodID]) REFERENCES [dbo].[DeliveryMethod] ([DeliveryMethodID]),
    CONSTRAINT [FK_Products_InventoryStatus] FOREIGN KEY ([InventoryStatusID]) REFERENCES [dbo].[InventoryStatus] ([InventoryStatusID])
);

