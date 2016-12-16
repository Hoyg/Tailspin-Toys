CREATE TABLE [dbo].[ProductOptionValues] (
    [OptionValueID] INT            IDENTITY (1, 1) NOT NULL,
    [OptionID]      INT            NOT NULL,
    [Description]   NVARCHAR (255) NOT NULL,
    CONSTRAINT [PK_ProductOptionValues] PRIMARY KEY CLUSTERED ([OptionValueID] ASC),
    CONSTRAINT [FK_ProductOptionValues_ProductOptions] FOREIGN KEY ([OptionID]) REFERENCES [dbo].[ProductOptions] ([OptionID])
);

