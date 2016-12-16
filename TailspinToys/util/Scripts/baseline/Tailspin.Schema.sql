/*
Deployment script for TailspinToys
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "TailspinToys"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\"

GO
USE [master]

GO
:on error exit
GO
IF (DB_ID(N'$(DatabaseName)') IS NOT NULL
    AND DATABASEPROPERTYEX(N'$(DatabaseName)','Status') <> N'ONLINE')
BEGIN
    RAISERROR(N'The state of the target database, %s, is not set to ONLINE. To deploy to this database, its state must be set to ONLINE.', 16, 127,N'$(DatabaseName)') WITH NOWAIT
    RETURN
END

GO
IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [TailspinToys], FILENAME = N'$(DefaultDataPath)TailspinToys.mdf')
    LOG ON (NAME = [TailspinToys_log], FILENAME = N'$(DefaultLogPath)TailspinToys_log.ldf') COLLATE Latin1_General_CI_AS
GO
EXECUTE sp_dbcmptlevel [$(DatabaseName)], 100;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
USE [$(DatabaseName)]

GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

GO
PRINT N'Dropping Permission...';


GO
REVOKE CONNECT TO [dbo]
    AS [dbo];


GO
PRINT N'Creating [aspnet_Membership_BasicAccess]...';


GO
CREATE ROLE [aspnet_Membership_BasicAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating [aspnet_Membership_FullAccess]...';


GO
CREATE ROLE [aspnet_Membership_FullAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating [aspnet_Membership_ReportingAccess]...';


GO
CREATE ROLE [aspnet_Membership_ReportingAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating [aspnet_Personalization_BasicAccess]...';


GO
CREATE ROLE [aspnet_Personalization_BasicAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating [aspnet_Personalization_FullAccess]...';


GO
CREATE ROLE [aspnet_Personalization_FullAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating [aspnet_Personalization_ReportingAccess]...';


GO
CREATE ROLE [aspnet_Personalization_ReportingAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating [aspnet_Profile_BasicAccess]...';


GO
CREATE ROLE [aspnet_Profile_BasicAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating [aspnet_Profile_FullAccess]...';


GO
CREATE ROLE [aspnet_Profile_FullAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating [aspnet_Profile_ReportingAccess]...';


GO
CREATE ROLE [aspnet_Profile_ReportingAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating [aspnet_Roles_BasicAccess]...';


GO
CREATE ROLE [aspnet_Roles_BasicAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating [aspnet_Roles_FullAccess]...';


GO
CREATE ROLE [aspnet_Roles_FullAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating [aspnet_Roles_ReportingAccess]...';


GO
CREATE ROLE [aspnet_Roles_ReportingAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating [aspnet_WebEvent_FullAccess]...';


GO
CREATE ROLE [aspnet_WebEvent_FullAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating [state_persistence_users]...';


GO
CREATE ROLE [state_persistence_users]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating [aspnet_Membership_BasicAccess]...';


GO
CREATE SCHEMA [aspnet_Membership_BasicAccess]
    AUTHORIZATION [aspnet_Membership_BasicAccess];


GO
PRINT N'Creating [aspnet_Membership_FullAccess]...';


GO
CREATE SCHEMA [aspnet_Membership_FullAccess]
    AUTHORIZATION [aspnet_Membership_FullAccess];


GO
PRINT N'Creating [aspnet_Membership_ReportingAccess]...';


GO
CREATE SCHEMA [aspnet_Membership_ReportingAccess]
    AUTHORIZATION [aspnet_Membership_ReportingAccess];


GO
PRINT N'Creating [aspnet_Personalization_BasicAccess]...';


GO
CREATE SCHEMA [aspnet_Personalization_BasicAccess]
    AUTHORIZATION [aspnet_Personalization_BasicAccess];


GO
PRINT N'Creating [aspnet_Personalization_FullAccess]...';


GO
CREATE SCHEMA [aspnet_Personalization_FullAccess]
    AUTHORIZATION [aspnet_Personalization_FullAccess];


GO
PRINT N'Creating [aspnet_Personalization_ReportingAccess]...';


GO
CREATE SCHEMA [aspnet_Personalization_ReportingAccess]
    AUTHORIZATION [aspnet_Personalization_ReportingAccess];


GO
PRINT N'Creating [aspnet_Profile_BasicAccess]...';


GO
CREATE SCHEMA [aspnet_Profile_BasicAccess]
    AUTHORIZATION [aspnet_Profile_BasicAccess];


GO
PRINT N'Creating [aspnet_Profile_FullAccess]...';


GO
CREATE SCHEMA [aspnet_Profile_FullAccess]
    AUTHORIZATION [aspnet_Profile_FullAccess];


GO
PRINT N'Creating [aspnet_Profile_ReportingAccess]...';


GO
CREATE SCHEMA [aspnet_Profile_ReportingAccess]
    AUTHORIZATION [aspnet_Profile_ReportingAccess];


GO
PRINT N'Creating [aspnet_Roles_BasicAccess]...';


GO
CREATE SCHEMA [aspnet_Roles_BasicAccess]
    AUTHORIZATION [aspnet_Roles_BasicAccess];


GO
PRINT N'Creating [aspnet_Roles_FullAccess]...';


GO
CREATE SCHEMA [aspnet_Roles_FullAccess]
    AUTHORIZATION [aspnet_Roles_FullAccess];


GO
PRINT N'Creating [aspnet_Roles_ReportingAccess]...';


GO
CREATE SCHEMA [aspnet_Roles_ReportingAccess]
    AUTHORIZATION [aspnet_Roles_ReportingAccess];


GO
PRINT N'Creating [aspnet_WebEvent_FullAccess]...';


GO
CREATE SCHEMA [aspnet_WebEvent_FullAccess]
    AUTHORIZATION [aspnet_WebEvent_FullAccess];


GO
PRINT N'Creating [state_persistence_users]...';


GO
CREATE SCHEMA [state_persistence_users]
    AUTHORIZATION [state_persistence_users];


GO
PRINT N'Creating [dbo].[Addresses]...';


GO
CREATE TABLE [dbo].[Addresses] (
    [AddressID]       INT            IDENTITY (1, 1) NOT NULL,
    [UserName]        NVARCHAR (50)  NOT NULL,
    [FirstName]       NVARCHAR (50)  NOT NULL,
    [LastName]        NVARCHAR (50)  NOT NULL,
    [Email]           NVARCHAR (50)  NOT NULL,
    [Street1]         NVARCHAR (50)  NOT NULL,
    [Street2]         NVARCHAR (50)  NULL,
    [City]            NVARCHAR (150) NOT NULL,
    [StateOrProvince] NVARCHAR (50)  NOT NULL,
    [Zip]             NVARCHAR (50)  NOT NULL,
    [Country]         NVARCHAR (50)  NOT NULL,
    [Latitude]        NVARCHAR (50)  NULL,
    [Longitude]       NVARCHAR (50)  NULL,
    [IsDefault]       BIT            NOT NULL
);


GO
PRINT N'Creating PK_Addresses...';


GO
ALTER TABLE [dbo].[Addresses]
    ADD CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED ([AddressID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[CartItems]...';


GO
CREATE TABLE [dbo].[CartItems] (
    [SKU]            NVARCHAR (50)  NOT NULL,
    [UserName]       NVARCHAR (50)  NOT NULL,
    [Quantity]       INT            NOT NULL,
    [DateAdded]      DATETIME       NOT NULL,
    [DiscountAmount] DECIMAL (18)   NOT NULL,
    [DiscountReason] NVARCHAR (255) NULL
);


GO
PRINT N'Creating PK_CartItems_1...';


GO
ALTER TABLE [dbo].[CartItems]
    ADD CONSTRAINT [PK_CartItems_1] PRIMARY KEY CLUSTERED ([SKU] ASC, [UserName] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[Categories]...';


GO
CREATE TABLE [dbo].[Categories] (
    [Code]  NVARCHAR (63)  NOT NULL,
    [Title] NVARCHAR (255) NOT NULL
);


GO
PRINT N'Creating PK_Categories...';


GO
ALTER TABLE [dbo].[Categories]
    ADD CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED ([Code] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[Categories_Products]...';


GO
CREATE TABLE [dbo].[Categories_Products] (
    [CategoryCode] NVARCHAR (63) NOT NULL,
    [SKU]          NVARCHAR (50) NOT NULL
);


GO
PRINT N'Creating PK_Categories_Products...';


GO
ALTER TABLE [dbo].[Categories_Products]
    ADD CONSTRAINT [PK_Categories_Products] PRIMARY KEY CLUSTERED ([CategoryCode] ASC, [SKU] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[CustomerBehaviors]...';


GO
CREATE TABLE [dbo].[CustomerBehaviors] (
    [UserBehaviorID] INT           NOT NULL,
    [Description]    NVARCHAR (50) NOT NULL
);


GO
PRINT N'Creating PK_UseBehaviors...';


GO
ALTER TABLE [dbo].[CustomerBehaviors]
    ADD CONSTRAINT [PK_UseBehaviors] PRIMARY KEY CLUSTERED ([UserBehaviorID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[CustomerEvents]...';


GO
CREATE TABLE [dbo].[CustomerEvents] (
    [EventID]        INT              IDENTITY (1, 1) NOT NULL,
    [UserBehaviorID] INT              NOT NULL,
    [UserName]       NVARCHAR (50)    NOT NULL,
    [EventDate]      DATETIME         NOT NULL,
    [IP]             NVARCHAR (50)    NOT NULL,
    [SKU]            NVARCHAR (50)    NULL,
    [CategoryID]     INT              NULL,
    [OrderID]        UNIQUEIDENTIFIER NULL
);


GO
PRINT N'Creating PK_UserEvents...';


GO
ALTER TABLE [dbo].[CustomerEvents]
    ADD CONSTRAINT [PK_UserEvents] PRIMARY KEY CLUSTERED ([EventID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[Customers]...';


GO
CREATE TABLE [dbo].[Customers] (
    [UserName]     NVARCHAR (50) NOT NULL,
    [Email]        NVARCHAR (50) NULL,
    [First]        NVARCHAR (50) NULL,
    [Last]         NVARCHAR (50) NULL,
    [LanguageCode] CHAR (2)      NOT NULL
);


GO
PRINT N'Creating PK_Customers...';


GO
ALTER TABLE [dbo].[Customers]
    ADD CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED ([UserName] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[DeliveryMethod]...';


GO
CREATE TABLE [dbo].[DeliveryMethod] (
    [DeliveryMethodID] INT           IDENTITY (1, 1) NOT NULL,
    [Description]      NVARCHAR (50) NOT NULL
);


GO
PRINT N'Creating PK_DeliveryMethod...';


GO
ALTER TABLE [dbo].[DeliveryMethod]
    ADD CONSTRAINT [PK_DeliveryMethod] PRIMARY KEY CLUSTERED ([DeliveryMethodID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[InventoryRecords]...';


GO
CREATE TABLE [dbo].[InventoryRecords] (
    [InventoryRecordID] INT            IDENTITY (1, 1) NOT NULL,
    [SKU]               NVARCHAR (50)  NOT NULL,
    [Increment]         INT            NOT NULL,
    [DateEntered]       DATETIME       NOT NULL,
    [Notes]             NVARCHAR (500) NULL
);


GO
PRINT N'Creating PK_InventoryRecords...';


GO
ALTER TABLE [dbo].[InventoryRecords]
    ADD CONSTRAINT [PK_InventoryRecords] PRIMARY KEY CLUSTERED ([InventoryRecordID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[InventoryStatus]...';


GO
CREATE TABLE [dbo].[InventoryStatus] (
    [InventoryStatusID] INT           IDENTITY (1, 1) NOT NULL,
    [Description]       NVARCHAR (50) NULL
);


GO
PRINT N'Creating PK_InventoryStatus...';


GO
ALTER TABLE [dbo].[InventoryStatus]
    ADD CONSTRAINT [PK_InventoryStatus] PRIMARY KEY CLUSTERED ([InventoryStatusID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[ObjectStore]...';


GO
CREATE TABLE [dbo].[ObjectStore] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [ObjectKey]    NVARCHAR (50)  NOT NULL,
    [SearchString] NVARCHAR (255) NOT NULL,
    [SystemType]   NVARCHAR (150) NOT NULL,
    [Data]         IMAGE          NOT NULL,
    [CreatedOn]    DATETIME       NOT NULL,
    [ModifiedOn]   DATETIME       NOT NULL
);


GO
PRINT N'Creating PK_ObjectStore...';


GO
ALTER TABLE [dbo].[ObjectStore]
    ADD CONSTRAINT [PK_ObjectStore] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[OrderItems]...';


GO
CREATE TABLE [dbo].[OrderItems] (
    [OrderID]                UNIQUEIDENTIFIER NOT NULL,
    [SKU]                    NVARCHAR (50)    NOT NULL,
    [Quantity]               INT              NOT NULL,
    [DateAdded]              DATETIME         NOT NULL,
    [LineItemPrice]          DECIMAL (18)     NOT NULL,
    [Discount]               DECIMAL (18)     NOT NULL,
    [DiscountReason]         NVARCHAR (255)   NULL,
    [Version]                TIMESTAMP        NOT NULL,
    [LineItemWeightInPounds] DECIMAL (18)     NOT NULL
);


GO
PRINT N'Creating PK_OrderItems...';


GO
ALTER TABLE [dbo].[OrderItems]
    ADD CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED ([OrderID] ASC, [SKU] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[Orders]...';


GO
CREATE TABLE [dbo].[Orders] (
    [OrderID]           UNIQUEIDENTIFIER NOT NULL,
    [OrderNumber]       NVARCHAR (50)    NULL,
    [UserName]          NVARCHAR (50)    NOT NULL,
    [UserLanguageCode]  CHAR (2)         NOT NULL,
    [TaxAmount]         MONEY            NOT NULL,
    [ShippingService]   NVARCHAR (50)    NULL,
    [ShippingAmount]    MONEY            NOT NULL,
    [DiscountAmount]    MONEY            NOT NULL,
    [DiscountReason]    NVARCHAR (50)    NULL,
    [ShippingAddressID] INT              NULL,
    [BillingAddressID]  INT              NULL,
    [DateShipped]       DATETIME         NULL,
    [TrackingNumber]    NVARCHAR (50)    NULL,
    [EstimatedDelivery] DATETIME         NULL,
    [SubTotal]          MONEY            NOT NULL,
    [OrderStatusID]     INT              NOT NULL,
    [CreatedOn]         DATETIME         NOT NULL,
    [ExecutedOn]        DATETIME         NULL,
    [ModifiedOn]        DATETIME         NOT NULL,
    [Version]           TIMESTAMP        NOT NULL
);


GO
PRINT N'Creating PK_Orders...';


GO
ALTER TABLE [dbo].[Orders]
    ADD CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED ([OrderID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[OrderStatus]...';


GO
CREATE TABLE [dbo].[OrderStatus] (
    [OrderStatusID] INT           NOT NULL,
    [Description]   NVARCHAR (50) NULL
);


GO
PRINT N'Creating PK_OrderStatus...';


GO
ALTER TABLE [dbo].[OrderStatus]
    ADD CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED ([OrderStatusID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[ProductDescriptors]...';


GO
CREATE TABLE [dbo].[ProductDescriptors] (
    [DescriptorID] INT             IDENTITY (1, 1) NOT NULL,
    [SKU]          NVARCHAR (50)   NOT NULL,
    [LanguageCode] CHAR (2)        NOT NULL,
    [Title]        NVARCHAR (50)   NOT NULL,
    [IsDefault]    BIT             NOT NULL,
    [Body]         NVARCHAR (2500) NOT NULL
);


GO
PRINT N'Creating PK_ProductDescriptors...';


GO
ALTER TABLE [dbo].[ProductDescriptors]
    ADD CONSTRAINT [PK_ProductDescriptors] PRIMARY KEY CLUSTERED ([DescriptorID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[ProductImages]...';


GO
CREATE TABLE [dbo].[ProductImages] (
    [ProductImageID] INT            IDENTITY (1, 1) NOT NULL,
    [SKU]            NVARCHAR (50)  NOT NULL,
    [ThumbUrl]       NVARCHAR (150) NOT NULL,
    [FullImageUrl]   NVARCHAR (150) NOT NULL
);


GO
PRINT N'Creating PK_ProductImages...';


GO
ALTER TABLE [dbo].[ProductImages]
    ADD CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED ([ProductImageID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[ProductOptionDisplays]...';


GO
CREATE TABLE [dbo].[ProductOptionDisplays] (
    [OptionDisplayID] INT           IDENTITY (1, 1) NOT NULL,
    [HTMLDisplay]     NVARCHAR (50) NOT NULL
);


GO
PRINT N'Creating PK_ProductOptionDisplays...';


GO
ALTER TABLE [dbo].[ProductOptionDisplays]
    ADD CONSTRAINT [PK_ProductOptionDisplays] PRIMARY KEY CLUSTERED ([OptionDisplayID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[ProductOptions]...';


GO
CREATE TABLE [dbo].[ProductOptions] (
    [OptionID]     INT            IDENTITY (1, 1) NOT NULL,
    [Description]  NVARCHAR (50)  NOT NULL,
    [LanguageCode] CHAR (2)       NOT NULL,
    [DisplayID]    INT            NOT NULL,
    [Prompt]       NVARCHAR (255) NOT NULL
);


GO
PRINT N'Creating PK_ProductOptions...';


GO
ALTER TABLE [dbo].[ProductOptions]
    ADD CONSTRAINT [PK_ProductOptions] PRIMARY KEY CLUSTERED ([OptionID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[ProductOptionValues]...';


GO
CREATE TABLE [dbo].[ProductOptionValues] (
    [OptionValueID] INT            IDENTITY (1, 1) NOT NULL,
    [OptionID]      INT            NOT NULL,
    [Description]   NVARCHAR (255) NOT NULL
);


GO
PRINT N'Creating PK_ProductOptionValues...';


GO
ALTER TABLE [dbo].[ProductOptionValues]
    ADD CONSTRAINT [PK_ProductOptionValues] PRIMARY KEY CLUSTERED ([OptionValueID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[Products]...';


GO
CREATE TABLE [dbo].[Products] (
    [SKU]               NVARCHAR (50)  NOT NULL,
    [DeliveryMethodID]  INT            NOT NULL,
    [ProductName]       NVARCHAR (50)  NOT NULL,
    [Blurb]             NVARCHAR (127) NOT NULL,
    [BasePrice]         DECIMAL (18)   NOT NULL,
    [WeightInPounds]    MONEY          NOT NULL,
    [DateAvailable]     DATETIME       NOT NULL,
    [InventoryStatusID] INT            NOT NULL,
    [EstimatedDelivery] NVARCHAR (50)  NOT NULL,
    [AllowBackOrder]    BIT            NOT NULL,
    [IsTaxable]         BIT            NOT NULL,
    [DefaultImageFile]  NVARCHAR (255) NULL,
    [Version]           TIMESTAMP      NOT NULL,
    [AmountOnHand]      INT            NOT NULL,
    [AllowPreOrder]     BIT            NOT NULL
);


GO
PRINT N'Creating PK_Products...';


GO
ALTER TABLE [dbo].[Products]
    ADD CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED ([SKU] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[Products_CrossSell]...';


GO
CREATE TABLE [dbo].[Products_CrossSell] (
    [SKU]      NVARCHAR (50) NOT NULL,
    [CrossSKU] NVARCHAR (50) NOT NULL
);


GO
PRINT N'Creating PK_Products_CrossSell...';


GO
ALTER TABLE [dbo].[Products_CrossSell]
    ADD CONSTRAINT [PK_Products_CrossSell] PRIMARY KEY CLUSTERED ([SKU] ASC, [CrossSKU] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[Products_Options]...';


GO
CREATE TABLE [dbo].[Products_Options] (
    [SKU]           NVARCHAR (50) NOT NULL,
    [OptionID]      INT           NOT NULL,
    [OptionValueID] INT           NOT NULL
);


GO
PRINT N'Creating PK_Products_Options...';


GO
ALTER TABLE [dbo].[Products_Options]
    ADD CONSTRAINT [PK_Products_Options] PRIMARY KEY CLUSTERED ([SKU] ASC, [OptionID] ASC, [OptionValueID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[Products_Related]...';


GO
CREATE TABLE [dbo].[Products_Related] (
    [SKU]        NVARCHAR (50) NOT NULL,
    [RelatedSKU] NVARCHAR (50) NOT NULL
);


GO
PRINT N'Creating PK_Products_Related...';


GO
ALTER TABLE [dbo].[Products_Related]
    ADD CONSTRAINT [PK_Products_Related] PRIMARY KEY CLUSTERED ([SKU] ASC, [RelatedSKU] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[ShippingMethods]...';


GO
CREATE TABLE [dbo].[ShippingMethods] (
    [ShippingMethodID]  INT           NOT NULL,
    [Carrier]           NVARCHAR (50) NOT NULL,
    [ServiceName]       NVARCHAR (50) NOT NULL,
    [RatePerPound]      DECIMAL (18)  NOT NULL,
    [BaseRate]          DECIMAL (18)  NOT NULL,
    [EstimatedDelivery] NVARCHAR (50) NULL,
    [DaysToDeliver]     INT           NOT NULL
);


GO
PRINT N'Creating PK_ShippingMethods...';


GO
ALTER TABLE [dbo].[ShippingMethods]
    ADD CONSTRAINT [PK_ShippingMethods] PRIMARY KEY CLUSTERED ([ShippingMethodID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[TaxRates]...';


GO
CREATE TABLE [dbo].[TaxRates] (
    [TaxRateID]  INT           IDENTITY (1, 1) NOT NULL,
    [Rate]       MONEY         NOT NULL,
    [Region]     CHAR (2)      NOT NULL,
    [Country]    CHAR (2)      NOT NULL,
    [PostalCode] NVARCHAR (50) NULL
);


GO
PRINT N'Creating PK_TaxRates...';


GO
ALTER TABLE [dbo].[TaxRates]
    ADD CONSTRAINT [PK_TaxRates] PRIMARY KEY CLUSTERED ([TaxRateID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[Transactions]...';


GO
CREATE TABLE [dbo].[Transactions] (
    [TransactionID]     UNIQUEIDENTIFIER NOT NULL,
    [OrderID]           UNIQUEIDENTIFIER NOT NULL,
    [TransactionDate]   DATETIME         NOT NULL,
    [Amount]            MONEY            NOT NULL,
    [AuthorizationCode] NVARCHAR (50)    NULL,
    [Notes]             NVARCHAR (50)    NULL,
    [Processor]         NVARCHAR (50)    NULL
);


GO
PRINT N'Creating PK_Transactions...';


GO
ALTER TABLE [dbo].[Transactions]
    ADD CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED ([TransactionID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating DF_Addresses_IsDefault...';


GO
ALTER TABLE [dbo].[Addresses]
    ADD CONSTRAINT [DF_Addresses_IsDefault] DEFAULT ((1)) FOR [IsDefault];


GO
PRINT N'Creating DF_CartItems_DateAdded...';


GO
ALTER TABLE [dbo].[CartItems]
    ADD CONSTRAINT [DF_CartItems_DateAdded] DEFAULT (getdate()) FOR [DateAdded];


GO
PRINT N'Creating DF_CartItems_DiscountAmount...';


GO
ALTER TABLE [dbo].[CartItems]
    ADD CONSTRAINT [DF_CartItems_DiscountAmount] DEFAULT ((0)) FOR [DiscountAmount];


GO
PRINT N'Creating DF_UserEvents_EventDate...';


GO
ALTER TABLE [dbo].[CustomerEvents]
    ADD CONSTRAINT [DF_UserEvents_EventDate] DEFAULT (getdate()) FOR [EventDate];


GO
PRINT N'Creating DF_Customers_Last...';


GO
ALTER TABLE [dbo].[Customers]
    ADD CONSTRAINT [DF_Customers_Last] DEFAULT (N'en') FOR [Last];


GO
PRINT N'Creating DF_InventoryRecords_DateEntered...';


GO
ALTER TABLE [dbo].[InventoryRecords]
    ADD CONSTRAINT [DF_InventoryRecords_DateEntered] DEFAULT (getdate()) FOR [DateEntered];


GO
PRINT N'Creating DF_InventoryRecords_Increment...';


GO
ALTER TABLE [dbo].[InventoryRecords]
    ADD CONSTRAINT [DF_InventoryRecords_Increment] DEFAULT ((0)) FOR [Increment];


GO
PRINT N'Creating DF_ObjectStore_CreatedOn...';


GO
ALTER TABLE [dbo].[ObjectStore]
    ADD CONSTRAINT [DF_ObjectStore_CreatedOn] DEFAULT (getdate()) FOR [CreatedOn];


GO
PRINT N'Creating DF_ObjectStore_ModifiedOn...';


GO
ALTER TABLE [dbo].[ObjectStore]
    ADD CONSTRAINT [DF_ObjectStore_ModifiedOn] DEFAULT (getdate()) FOR [ModifiedOn];


GO
PRINT N'Creating DF_OrderItems_Discount...';


GO
ALTER TABLE [dbo].[OrderItems]
    ADD CONSTRAINT [DF_OrderItems_Discount] DEFAULT ((0)) FOR [Discount];


GO
PRINT N'Creating DF_OrderItems_LineItemPrice...';


GO
ALTER TABLE [dbo].[OrderItems]
    ADD CONSTRAINT [DF_OrderItems_LineItemPrice] DEFAULT ((0)) FOR [LineItemPrice];


GO
PRINT N'Creating DF_OrderItems_LineItemWeightInPounds...';


GO
ALTER TABLE [dbo].[OrderItems]
    ADD CONSTRAINT [DF_OrderItems_LineItemWeightInPounds] DEFAULT ((5)) FOR [LineItemWeightInPounds];


GO
PRINT N'Creating DF_ShoppingCartItem_CreatedOn...';


GO
ALTER TABLE [dbo].[OrderItems]
    ADD CONSTRAINT [DF_ShoppingCartItem_CreatedOn] DEFAULT (getdate()) FOR [DateAdded];


GO
PRINT N'Creating DF_ShoppingCartItem_Quantity...';


GO
ALTER TABLE [dbo].[OrderItems]
    ADD CONSTRAINT [DF_ShoppingCartItem_Quantity] DEFAULT ((1)) FOR [Quantity];


GO
PRINT N'Creating DF_Orders_CreatedOn...';


GO
ALTER TABLE [dbo].[Orders]
    ADD CONSTRAINT [DF_Orders_CreatedOn] DEFAULT (getdate()) FOR [CreatedOn];


GO
PRINT N'Creating DF_Orders_DiscountAmount...';


GO
ALTER TABLE [dbo].[Orders]
    ADD CONSTRAINT [DF_Orders_DiscountAmount] DEFAULT ((0)) FOR [DiscountAmount];


GO
PRINT N'Creating DF_Orders_ModifiedOn...';


GO
ALTER TABLE [dbo].[Orders]
    ADD CONSTRAINT [DF_Orders_ModifiedOn] DEFAULT (getdate()) FOR [ModifiedOn];


GO
PRINT N'Creating DF_Orders_ShippingAmount...';


GO
ALTER TABLE [dbo].[Orders]
    ADD CONSTRAINT [DF_Orders_ShippingAmount] DEFAULT ((0)) FOR [ShippingAmount];


GO
PRINT N'Creating DF_Orders_SubTotal...';


GO
ALTER TABLE [dbo].[Orders]
    ADD CONSTRAINT [DF_Orders_SubTotal] DEFAULT ((0)) FOR [SubTotal];


GO
PRINT N'Creating DF_Orders_TaxAmount...';


GO
ALTER TABLE [dbo].[Orders]
    ADD CONSTRAINT [DF_Orders_TaxAmount] DEFAULT ((0)) FOR [TaxAmount];


GO
PRINT N'Creating DF_Orders_UserLanguageCode...';


GO
ALTER TABLE [dbo].[Orders]
    ADD CONSTRAINT [DF_Orders_UserLanguageCode] DEFAULT ('en') FOR [UserLanguageCode];


GO
PRINT N'Creating DF_ProductDescriptors_IsDefault...';


GO
ALTER TABLE [dbo].[ProductDescriptors]
    ADD CONSTRAINT [DF_ProductDescriptors_IsDefault] DEFAULT ((0)) FOR [IsDefault];


GO
PRINT N'Creating DF_ProductDescriptors_LanguageCode...';


GO
ALTER TABLE [dbo].[ProductDescriptors]
    ADD CONSTRAINT [DF_ProductDescriptors_LanguageCode] DEFAULT ('en') FOR [LanguageCode];


GO
PRINT N'Creating DF_ProductOptions_LanguageCode...';


GO
ALTER TABLE [dbo].[ProductOptions]
    ADD CONSTRAINT [DF_ProductOptions_LanguageCode] DEFAULT ('en') FOR [LanguageCode];


GO
PRINT N'Creating DF_Products_AllowBackOrder...';


GO
ALTER TABLE [dbo].[Products]
    ADD CONSTRAINT [DF_Products_AllowBackOrder] DEFAULT ((1)) FOR [AllowBackOrder];


GO
PRINT N'Creating DF_Products_AllowPreOrder...';


GO
ALTER TABLE [dbo].[Products]
    ADD CONSTRAINT [DF_Products_AllowPreOrder] DEFAULT ((1)) FOR [AllowPreOrder];


GO
PRINT N'Creating DF_Products_AmountOnHand...';


GO
ALTER TABLE [dbo].[Products]
    ADD CONSTRAINT [DF_Products_AmountOnHand] DEFAULT ((10)) FOR [AmountOnHand];


GO
PRINT N'Creating DF_Products_DateAvailable...';


GO
ALTER TABLE [dbo].[Products]
    ADD CONSTRAINT [DF_Products_DateAvailable] DEFAULT ('1/1/2003') FOR [DateAvailable];


GO
PRINT N'Creating DF_Products_DeliveryMethodID...';


GO
ALTER TABLE [dbo].[Products]
    ADD CONSTRAINT [DF_Products_DeliveryMethodID] DEFAULT ((1)) FOR [DeliveryMethodID];


GO
PRINT N'Creating DF_Products_EstimatedDelivery...';


GO
ALTER TABLE [dbo].[Products]
    ADD CONSTRAINT [DF_Products_EstimatedDelivery] DEFAULT (N'3-5 Days') FOR [EstimatedDelivery];


GO
PRINT N'Creating DF_Products_InventoryStatusID...';


GO
ALTER TABLE [dbo].[Products]
    ADD CONSTRAINT [DF_Products_InventoryStatusID] DEFAULT ((1)) FOR [InventoryStatusID];


GO
PRINT N'Creating DF_Products_IsTaxable...';


GO
ALTER TABLE [dbo].[Products]
    ADD CONSTRAINT [DF_Products_IsTaxable] DEFAULT ((1)) FOR [IsTaxable];


GO
PRINT N'Creating DF_Products_UnitPrice...';


GO
ALTER TABLE [dbo].[Products]
    ADD CONSTRAINT [DF_Products_UnitPrice] DEFAULT ((0)) FOR [BasePrice];


GO
PRINT N'Creating DF_Products_WeightInPounds...';


GO
ALTER TABLE [dbo].[Products]
    ADD CONSTRAINT [DF_Products_WeightInPounds] DEFAULT ((0)) FOR [WeightInPounds];


GO
PRINT N'Creating DF_ShippingMethods_BaseRate...';


GO
ALTER TABLE [dbo].[ShippingMethods]
    ADD CONSTRAINT [DF_ShippingMethods_BaseRate] DEFAULT ((0)) FOR [BaseRate];


GO
PRINT N'Creating DF_ShippingMethods_DaysToDeliver...';


GO
ALTER TABLE [dbo].[ShippingMethods]
    ADD CONSTRAINT [DF_ShippingMethods_DaysToDeliver] DEFAULT ((2)) FOR [DaysToDeliver];


GO
PRINT N'Creating DF_ShippingMethods_RatePerPound...';


GO
ALTER TABLE [dbo].[ShippingMethods]
    ADD CONSTRAINT [DF_ShippingMethods_RatePerPound] DEFAULT ((0)) FOR [RatePerPound];


GO
PRINT N'Creating DF_TaxRates_Country...';


GO
ALTER TABLE [dbo].[TaxRates]
    ADD CONSTRAINT [DF_TaxRates_Country] DEFAULT ('US') FOR [Country];


GO
PRINT N'Creating DF_TaxRates_Rate...';


GO
ALTER TABLE [dbo].[TaxRates]
    ADD CONSTRAINT [DF_TaxRates_Rate] DEFAULT ((0)) FOR [Rate];


GO
PRINT N'Creating DF_Transactions_Amount...';


GO
ALTER TABLE [dbo].[Transactions]
    ADD CONSTRAINT [DF_Transactions_Amount] DEFAULT ((0)) FOR [Amount];


GO
PRINT N'Creating DF_Transactions_TransactionDate...';


GO
ALTER TABLE [dbo].[Transactions]
    ADD CONSTRAINT [DF_Transactions_TransactionDate] DEFAULT (getdate()) FOR [TransactionDate];


GO
PRINT N'Creating FK_CartItems_Customers...';


GO
ALTER TABLE [dbo].[CartItems] WITH NOCHECK
    ADD CONSTRAINT [FK_CartItems_Customers] FOREIGN KEY ([UserName]) REFERENCES [dbo].[Customers] ([UserName]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_CartItems_Products...';


GO
ALTER TABLE [dbo].[CartItems] WITH NOCHECK
    ADD CONSTRAINT [FK_CartItems_Products] FOREIGN KEY ([SKU]) REFERENCES [dbo].[Products] ([SKU]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Categories_Products_Categories...';


GO
ALTER TABLE [dbo].[Categories_Products] WITH NOCHECK
    ADD CONSTRAINT [FK_Categories_Products_Categories] FOREIGN KEY ([CategoryCode]) REFERENCES [dbo].[Categories] ([Code]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Categories_Products_Products...';


GO
ALTER TABLE [dbo].[Categories_Products] WITH NOCHECK
    ADD CONSTRAINT [FK_Categories_Products_Products] FOREIGN KEY ([SKU]) REFERENCES [dbo].[Products] ([SKU]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_CustomerEvents_Customers...';


GO
ALTER TABLE [dbo].[CustomerEvents] WITH NOCHECK
    ADD CONSTRAINT [FK_CustomerEvents_Customers] FOREIGN KEY ([UserName]) REFERENCES [dbo].[Customers] ([UserName]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_UserEvents_UseBehaviors...';


GO
ALTER TABLE [dbo].[CustomerEvents] WITH NOCHECK
    ADD CONSTRAINT [FK_UserEvents_UseBehaviors] FOREIGN KEY ([UserBehaviorID]) REFERENCES [dbo].[CustomerBehaviors] ([UserBehaviorID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_InventoryRecords_Products...';


GO
ALTER TABLE [dbo].[InventoryRecords] WITH NOCHECK
    ADD CONSTRAINT [FK_InventoryRecords_Products] FOREIGN KEY ([SKU]) REFERENCES [dbo].[Products] ([SKU]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_OrderItems_Orders...';


GO
ALTER TABLE [dbo].[OrderItems] WITH NOCHECK
    ADD CONSTRAINT [FK_OrderItems_Orders] FOREIGN KEY ([OrderID]) REFERENCES [dbo].[Orders] ([OrderID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_OrderItems_Products...';


GO
ALTER TABLE [dbo].[OrderItems] WITH NOCHECK
    ADD CONSTRAINT [FK_OrderItems_Products] FOREIGN KEY ([SKU]) REFERENCES [dbo].[Products] ([SKU]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Orders_Addresses...';


GO
ALTER TABLE [dbo].[Orders] WITH NOCHECK
    ADD CONSTRAINT [FK_Orders_Addresses] FOREIGN KEY ([ShippingAddressID]) REFERENCES [dbo].[Addresses] ([AddressID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Orders_Addresses1...';


GO
ALTER TABLE [dbo].[Orders] WITH NOCHECK
    ADD CONSTRAINT [FK_Orders_Addresses1] FOREIGN KEY ([BillingAddressID]) REFERENCES [dbo].[Addresses] ([AddressID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Orders_Customers...';


GO
ALTER TABLE [dbo].[Orders] WITH NOCHECK
    ADD CONSTRAINT [FK_Orders_Customers] FOREIGN KEY ([UserName]) REFERENCES [dbo].[Customers] ([UserName]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Orders_OrderStatus...';


GO
ALTER TABLE [dbo].[Orders] WITH NOCHECK
    ADD CONSTRAINT [FK_Orders_OrderStatus] FOREIGN KEY ([OrderStatusID]) REFERENCES [dbo].[OrderStatus] ([OrderStatusID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_ProductDescriptors_Products...';


GO
ALTER TABLE [dbo].[ProductDescriptors] WITH NOCHECK
    ADD CONSTRAINT [FK_ProductDescriptors_Products] FOREIGN KEY ([SKU]) REFERENCES [dbo].[Products] ([SKU]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_ProductImages_Products...';


GO
ALTER TABLE [dbo].[ProductImages] WITH NOCHECK
    ADD CONSTRAINT [FK_ProductImages_Products] FOREIGN KEY ([SKU]) REFERENCES [dbo].[Products] ([SKU]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_ProductOptions_ProductOptionDisplays...';


GO
ALTER TABLE [dbo].[ProductOptions] WITH NOCHECK
    ADD CONSTRAINT [FK_ProductOptions_ProductOptionDisplays] FOREIGN KEY ([DisplayID]) REFERENCES [dbo].[ProductOptionDisplays] ([OptionDisplayID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_ProductOptionValues_ProductOptions...';


GO
ALTER TABLE [dbo].[ProductOptionValues] WITH NOCHECK
    ADD CONSTRAINT [FK_ProductOptionValues_ProductOptions] FOREIGN KEY ([OptionID]) REFERENCES [dbo].[ProductOptions] ([OptionID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Products_DeliveryMethod...';


GO
ALTER TABLE [dbo].[Products] WITH NOCHECK
    ADD CONSTRAINT [FK_Products_DeliveryMethod] FOREIGN KEY ([DeliveryMethodID]) REFERENCES [dbo].[DeliveryMethod] ([DeliveryMethodID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Products_InventoryStatus...';


GO
ALTER TABLE [dbo].[Products] WITH NOCHECK
    ADD CONSTRAINT [FK_Products_InventoryStatus] FOREIGN KEY ([InventoryStatusID]) REFERENCES [dbo].[InventoryStatus] ([InventoryStatusID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Products_CrossSell_Products...';


GO
ALTER TABLE [dbo].[Products_CrossSell] WITH NOCHECK
    ADD CONSTRAINT [FK_Products_CrossSell_Products] FOREIGN KEY ([SKU]) REFERENCES [dbo].[Products] ([SKU]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Products_CrossSell_Products1...';


GO
ALTER TABLE [dbo].[Products_CrossSell] WITH NOCHECK
    ADD CONSTRAINT [FK_Products_CrossSell_Products1] FOREIGN KEY ([CrossSKU]) REFERENCES [dbo].[Products] ([SKU]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Products_Options_ProductOptions...';


GO
ALTER TABLE [dbo].[Products_Options] WITH NOCHECK
    ADD CONSTRAINT [FK_Products_Options_ProductOptions] FOREIGN KEY ([OptionID]) REFERENCES [dbo].[ProductOptions] ([OptionID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Products_Options_ProductOptionValues...';


GO
ALTER TABLE [dbo].[Products_Options] WITH NOCHECK
    ADD CONSTRAINT [FK_Products_Options_ProductOptionValues] FOREIGN KEY ([OptionValueID]) REFERENCES [dbo].[ProductOptionValues] ([OptionValueID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Products_Options_Products...';


GO
ALTER TABLE [dbo].[Products_Options] WITH NOCHECK
    ADD CONSTRAINT [FK_Products_Options_Products] FOREIGN KEY ([SKU]) REFERENCES [dbo].[Products] ([SKU]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Products_Related_Products...';


GO
ALTER TABLE [dbo].[Products_Related] WITH NOCHECK
    ADD CONSTRAINT [FK_Products_Related_Products] FOREIGN KEY ([SKU]) REFERENCES [dbo].[Products] ([SKU]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Products_Related_Products1...';


GO
ALTER TABLE [dbo].[Products_Related] WITH NOCHECK
    ADD CONSTRAINT [FK_Products_Related_Products1] FOREIGN KEY ([RelatedSKU]) REFERENCES [dbo].[Products] ([SKU]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Transactions_Orders...';


GO
ALTER TABLE [dbo].[Transactions] WITH NOCHECK
    ADD CONSTRAINT [FK_Transactions_Orders] FOREIGN KEY ([OrderID]) REFERENCES [dbo].[Orders] ([OrderID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
-- Refactoring step to update target server with deployed transaction logs
CREATE TABLE  [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
GO
sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
GO

GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

/* Inventory Statuses */
INSERT INTO [dbo].[InventoryStatus] ([Description]) VALUES ('In Stock');
INSERT INTO [dbo].[InventoryStatus] ([Description]) VALUES ('Back Order');
INSERT INTO [dbo].[InventoryStatus] ([Description]) VALUES ('Pre-order');
INSERT INTO [dbo].[InventoryStatus] ([Description]) VALUES ('Special Order');
INSERT INTO [dbo].[InventoryStatus] ([Description]) VALUES ('Discontinued');
INSERT INTO [dbo].[InventoryStatus] ([Description]) VALUES ('Currently Unavailable');

