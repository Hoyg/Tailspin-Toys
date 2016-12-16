CREATE TABLE [dbo].[Categories] (
    [Code]  NVARCHAR (63)  NOT NULL,
    [Title] NVARCHAR (255) NOT NULL,
    CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED ([Code] ASC)
);

