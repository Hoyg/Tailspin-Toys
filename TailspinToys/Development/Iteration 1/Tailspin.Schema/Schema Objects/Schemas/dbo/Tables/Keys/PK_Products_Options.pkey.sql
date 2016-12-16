﻿ALTER TABLE [dbo].[Products_Options]
    ADD CONSTRAINT [PK_Products_Options] PRIMARY KEY CLUSTERED ([SKU] ASC, [OptionID] ASC, [OptionValueID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

