--Feature 2:

--User travelling in forward direction (having single route in database)
WITH VehiclesForJourney AS (
    SELECT DISTINCT s.VehicleID
    FROM [TRANSIT].[Journeys] j
    INNER JOIN [TRANSIT].[Schedule] s ON j.Start = s.StopID
    WHERE j.JourneyID = 302
)

SELECT
    r.Zone,
    v.VehicleType AS VehicleTy,
    s.VehicleID AS Vehicle_No,
    st.StopName AS Stops,
    s.ExpectedTime
FROM [TRANSIT].[Journeys] j
INNER JOIN VehiclesForJourney vfj ON j.JourneyID = 302
INNER JOIN [TRANSIT].[Schedule] s ON vfj.VehicleID = s.VehicleID
INNER JOIN [TRANSIT].[Routes] r ON s.RouteID = r.RouteID
INNER JOIN [TRANSIT].[Stops] st ON s.StopID = st.StopID
INNER JOIN [TRANSIT].[Vehicles] v ON s.VehicleID = v.VehicleID
WHERE 
    j.JourneyID = 302
    AND (
        s.ExpectedTime BETWEEN 
        (SELECT ExpectedTime FROM [TRANSIT].[Schedule] WHERE StopID = j.Start AND VehicleID = s.VehicleID) 
        AND 
        (SELECT ExpectedTime FROM [TRANSIT].[Schedule] WHERE StopID = j.Destination AND VehicleID = s.VehicleID)
    )
ORDER BY s.ExpectedTime;

