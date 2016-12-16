CREATE TABLE [dbo].[CustomerBehaviors] (
    [UserBehaviorID] INT           NOT NULL,
    [Description]    NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_UseBehaviors] PRIMARY KEY CLUSTERED ([UserBehaviorID] ASC)
);

