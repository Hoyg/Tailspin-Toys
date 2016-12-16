CREATE TABLE [dbo].[DeliveryMethod] (
    [DeliveryMethodID] INT           IDENTITY (1, 1) NOT NULL,
    [Description]      NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_DeliveryMethod] PRIMARY KEY CLUSTERED ([DeliveryMethodID] ASC)
);

