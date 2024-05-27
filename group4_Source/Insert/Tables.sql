CREATE SCHEMA TRANSIT 
GO
DROP TABLE IF EXISTS [TRANSIT].[Routes]
DROP TABLE IF EXISTS [TRANSIT].[Stops]
DROP TABLE IF EXISTS [TRANSIT].[Users]
DROP TABLE IF EXISTS [TRANSIT].[Vehicles]
DROP TABLE IF EXISTS [TRANSIT].[Journeys]
DROP TABLE IF EXISTS [TRANSIT].[Schedule]

CREATE TABLE TRANSIT.Users (
    UserID INT NOT NULL,
    Password VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    CONSTRAINT user_PK PRIMARY KEY (UserID)
);

CREATE TABLE TRANSIT.Stops (
    StopID INT NOT NULL,
    StopName VARCHAR(100) NOT NULL,
    CONSTRAINT Stop_pK PRIMARY KEY (StopID)
);

CREATE TABLE TRANSIT.Routes (
    RouteID INT NOT NULL,
    Zone VARCHAR(100),
    CONSTRAINT route_pK PRIMARY KEY (RouteID)
);

CREATE TABLE TRANSIT.Vehicles (
    VehicleID INT NOT NULL,
    VehicleType VARCHAR(10) NOT NULL,
    CONSTRAINT vehicle_pK PRIMARY KEY (VehicleID)
);

CREATE TABLE TRANSIT.Journeys (
    JourneyID INT NOT NULL,
    UserID INT,
    Start INT,
    Destination INT,
    CONSTRAINT journey_FK PRIMARY KEY (JourneyID),
    CONSTRAINT user_FK FOREIGN KEY (UserID) REFERENCES TRANSIT.Users(UserID),
    CONSTRAINT stop_FK FOREIGN KEY (Start) REFERENCES  TRANSIT.Stops(StopID),
    CONSTRAINT stopd_FK FOREIGN KEY (Destination) REFERENCES TRANSIT.Stops(StopID)  
);

CREATE TABLE TRANSIT.Schedule (
    RouteID INT,
    StopID INT,
    VehicleID INT,
    ExpectedTime TIME,
    CONSTRAINT schedule_pK PRIMARY KEY (RouteID, StopID, VehicleID),
    CONSTRAINT route_FK FOREIGN KEY (RouteID) REFERENCES TRANSIT.Routes(RouteID),
    CONSTRAINT stops_FK FOREIGN KEY (StopID) REFERENCES TRANSIT.Stops(StopID),
    CONSTRAINT vechile_FK FOREIGN KEY (VehicleID) REFERENCES TRANSIT.Vehicles(VehicleID)
    
);


