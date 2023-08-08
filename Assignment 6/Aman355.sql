/* Aman Bhatt 
CSC 355 Section 602T/631 
Assignment 6 
May 24, 2023 */

DECLARE

highMpgThreshold INPUTS.HighMPG%TYPE;
totalMiles TRIP.Miles%TYPE := 0;
totalGallons TRIP.Gallons%TYPE := 0;
tripCount NUMBER := 0;
highMpgTripCount NUMBER := 0;
tripMpg TRIP.Miles%TYPE;
overallMpg NUMBER(10, 2);
  
BEGIN

SELECT HighMPG INTO highMpgThreshold FROM INPUTS;
DBMS_OUTPUT.PUT_LINE('High MPG threshold: ' || highMpgThreshold);

  FOR trip IN (SELECT TID, TripDate, Miles, Gallons FROM TRIP)
  LOOP
    tripMpg := trip.Miles / trip.Gallons;
    DBMS_OUTPUT.PUT('Trip '|| trip.TID ||': '|| TO_CHAR(trip.TripDate, 'DD-MON-YY') ||' '|| tripMpg);

    IF tripMpg >= highMpgThreshold THEN
      DBMS_OUTPUT.PUT_LINE(' HIGH');
      highMpgTripCount := highMpgTripCount + 1; 
      ELSE
      DBMS_OUTPUT.PUT_LINE('');
    END IF;

    totalMiles := totalMiles + trip.Miles;
    totalGallons := totalGallons + trip.Gallons;
    tripCount := tripCount + 1;
    
END LOOP;

overallMpg := totalMiles / totalGallons;
DBMS_OUTPUT.PUT_LINE('Overall MPG: ' || overallMpg);
DBMS_OUTPUT.PUT_LINE('Trips with high MPG: ' || highMpgTripCount);

END;
/
