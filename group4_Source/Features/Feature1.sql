--Feature 1:
--Showing stops in between for User 1 
SELECT s.StopID, s.StopName
FROM [TRANSIT].[Stops] s, [TRANSIT].[Journeys] j
WHERE j.JourneyID = 301
AND (
    (s.StopID >= j.Start AND s.StopID <= j.Destination)
    OR
    (s.StopID <= j.Start AND s.StopID >= j.Destination)
)
ORDER BY s.StopID;

