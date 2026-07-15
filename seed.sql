
USE TransitDB;
GO

INSERT INTO City (CityName, State)
VALUES
('Chicago','Illinois'),
('New York','New York'),
('Boston','Massachusetts'),
('Seattle','Washington'),
('Dallas','Texas');

INSERT INTO TransitLine
(LineName, TransitType, Status, CityId)
VALUES
('Blue Line','Train','Active',1),
('Red Line','Train','Active',1),
('Green Subway','Subway','Inactive',2),
('Express Bus','Bus','Active',3),
('Airport Shuttle','Bus','Active',4);

INSERT INTO Route
(RouteName, StartStop, EndStop, TransitLineId)
VALUES
('Downtown-Airport','Downtown','Airport',1),
('University Loop','University','City Center',2),
('Central Park Route','Central Park','East Side',3),
('Harbor Express','Harbor','Downtown',4),
('Airport Connector','Airport','Main Station',5);

INSERT INTO Ridership
(RouteId, RecordDate, TotalRiders)
VALUES
(1,'2026-07-01',4200),
(2,'2026-07-01',3500),
(3,'2026-07-01',2900),
(4,'2026-07-01',5100),
(5,'2026-07-01',4600);