/* Order Statuses */
INSERT INTO [dbo].[OrderStatus] ([OrderSTatusID], [Description]) VALUES (1, 'New');
INSERT INTO [dbo].[OrderStatus] ([OrderSTatusID], [Description]) VALUES (2, 'Submitted');
INSERT INTO [dbo].[OrderStatus] ([OrderSTatusID], [Description]) VALUES (3, 'Verified');
INSERT INTO [dbo].[OrderStatus] ([OrderSTatusID], [Description]) VALUES (4, 'Charged');
INSERT INTO [dbo].[OrderStatus] ([OrderSTatusID], [Description]) VALUES (5, 'Packaging');
INSERT INTO [dbo].[OrderStatus] ([OrderSTatusID], [Description]) VALUES (6, 'Shipped');
INSERT INTO [dbo].[OrderStatus] ([OrderSTatusID], [Description]) VALUES (7, 'Returned');
INSERT INTO [dbo].[OrderStatus] ([OrderSTatusID], [Description]) VALUES (8, 'Cancelled');
INSERT INTO [dbo].[OrderStatus] ([OrderSTatusID], [Description]) VALUES (9, 'Refunded');
INSERT INTO [dbo].[OrderStatus] ([OrderSTatusID], [Description]) VALUES (10, 'Closed');
INSERT INTO [dbo].[OrderStatus] ([OrderSTatusID], [Description]) VALUES (99, 'Not Checked Out');

