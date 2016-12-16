CREATE TABLE [dbo].[Products_CrossSell] (
    [SKU]      NVARCHAR (50) NOT NULL,
    [CrossSKU] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Products_CrossSell] PRIMARY KEY CLUSTERED ([SKU] ASC, [CrossSKU] ASC),
    CONSTRAINT [FK_Products_CrossSell_Products] FOREIGN KEY ([SKU]) REFERENCES [dbo].[Products] ([SKU]),
    CONSTRAINT [FK_Products_CrossSell_Products1] FOREIGN KEY ([CrossSKU]) REFERENCES [dbo].[Products] ([SKU])
);

