DROP TABLE [dbo].[OrderItem];
DROP TABLE [dbo].[Order];
DROP TABLE [dbo].[WishList];
DROP TABLE [dbo].[Artwork];
DROP TABLE [dbo].[Payment];
DROP TABLE [dbo].[Customer];
DROP TABLE [dbo].[Artist];


CREATE TABLE [dbo].[Artist] (
    [Artist_ID] INT          IDENTITY (1000, 1) NOT NULL,
    [Username]  VARCHAR (50) NOT NULL,
    [Email]     VARCHAR (50) NOT NULL,
    [ContactNo] VARCHAR (50) NOT NULL,
    [Password]  VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Artist_ID] ASC)
);

CREATE TABLE [dbo].[Customer] (
    [Cust_ID]   INT          IDENTITY (1000, 1) NOT NULL,
    [Username]  VARCHAR (50) NOT NULL,
    [Email]     VARCHAR (50) NOT NULL,
    [ContactNo] VARCHAR (50) NULL
    [Address]   VARCHAR (50) NULL,
    [Password]  VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Cust_ID] ASC)
);

CREATE TABLE [dbo].[Payment] (
    [Pay_ID]     INT        IDENTITY (1000, 1) NOT NULL,
    [Pay_Date]   DATETIME   NULL,
    [Pay_Amount] SMALLMONEY NULL,
    CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED ([Pay_ID] ASC)
);

CREATE TABLE [dbo].[Artwork] (
    [Art_ID]      INT           IDENTITY (1000, 1) NOT NULL,
    [Name]        VARCHAR (50)  NOT NULL,
    [Description] VARCHAR (100) NOT NULL,
    [Status]      VARCHAR (50)  NOT NULL,
    [Price]       SMALLMONEY    NOT NULL,
    [Image]       IMAGE         NULL,
    [Stock]       INT           NOT NULL,
    [Artist_ID]   INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Art_ID] ASC),
    CONSTRAINT [FK_Artwork_Artist] FOREIGN KEY ([Artist_ID]) REFERENCES [dbo].[Artist] ([Artist_ID])
);

CREATE TABLE [dbo].[WishList] (
    [Art_ID]  INT  NOT NULL,
    [Cust_ID] INT  NOT NULL,
    [W_Date]  DATE NULL,
    CONSTRAINT [WishList_ID] PRIMARY KEY CLUSTERED ([Art_ID] ASC, [Cust_ID] ASC),
    CONSTRAINT [FK_WishList_Customer] FOREIGN KEY ([Cust_ID]) REFERENCES [dbo].[Customer] ([Cust_ID]),
    CONSTRAINT [FK_WishList_Artwork] FOREIGN KEY ([Art_ID]) REFERENCES [dbo].[Artwork] ([Art_ID])
);

CREATE TABLE [dbo].[Order] (
    [Order_ID]     INT          IDENTITY (1000, 1) NOT NULL,
    [Order_Status] VARCHAR (50) NULL,
    [Order_Date]   DATE         NULL,
    [Cust_ID]      INT          NULL,
    [Pay_ID]       INT          NULL,
    CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED ([Order_ID] ASC),
    CONSTRAINT [FK_Order_Customer] FOREIGN KEY ([Cust_ID]) REFERENCES [dbo].[Customer] ([Cust_ID]),
    CONSTRAINT [FK_Order_Payment] FOREIGN KEY ([Pay_ID]) REFERENCES [dbo].[Payment] ([Pay_ID])
);

CREATE TABLE [dbo].[OrderItem] (
    [Order_ID]  INT        NOT NULL,
    [Art_ID]    INT        NOT NULL,
    [Quantity]  NCHAR (10) NULL,
    [PriceEach] NCHAR (10) NULL,
    CONSTRAINT [OrderItem_ID] PRIMARY KEY CLUSTERED ([Order_ID] ASC, [Art_ID] ASC),
    CONSTRAINT [FK_OrderItem_Order] FOREIGN KEY ([Order_ID]) REFERENCES [dbo].[Order] ([Order_ID]),
    CONSTRAINT [FK_OrderItem_Artwork] FOREIGN KEY ([Art_ID]) REFERENCES [dbo].[Artwork] ([Art_ID])
);

