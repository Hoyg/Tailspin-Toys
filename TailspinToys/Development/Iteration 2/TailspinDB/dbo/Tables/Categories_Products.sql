CREATE TABLE [dbo].[Categories_Products] (
    [CategoryCode] NVARCHAR (63) NOT NULL,
    [SKU]          NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Categories_Products] PRIMARY KEY CLUSTERED ([CategoryCode] ASC, [SKU] ASC),
    CONSTRAINT [FK_Categories_Products_Categories] FOREIGN KEY ([CategoryCode]) REFERENCES [dbo].[Categories] ([Code]),
    CONSTRAINT [FK_Categories_Products_Products] FOREIGN KEY ([SKU]) REFERENCES [dbo].[Products] ([SKU])
);

