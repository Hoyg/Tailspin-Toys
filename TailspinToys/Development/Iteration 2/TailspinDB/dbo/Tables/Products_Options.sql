CREATE TABLE [dbo].[Products_Options] (
    [SKU]           NVARCHAR (50) NOT NULL,
    [OptionID]      INT           NOT NULL,
    [OptionValueID] INT           NOT NULL,
    CONSTRAINT [PK_Products_Options] PRIMARY KEY CLUSTERED ([SKU] ASC, [OptionID] ASC, [OptionValueID] ASC),
    CONSTRAINT [FK_Products_Options_ProductOptions] FOREIGN KEY ([OptionID]) REFERENCES [dbo].[ProductOptions] ([OptionID]),
    CONSTRAINT [FK_Products_Options_ProductOptionValues] FOREIGN KEY ([OptionValueID]) REFERENCES [dbo].[ProductOptionValues] ([OptionValueID]),
    CONSTRAINT [FK_Products_Options_Products] FOREIGN KEY ([SKU]) REFERENCES [dbo].[Products] ([SKU])
);