/* Delivery Method */
INSERT INTO [dbo].[DeliveryMethod] ([Description]) VALUES ('Shipped');
INSERT INTO [dbo].[DeliveryMethod] ([Description]) VALUES ('Download');
INSERT INTO [dbo].[DeliveryMethod] ([Description]) VALUES ('Email');

/* Shipping Methods */
INSERT INTO [dbo].[ShippingMethods] ([ShippingMethodID], [Carrier], [ServiceName], 
	[RatePerPound], [BaseRate], [EstimatedDelivery], [DaysToDeliver]) VALUES
	(1,	'FedEx', 'Overnight', 3, 12, 'Next Morning By 9AM', 1);
INSERT INTO [dbo].[ShippingMethods] ([ShippingMethodID], [Carrier], [ServiceName], 
	[RatePerPound], [BaseRate], [EstimatedDelivery], [DaysToDeliver]) VALUES
	(2, 'FedEx', 'Next Day', 2, 10, 'End of Next Business Day', 1);
INSERT INTO [dbo].[ShippingMethods] ([ShippingMethodID], [Carrier], [ServiceName], 
	[RatePerPound], [BaseRate], [EstimatedDelivery], [DaysToDeliver]) VALUES
	(3, 'USPS', 'Priority Mail', 1, 5, '2-3 Business Days', 3);
