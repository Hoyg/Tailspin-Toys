CREATE TABLE [dbo].[InventoryRecords] (
    [InventoryRecordID] INT            IDENTITY (1, 1) NOT NULL,
    [SKU]               NVARCHAR (50)  NOT NULL,
    [Increment]         INT            CONSTRAINT [DF_InventoryRecords_Increment] DEFAULT ((0)) NOT NULL,
    [DateEntered]       DATETIME       CONSTRAINT [DF_InventoryRecords_DateEntered] DEFAULT (getdate()) NOT NULL,
    [Notes]             NVARCHAR (500) NULL,
    CONSTRAINT [PK_InventoryRecords] PRIMARY KEY CLUSTERED ([InventoryRecordID] ASC),
    CONSTRAINT [FK_InventoryRecords_Products] FOREIGN KEY ([SKU]) REFERENCES [dbo].[Products] ([SKU])
);

