
USE TransitDB;
GO

-- Query 1
-- Show all transit lines and the city they belong to

SELECT
    t.LineName,
    t.TransitType,
    c.CityName,
    c.State
FROM TransitLine t
JOIN City c
ON t.CityId = c.CityId;

-- Query 2
-- Count transit lines in each city

SELECT
    c.CityName,
    COUNT(t.TransitLineId) AS TotalTransitLines
FROM City c
LEFT JOIN TransitLine t
ON c.CityId=t.CityId
GROUP BY c.CityName;

-- Query 3
-- Route with the highest ridership

SELECT TOP 1
    r.RouteName,
    rd.TotalRiders
FROM Ridership rd
JOIN Route r
ON rd.RouteId=r.RouteId
ORDER BY rd.TotalRiders DESC;

-- Query 4
-- Active transit lines in Chicago

SELECT
    t.LineName,
    t.TransitType
FROM TransitLine t
JOIN City c
ON t.CityId=c.CityId
WHERE
    t.Status='Active'
AND
    c.CityName='Chicago';

-- Query 5
-- Create an index on Status

CREATE INDEX IX_TransitLine_Status
ON TransitLine(Status);