INSERT INTO [dbo].[ShippingMethods] ([ShippingMethodID], [Carrier], [ServiceName], 
	[RatePerPound], [BaseRate], [EstimatedDelivery], [DaysToDeliver]) VALUES
	(4, 'USPS', 'Ground', 1, 1, '3-5 Business Days', 4);
	
/* Tax Rates */
INSERT INTO [dbo].[TaxRates] ([Rate], [Region], [Country]) VALUES
	(0.0825, 'CA', 'US');
INSERT INTO [dbo].[TaxRates] ([Rate], [Region], [Country]) VALUES
	(0.0645, 'HI', 'US');

/* Product Categories */
INSERT INTO [dbo].[Categories] ([Code], [Title]) VALUES ('model', 'Model Airplanes');
INSERT INTO [dbo].[Categories] ([Code], [Title]) VALUES ('paper', 'Paper Airplanes');

/* Products */
INSERT INTO [dbo].[Products] (
	[SKU], [DeliveryMethodID], [ProductName], [BasePrice], [WeightInPounds],
	[DateAvailable], [InventoryStatusID], [EstimatedDelivery], [AllowPreOrder], [AmountOnHand],
	[DefaultImageFile], [IsTaxable], [AllowBackOrder],
	[Blurb]) VALUES
	('modnwt', 1, 'Northwind Trader', 50, 1.0000,
	'2010-02-01 00:00:00.000', 2, '2-3 Weeks', 1, 10,
	'nwt', 1, 1,
	'Move cargo in style with the Northwind Trader.');
