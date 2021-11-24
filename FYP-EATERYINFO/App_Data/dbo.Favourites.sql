CREATE TABLE [dbo].[Favourites] (
    [EateryID]   INT           NOT NULL,
    [EateryName] VARCHAR (100) NOT NULL,
    [Address]    VARCHAR (100) NOT NULL,
	[AddedToFavourites] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([EateryID] ASC)
);

