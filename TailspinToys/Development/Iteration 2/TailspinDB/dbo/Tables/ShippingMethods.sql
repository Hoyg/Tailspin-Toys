CREATE TABLE [dbo].[ShippingMethods] (
    [ShippingMethodID]  INT           NOT NULL,
    [Carrier]           NVARCHAR (50) NOT NULL,
    [ServiceName]       NVARCHAR (50) NOT NULL,
    [RatePerPound]      DECIMAL (18)  CONSTRAINT [DF_ShippingMethods_RatePerPound] DEFAULT ((0)) NOT NULL,
    [BaseRate]          DECIMAL (18)  CONSTRAINT [DF_ShippingMethods_BaseRate] DEFAULT ((0)) NOT NULL,
    [EstimatedDelivery] NVARCHAR (50) NULL,
    [DaysToDeliver]     INT           CONSTRAINT [DF_ShippingMethods_DaysToDeliver] DEFAULT ((2)) NOT NULL,
    CONSTRAINT [PK_ShippingMethods] PRIMARY KEY CLUSTERED ([ShippingMethodID] ASC)
);