INSERT INTO [dbo].[Categories_Products] ([CategoryCode], [SKU]) VALUES ('model', 'modnwt');
INSERT INTO [dbo].[ProductDescriptors] ([SKU], [LanguageCode], [Title], [IsDefault], [Body]) VALUES
	('modnwt', 'en', 'Summary', 0, 
	'Our new Northwind Trader cargo plane is the perfect next addition to your flying fleet.');
INSERT INTO [dbo].[ProductDescriptors] ([SKU], [LanguageCode], [Title], [IsDefault], [Body]) VALUES
	('modnwt', 'en', 'From The Manufacturer', 0, 
	'The Northwind Trader model is ready to carry cargo around the globe. Or outfit it for passenger travel. The Northwind Trader is our largest model airplane. Complete with customization options for almost any configuration, the Northwind Trader is a perfect gift for seasoned modelers and expert pilots. Checkout the enormous wingspan.');
INSERT INTO [dbo].[ProductDescriptors] ([SKU], [LanguageCode], [Title], [IsDefault], [Body]) VALUES
	('modnwt', 'en', 'Technical Details', 0, 
	'<ul><li><b>Weight</b>: 6 lbs</li><li><b>Height</b>: 6"</li><li><b>Wingspan</b>: 30"</li><li><b>Special Feature</b>: Patented balanced power engines, cargo and passenger customization kits</li></ul>');
