CREATE TABLE [dbo].[InventoryStatus] (
    [InventoryStatusID] INT           IDENTITY (1, 1) NOT NULL,
    [Description]       NVARCHAR (50) NULL,
    CONSTRAINT [PK_InventoryStatus] PRIMARY KEY CLUSTERED ([InventoryStatusID] ASC)
);

