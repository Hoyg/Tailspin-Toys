CREATE TABLE [dbo].[ProductDescriptors] (
    [DescriptorID] INT             IDENTITY (1, 1) NOT NULL,
    [SKU]          NVARCHAR (50)   NOT NULL,
    [LanguageCode] CHAR (2)        CONSTRAINT [DF_ProductDescriptors_LanguageCode] DEFAULT ('en') NOT NULL,
    [Title]        NVARCHAR (50)   NOT NULL,
    [IsDefault]    BIT             CONSTRAINT [DF_ProductDescriptors_IsDefault] DEFAULT ((0)) NOT NULL,
    [Body]         NVARCHAR (2500) NOT NULL,
    CONSTRAINT [PK_ProductDescriptors] PRIMARY KEY CLUSTERED ([DescriptorID] ASC),
    CONSTRAINT [FK_ProductDescriptors_Products] FOREIGN KEY ([SKU]) REFERENCES [dbo].[Products] ([SKU])
);