INSERT INTO [dbo].[Products] (
	[SKU], [DeliveryMethodID], [ProductName], [BasePrice], [WeightInPounds],
	[DateAvailable], [InventoryStatusID], [EstimatedDelivery], [AllowPreOrder], [AmountOnHand],
	[DefaultImageFile], [IsTaxable], [AllowBackOrder],
	[Blurb]) VALUES
	('modfcf', 1, 'Fourth Coffee Flyer', 50, 1.0000,
	'2010-02-01 00:00:00.000', 2, '2-3 Weeks', 1, 10,
	'fcf', 1, 1,
	'The Fourth Coffee Flyer is a model airplane for the highly caffeinated.');
INSERT INTO [dbo].[Categories_Products] ([CategoryCode], [SKU]) VALUES ('model', 'modfcf');
INSERT INTO [dbo].[ProductDescriptors] ([SKU], [LanguageCode], [Title], [IsDefault], [Body]) VALUES
	('modfcf', 'en', 'Summary', 0, 
	'Show off your stunt piloting abilities with the ultimate in tight acrobatic planes.');
INSERT INTO [dbo].[ProductDescriptors] ([SKU], [LanguageCode], [Title], [IsDefault], [Body]) VALUES
	('modfcf', 'en', 'From The Manufacturer', 0, 
	'Intentionally twitchy controls, including our tightest fly-by-wire configuration ever, make the Fourth Coffee Flyer the most exciting model in this catalog. Fly circles around your friends and improve your repair skills as you learn to fly this plane. For advanced pilots only.');
