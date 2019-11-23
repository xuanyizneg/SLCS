
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/23/2019 13:32:47
-- Generated from EDMX file: C:\Users\rennnhong\Documents\SLCS\SLCS\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DB_SLCS];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Book'
CREATE TABLE [dbo].[Book] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Bookname] nvarchar(max)  NOT NULL,
    [Author] nvarchar(max)  NOT NULL,
    [Publisher] nvarchar(max)  NOT NULL,
    [PublishPlace] nvarchar(max)  NOT NULL,
    [PublishYear] nvarchar(max)  NOT NULL,
    [Isbn] nvarchar(max)  NOT NULL,
    [TopicId] int  NOT NULL,
    [BookStatusId] int  NOT NULL,
    [LocationId] int  NOT NULL
);
GO

-- Creating table 'User'
CREATE TABLE [dbo].[User] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Account] nvarchar(max)  NOT NULL,
    [IdNumber] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Reserve'
CREATE TABLE [dbo].[Reserve] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ReverseTime] nvarchar(max)  NOT NULL,
    [BookId] int  NOT NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'BorrowLog'
CREATE TABLE [dbo].[BorrowLog] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [BorrowTime] nvarchar(max)  NOT NULL,
    [ReturnTime] nvarchar(max)  NOT NULL,
    [BookId] int  NOT NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'Topic'
CREATE TABLE [dbo].[Topic] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Location'
CREATE TABLE [dbo].[Location] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'BookStatusSet'
CREATE TABLE [dbo].[BookStatusSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Book'
ALTER TABLE [dbo].[Book]
ADD CONSTRAINT [PK_Book]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'User'
ALTER TABLE [dbo].[User]
ADD CONSTRAINT [PK_User]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Reserve'
ALTER TABLE [dbo].[Reserve]
ADD CONSTRAINT [PK_Reserve]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BorrowLog'
ALTER TABLE [dbo].[BorrowLog]
ADD CONSTRAINT [PK_BorrowLog]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Topic'
ALTER TABLE [dbo].[Topic]
ADD CONSTRAINT [PK_Topic]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Location'
ALTER TABLE [dbo].[Location]
ADD CONSTRAINT [PK_Location]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BookStatusSet'
ALTER TABLE [dbo].[BookStatusSet]
ADD CONSTRAINT [PK_BookStatusSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [BookId] in table 'Reserve'
ALTER TABLE [dbo].[Reserve]
ADD CONSTRAINT [FK_BookReserve]
    FOREIGN KEY ([BookId])
    REFERENCES [dbo].[Book]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookReserve'
CREATE INDEX [IX_FK_BookReserve]
ON [dbo].[Reserve]
    ([BookId]);
GO

-- Creating foreign key on [UserId] in table 'Reserve'
ALTER TABLE [dbo].[Reserve]
ADD CONSTRAINT [FK_ReserveUser]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[User]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ReserveUser'
CREATE INDEX [IX_FK_ReserveUser]
ON [dbo].[Reserve]
    ([UserId]);
GO

-- Creating foreign key on [BookId] in table 'BorrowLog'
ALTER TABLE [dbo].[BorrowLog]
ADD CONSTRAINT [FK_BookBorrowLog]
    FOREIGN KEY ([BookId])
    REFERENCES [dbo].[Book]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookBorrowLog'
CREATE INDEX [IX_FK_BookBorrowLog]
ON [dbo].[BorrowLog]
    ([BookId]);
GO

-- Creating foreign key on [UserId] in table 'BorrowLog'
ALTER TABLE [dbo].[BorrowLog]
ADD CONSTRAINT [FK_BorrowLogUser]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[User]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BorrowLogUser'
CREATE INDEX [IX_FK_BorrowLogUser]
ON [dbo].[BorrowLog]
    ([UserId]);
GO

-- Creating foreign key on [TopicId] in table 'Book'
ALTER TABLE [dbo].[Book]
ADD CONSTRAINT [FK_BookTopic]
    FOREIGN KEY ([TopicId])
    REFERENCES [dbo].[Topic]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookTopic'
CREATE INDEX [IX_FK_BookTopic]
ON [dbo].[Book]
    ([TopicId]);
GO

-- Creating foreign key on [BookStatusId] in table 'Book'
ALTER TABLE [dbo].[Book]
ADD CONSTRAINT [FK_BookBookStatus]
    FOREIGN KEY ([BookStatusId])
    REFERENCES [dbo].[BookStatusSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookBookStatus'
CREATE INDEX [IX_FK_BookBookStatus]
ON [dbo].[Book]
    ([BookStatusId]);
GO

-- Creating foreign key on [LocationId] in table 'Book'
ALTER TABLE [dbo].[Book]
ADD CONSTRAINT [FK_BookLocation]
    FOREIGN KEY ([LocationId])
    REFERENCES [dbo].[Location]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookLocation'
CREATE INDEX [IX_FK_BookLocation]
ON [dbo].[Book]
    ([LocationId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------