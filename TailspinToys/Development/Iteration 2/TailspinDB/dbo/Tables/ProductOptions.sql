CREATE TABLE [dbo].[ProductOptions] (
    [OptionID]     INT            IDENTITY (1, 1) NOT NULL,
    [Description]  NVARCHAR (50)  NOT NULL,
    [LanguageCode] CHAR (2)       CONSTRAINT [DF_ProductOptions_LanguageCode] DEFAULT ('en') NOT NULL,
    [DisplayID]    INT            NOT NULL,
    [Prompt]       NVARCHAR (255) NOT NULL,
    CONSTRAINT [PK_ProductOptions] PRIMARY KEY CLUSTERED ([OptionID] ASC),
    CONSTRAINT [FK_ProductOptions_ProductOptionDisplays] FOREIGN KEY ([DisplayID]) REFERENCES [dbo].[ProductOptionDisplays] ([OptionDisplayID])
);