INSERT INTO [dbo].[ProductDescriptors] ([SKU], [LanguageCode], [Title], [IsDefault], [Body]) VALUES
	('modfcf', 'en', 'Technical Details', 0, 
	'<ul><li><b>Weight</b>: 2 lbs</li><li><b>Height</b>: 3"</li><li><b>Wingspan</b>: 9"</li><li><b>Special Feature</b>: Dual-twitch fly-by-wire control kit, instant spike stunt engine, minor crash repair kit</li></ul>');
INSERT INTO [dbo].[Products] (
	[SKU], [DeliveryMethodID], [ProductName], [BasePrice], [WeightInPounds],
	[DateAvailable], [InventoryStatusID], [EstimatedDelivery], [AllowPreOrder], [AmountOnHand],
	[DefaultImageFile], [IsTaxable], [AllowBackOrder],
	[Blurb]) VALUES
	('modtrr', 1, 'Trey Research Rocket', 50, 1.0000,
	'2010-02-01 00:00:00.000', 2, '2-3 Weeks', 1, 10,
	'trr', 1, 1,
	'The best of our modern design with self-stabilizing controls');
INSERT INTO [dbo].[Categories_Products] ([CategoryCode], [SKU]) VALUES ('model', 'modtrr');
INSERT INTO [dbo].[ProductDescriptors] ([SKU], [LanguageCode], [Title], [IsDefault], [Body]) VALUES
	('modtrr', 'en', 'Summary', 0, 
	'The Trey Research Rocket is our modern stunt model airplane.');
INSERT INTO [dbo].[ProductDescriptors] ([SKU], [LanguageCode], [Title], [IsDefault], [Body]) VALUES
	('modtrr', 'en', 'From The Manufacturer', 0, 
	'Fast, easy to control and full of plenty of surprises, the Trey Research Rocket is a good starter airplane. Build up your stunt portfolio with this exciting, but forgiving model airplane.');
INSERT INTO [dbo].[ProductDescriptors] ([SKU], [LanguageCode], [Title], [IsDefault], [Body]) VALUES
	('modtrr', 'en', 'Technical Details', 0, 
	'<ul><li><b>Weight</b>: 1.5 lbs</li><li><b>Height</b>: 2"</li><li><b>Wingspan</b>: 12"</li><li><b>Special Feature</b>: Trainer landing rig, "How to fly in style" stunt guide video</li></ul>');
INSERT INTO [dbo].[Products] (
	[SKU], [DeliveryMethodID], [ProductName], [BasePrice], [WeightInPounds],
	[DateAvailable], [InventoryStatusID], [EstimatedDelivery], [AllowPreOrder], [AmountOnHand],
	[DefaultImageFile], [IsTaxable], [AllowBackOrder],
	[Blurb]) VALUES
	('papwts', 1, 'Wingtip Toys Stunt Plane', 50, 1.0000,
	'2010-02-01 00:00:00.000', 2, '2-3 Weeks', 1, 10,
	'wts', 1, 1,
	'Throw our namesake plane and it may never come back to earth');
INSERT INTO [dbo].[Categories_Products] ([CategoryCode], [SKU]) VALUES ('paper', 'papwts');
INSERT INTO [dbo].[ProductDescriptors] ([SKU], [LanguageCode], [Title], [IsDefault], [Body]) VALUES
	('papwts', 'en', 'Summary', 0, 
	'You will not believe this is a paper airplane.');
INSERT INTO [dbo].[ProductDescriptors] ([SKU], [LanguageCode], [Title], [IsDefault], [Body]) VALUES
	('papwts', 'en', 'From The Manufacturer', 0, 
	'This old school airplane will out soar and outlast any other paper airplane you can buy. We have been improving this design for over 10 years, so you can trust it will perform when you throw it.');
INSERT INTO [dbo].[ProductDescriptors] ([SKU], [LanguageCode], [Title], [IsDefault], [Body]) VALUES
	('papwts', 'en', 'Technical Details', 0, 
	'<ul><li><b>Wingspan</b>: 10"</li><li><b>Special Feature</b>: Stunt folding options</li></ul>');
