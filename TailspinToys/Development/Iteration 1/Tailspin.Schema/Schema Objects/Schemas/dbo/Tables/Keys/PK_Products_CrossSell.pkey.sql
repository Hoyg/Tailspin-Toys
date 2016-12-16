﻿ALTER TABLE [dbo].[Products_CrossSell]
    ADD CONSTRAINT [PK_Products_CrossSell] PRIMARY KEY CLUSTERED ([SKU] ASC, [CrossSKU] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

