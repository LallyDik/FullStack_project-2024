﻿CREATE TABLE [dbo].[ADDRESS] (
    [CODE]          INT	IDENTITY (10000, 1) NOT NULL,
    [COUNTRY]        NVARCHAR (50) NOT NULL,
    [CITY]           NVARCHAR (50) NOT NULL,
    [NEIGHBORHOOD]   NVARCHAR (50) NOT NULL,
    [STREET]         NVARCHAR (50) NOT NULL,
    [BUILDING_NUBER] INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([CODE] ASC)
);

CREATE TABLE [dbo].[BOYS] (
    [ID]          INT           NOT NULL,
    [LAST_NAME]    NVARCHAR (50) NOT NULL,
    [FIRST_NAME]   NVARCHAR (50) NOT NULL,
    [AGE]         INT           NOT NULL,
    [COMMUNITY]   NVARCHAR (50) NOT NULL,
    [ADDRESS_CODE] INT           NOT NULL,
    [YESHIVA]     NVARCHAR (50) NOT NULL,
	[CONTACT_CODE] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_BOYS_ADDRESS] FOREIGN KEY ([ADDRESS_CODE]) REFERENCES [dbo].[ADDRESS] ([CODE]),
	CONSTRAINT [FK_BOYS_CONTACT] FOREIGN KEY ([CONTACT_CODE]) REFERENCES [dbo].[CONTACT] ([CODE])
);

CREATE TABLE [dbo].[GIRLS] (
    [ID]          INT           NOT NULL,
    [LAST_NAME]    NVARCHAR (50) NOT NULL,
    [FIRST_NAME]   NVARCHAR (50) NOT NULL,
    [AGE]         INT           NOT NULL,
    [COMMUNITY]   NVARCHAR (50) NOT NULL,
    [ADDRESS_CODE] INT           NOT NULL,
    [SEMINAR]     NVARCHAR (50) NOT NULL,
	[CONTACT_CODE] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_GIRLS_ADDRESS] FOREIGN KEY ([ADDRESS_CODE]) REFERENCES [dbo].[ADDRESS] ([CODE]),
	CONSTRAINT [FK_GIRLS_CONTACT] FOREIGN KEY ([CONTACT_CODE]) REFERENCES [dbo].[CONTACT] ([CODE])
);

CREATE TABLE [dbo].[CONTACT] (
    [CODE]        INT           IDENTITY (100, 1) NOT NULL,
    [LAST_NAME]    NVARCHAR (50) NOT NULL,
    [FIRST_NAME]   NVARCHAR (50) NOT NULL,
    [PHONE_NUMBER] NCHAR (10)    NOT NULL,
    [ROLE]        NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([CODE] ASC)
);