INSERT INTO [dbo].[Products] (
	[SKU], [DeliveryMethodID], [ProductName], [BasePrice], [WeightInPounds],
	[DateAvailable], [InventoryStatusID], [EstimatedDelivery], [AllowPreOrder], [AmountOnHand],
	[DefaultImageFile], [IsTaxable], [AllowBackOrder],
	[Blurb]) VALUES
	('papwwi', 1, 'World Wide Importer', 50, 1.0000,
	'2010-02-01 00:00:00.000', 2, '2-3 Weeks', 1, 10,
	'wwi', 1, 1,
	'The ultimat luxury item, in paper');
INSERT INTO [dbo].[Categories_Products] ([CategoryCode], [SKU]) VALUES ('paper', 'papwwi');
INSERT INTO [dbo].[ProductDescriptors] ([SKU], [LanguageCode], [Title], [IsDefault], [Body]) VALUES
	('papwwi', 'en', 'Summary', 0, 
	'Hang this paper airplane from the ceiling and dream of a life in the clouds.');
INSERT INTO [dbo].[ProductDescriptors] ([SKU], [LanguageCode], [Title], [IsDefault], [Body]) VALUES
	('papwwi', 'en', 'From The Manufacturer', 0, 
	'This is a highly detailed non-flying paper airplane designed for display.');
INSERT INTO [dbo].[ProductDescriptors] ([SKU], [LanguageCode], [Title], [IsDefault], [Body]) VALUES
	('papwwi', 'en', 'Technical Details', 0, 
	'<ul><li><b>Wingspan</b>: 14"</li></ul>');
INSERT INTO [dbo].[Products] (
	[SKU], [DeliveryMethodID], [ProductName], [BasePrice], [WeightInPounds],
	[DateAvailable], [InventoryStatusID], [EstimatedDelivery], [AllowPreOrder], [AmountOnHand],
	[DefaultImageFile], [IsTaxable], [AllowBackOrder],
	[Blurb]) VALUES
	('papcce', 1, 'Contoso Cloud Explorer', 50, 1.0000,
	'2010-02-01 00:00:00.000', 2, '2-3 Weeks', 1, 10,
	'cce', 1, 1,
	'The perfect starter plane');
INSERT INTO [dbo].[Categories_Products] ([CategoryCode], [SKU]) VALUES ('paper', 'papcce');
INSERT INTO [dbo].[ProductDescriptors] ([SKU], [LanguageCode], [Title], [IsDefault], [Body]) VALUES
	('papcce', 'en', 'Summary', 0, 
	'This paper airplane is the perfect starter kit for any aspiring Tailspin Toys pilot (or mechanic).');
INSERT INTO [dbo].[ProductDescriptors] ([SKU], [LanguageCode], [Title], [IsDefault], [Body]) VALUES
	('papcce', 'en', 'Technical Details', 0, 
	'<ul><li><b>Wingspan</b>: 6"</li><li><b>Special Feature</b>: World of paper and model airplanes book</li></ul>');


INSERT INTO [dbo].[Products_Related] ([SKU], [RelatedSKU]) VALUES ('modnwt', 'papwwi');
INSERT INTO [dbo].[Products_Related] ([SKU], [RelatedSKU]) VALUES ('papwwi', 'modnwt');
INSERT INTO [dbo].[Products_Related] ([SKU], [RelatedSKU]) VALUES ('papwwi', 'papcce');
INSERT INTO [dbo].[Products_Related] ([SKU], [RelatedSKU]) VALUES ('papcce', 'papwwi');
INSERT INTO [dbo].[Products_Related] ([SKU], [RelatedSKU]) VALUES ('modfcf', 'modtrr');
INSERT INTO [dbo].[Products_Related] ([SKU], [RelatedSKU]) VALUES ('modfcf', 'papwts');
INSERT INTO [dbo].[Products_Related] ([SKU], [RelatedSKU]) VALUES ('modtrr', 'modfcf');
INSERT INTO [dbo].[Products_Related] ([SKU], [RelatedSKU]) VALUES ('modtrr', 'papwts');
INSERT INTO [dbo].[Products_Related] ([SKU], [RelatedSKU]) VALUES ('papwts', 'modfcf');
INSERT INTO [dbo].[Products_Related] ([SKU], [RelatedSKU]) VALUES ('papwts', 'modtrr');

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[CartItems] WITH CHECK CHECK CONSTRAINT [FK_CartItems_Customers];

ALTER TABLE [dbo].[CartItems] WITH CHECK CHECK CONSTRAINT [FK_CartItems_Products];

ALTER TABLE [dbo].[Categories_Products] WITH CHECK CHECK CONSTRAINT [FK_Categories_Products_Categories];

ALTER TABLE [dbo].[Categories_Products] WITH CHECK CHECK CONSTRAINT [FK_Categories_Products_Products];

ALTER TABLE [dbo].[CustomerEvents] WITH CHECK CHECK CONSTRAINT [FK_CustomerEvents_Customers];

ALTER TABLE [dbo].[CustomerEvents] WITH CHECK CHECK CONSTRAINT [FK_UserEvents_UseBehaviors];

ALTER TABLE [dbo].[InventoryRecords] WITH CHECK CHECK CONSTRAINT [FK_InventoryRecords_Products];

ALTER TABLE [dbo].[OrderItems] WITH CHECK CHECK CONSTRAINT [FK_OrderItems_Orders];

ALTER TABLE [dbo].[OrderItems] WITH CHECK CHECK CONSTRAINT [FK_OrderItems_Products];

ALTER TABLE [dbo].[Orders] WITH CHECK CHECK CONSTRAINT [FK_Orders_Addresses];

ALTER TABLE [dbo].[Orders] WITH CHECK CHECK CONSTRAINT [FK_Orders_Addresses1];

ALTER TABLE [dbo].[Orders] WITH CHECK CHECK CONSTRAINT [FK_Orders_Customers];

ALTER TABLE [dbo].[Orders] WITH CHECK CHECK CONSTRAINT [FK_Orders_OrderStatus];

ALTER TABLE [dbo].[ProductDescriptors] WITH CHECK CHECK CONSTRAINT [FK_ProductDescriptors_Products];

ALTER TABLE [dbo].[ProductImages] WITH CHECK CHECK CONSTRAINT [FK_ProductImages_Products];

ALTER TABLE [dbo].[ProductOptions] WITH CHECK CHECK CONSTRAINT [FK_ProductOptions_ProductOptionDisplays];

ALTER TABLE [dbo].[ProductOptionValues] WITH CHECK CHECK CONSTRAINT [FK_ProductOptionValues_ProductOptions];

ALTER TABLE [dbo].[Products] WITH CHECK CHECK CONSTRAINT [FK_Products_DeliveryMethod];

ALTER TABLE [dbo].[Products] WITH CHECK CHECK CONSTRAINT [FK_Products_InventoryStatus];

ALTER TABLE [dbo].[Products_CrossSell] WITH CHECK CHECK CONSTRAINT [FK_Products_CrossSell_Products];

ALTER TABLE [dbo].[Products_CrossSell] WITH CHECK CHECK CONSTRAINT [FK_Products_CrossSell_Products1];

ALTER TABLE [dbo].[Products_Options] WITH CHECK CHECK CONSTRAINT [FK_Products_Options_ProductOptions];

ALTER TABLE [dbo].[Products_Options] WITH CHECK CHECK CONSTRAINT [FK_Products_Options_ProductOptionValues];

ALTER TABLE [dbo].[Products_Options] WITH CHECK CHECK CONSTRAINT [FK_Products_Options_Products];

ALTER TABLE [dbo].[Products_Related] WITH CHECK CHECK CONSTRAINT [FK_Products_Related_Products];

ALTER TABLE [dbo].[Products_Related] WITH CHECK CHECK CONSTRAINT [FK_Products_Related_Products1];

ALTER TABLE [dbo].[Transactions] WITH CHECK CHECK CONSTRAINT [FK_Transactions_Orders];


GO
