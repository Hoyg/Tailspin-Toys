CREATE TABLE [dbo].[ProductOptionDisplays] (
    [OptionDisplayID] INT           IDENTITY (1, 1) NOT NULL,
    [HTMLDisplay]     NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_ProductOptionDisplays] PRIMARY KEY CLUSTERED ([OptionDisplayID] ASC)
);

