CREATE TABLE [dbo].[Products_Related] (
    [SKU]        NVARCHAR (50) NOT NULL,
    [RelatedSKU] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Products_Related] PRIMARY KEY CLUSTERED ([SKU] ASC, [RelatedSKU] ASC),
    CONSTRAINT [FK_Products_Related_Products] FOREIGN KEY ([SKU]) REFERENCES [dbo].[Products] ([SKU]),
    CONSTRAINT [FK_Products_Related_Products1] FOREIGN KEY ([RelatedSKU]) REFERENCES [dbo].[Products] ([SKU])
);

