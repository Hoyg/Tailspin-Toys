CREATE TABLE [dbo].[TaxRates] (
    [TaxRateID]  INT           IDENTITY (1, 1) NOT NULL,
    [Rate]       MONEY         CONSTRAINT [DF_TaxRates_Rate] DEFAULT ((0)) NOT NULL,
    [Region]     CHAR (2)      NOT NULL,
    [Country]    CHAR (2)      CONSTRAINT [DF_TaxRates_Country] DEFAULT ('US') NOT NULL,
    [PostalCode] NVARCHAR (50) NULL,
    CONSTRAINT [PK_TaxRates] PRIMARY KEY CLUSTERED ([TaxRateID] ASC)
);

