CREATE TABLE [dbo].[ProductImages] (
    [ProductImageID] INT            IDENTITY (1, 1) NOT NULL,
    [SKU]            NVARCHAR (50)  NOT NULL,
    [ThumbUrl]       NVARCHAR (150) NOT NULL,
    [FullImageUrl]   NVARCHAR (150) NOT NULL,
    CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED ([ProductImageID] ASC),
    CONSTRAINT [FK_ProductImages_Products] FOREIGN KEY ([SKU]) REFERENCES [dbo].[Products] ([SKU])
);

