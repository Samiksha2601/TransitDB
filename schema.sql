
CREATE DATABASE TransitDB;
GO

USE TransitDB;
GO

CREATE TABLE City
(
    CityId INT IDENTITY(1,1) PRIMARY KEY,
    CityName VARCHAR(100) NOT NULL,
    State VARCHAR(50) NOT NULL
);

CREATE TABLE TransitLine
(
    TransitLineId INT IDENTITY(1,1) PRIMARY KEY,
    LineName VARCHAR(100) NOT NULL,

    TransitType VARCHAR(50)
        CHECK (TransitType IN ('Bus','Train','Subway')),

    Status VARCHAR(20)
        CHECK (Status IN ('Active','Inactive')),

    CityId INT NOT NULL,

    FOREIGN KEY (CityId)
        REFERENCES City(CityId)
);

CREATE TABLE Route
(
    RouteId INT IDENTITY(1,1) PRIMARY KEY,
    RouteName VARCHAR(100) NOT NULL,
    StartStop VARCHAR(100),
    EndStop VARCHAR(100),

    TransitLineId INT NOT NULL,

    FOREIGN KEY (TransitLineId)
        REFERENCES TransitLine(TransitLineId)
);

CREATE TABLE Ridership
(
    RidershipId INT IDENTITY(1,1) PRIMARY KEY,

    RouteId INT NOT NULL,

    RecordDate DATE NOT NULL,

    TotalRiders INT NOT NULL,

    FOREIGN KEY(RouteId)
        REFERENCES Route(RouteId)
);