/* 
Aman Bhatt
CSC 355 602T
Assignment 4 
Apr 26, 2023 
*/

--1. For each band, give the band number and the average age of the musicians in the band. (You may assume that every band has at least one musician in it.) 
--Order the output from the lowest average age to the highest.

SELECT BANDNUMBER, AVG(AGE)
    FROM MUSICIAN
    GROUP BY BANDNUMBER
    ORDER BY AVG(AGE) ;

--2. Give an alphabetical list of the names of all halls where ‘Maybe Or Not’ has played a show.

SELECT DISTINCT HALL.HNAME
    FROM HALL INNER JOIN SHOW ON HALL.HID = SHOW.HALLID
    WHERE SHOW.BANDNUMBER = 2
    ORDER BY HALL.HNAME ASC;

--3. List the names of all players whose instrument is ‘Guitar’, along with their band names and ages. Order the players from oldest to youngest.

SELECT MNAME, BNAME, AGE
    FROM MUSICIAN INNER JOIN BAND ON MUSICIAN.BANDNUMBER = BAND.BNUMBER
    WHERE INSTRUMENT = 'Guitar'
    ORDER BY AGE DESC;

--4. List the names of all halls that have had at least one show since December 1st, 2022.

SELECT DISTINCT HNAME
    FROM SHOW INNER JOIN HALL ON SHOW.HALLID = HALL.HID
    WHERE SHOWDATE > '01-DEC-2022'; 

--5. Give the band numbers and names of all bands that have at least three musicians in them (also display how many musicians are each of these bands).

SELECT BAND.BNAME, COUNT(*) AS TOTAL_MEMBER
    FROM MUSICIAN
    INNER JOIN BAND ON MUSICIAN.BANDNUMBER = BAND.BNUMBER
    GROUP BY BAND.BNAME
    HAVING COUNT(*) >= 3;

--6. For each hall, give the hall ID and the largest payment that has ever made to a band for a show in that hall. 
--(Your output does not have to include halls that have not had any shows in them yet.)

SELECT HALLID, MAX(PAYMENT)
    FROM SHOW
    GROUP BY HALLID
    ORDER BY MAX(PAYMENT) DESC;

--7. For each show, give the show date, the hall name, and the potential income to the hall from that show –
--the potential income from the show is the capacity of the hall multiplied by the ticket price, minus the payment
--made to the band. Order the output by the show date, from the most recent show to the earliest show.

SELECT SHOW.SHOWDATE, HALL.HNAME, (HALL.CAPACITY * SHOW.TICKETPRICE) - SHOW.PAYMENT AS INCOME
    FROM SHOW
    INNER JOIN HALL ON SHOW.HALLID = HALL.HID
    ORDER BY SHOW.SHOWDATE DESC;


--8. For each band, give the band ID, the number of shows the band has played, and the total of the payments the band has
--received from those shows. Order the output from the lowest payment total to the highest payment total. 
-- (Your output should include bands that have not played any shows yet. Also, note that the function NVL(expression, 0) 
--can be used to replace a NULL expression that may appear in the output with a zero instead.)

SELECT MUSICIAN.BANDNUMBER, COUNT(DISTINCT SHOWDATE) AS TOTAL_SHOWS, SUM(SHOW.PAYMENT) AS TOTAL_PAYMENTS
    FROM MUSICIAN
    LEFT OUTER JOIN SHOW ON MUSICIAN.BANDNUMBER = SHOW.BANDNUMBER
    GROUP BY MUSICIAN.BANDNUMBER
    ORDER BY TOTAL_PAYMENTS ASC;
