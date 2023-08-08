/*
Aman Bhatt
CSC 355-602 T DATASBASE SYSTEMS
Assignment 2
Submission Data, 2023
*/

DROP TABLE SHIPMENT;
DROP TABLE DRIVER;
DROP TABLE ROUTE;
DROP TABLE VAN;


CREATE TABLE VAN
(
    VID     VARCHAR2(4),
    Make    VARCHAR2(10),
    Year NUMBER(4) CHECK (Year >= 2000),
    
    PRIMARY KEY (VID)
    
    
);

INSERT INTO VAN VALUES ('9999', 'FORD', '2000');

INSERT INTO VAN VALUES ('8888', 'RAM', '2020');

INSERT INTO VAN VALUES ('7777', 'TESLA', '2019');

INSERT INTO VAN VALUES ('6666', 'RIVIAN', '2022');

CREATE TABLE ROUTE
(
    RID     VARCHAR(6),
    Region  VARCHAR(2),
    
    PRIMARY KEY (RID)

);

INSERT INTO ROUTE VALUES ('111111', 'IL');

INSERT INTO ROUTE VALUES ('444444', 'NY');

INSERT INTO ROUTE VALUES ('222222', 'TX');

INSERT INTO ROUTE VALUES ('333333', 'CA');

CREATE TABLE DRIVER
(
    DID     VARCHAR(3),
    Name    VARCHAR(10),
    VanID   VARCHAR(4),
    Hours   NUMBER(2) CHECK (Hours > 0),
    
    PRIMARY KEY (DID),
    
    FOREIGN KEY (VanID) REFERENCES VAN (VID)
    
);

INSERT INTO DRIVER VALUES ('111', 'LEWIS', '6666', '17');

INSERT INTO DRIVER VALUES ('222', 'MAX', '8888', '32');

INSERT INTO DRIVER VALUES ('333', 'DANIEL', '7777', '20');

INSERT INTO DRIVER VALUES ('444', 'CHARLES', '9999', '30');


CREATE TABLE SHIPMENT
(
DriverID    VARCHAR(3), 
RouteID     VARCHAR(6),
ShippingDate    DATE,

PRIMARY KEY (DriverID, RouteID),

FOREIGN KEY (DriverID) REFERENCES DRIVER(DID),

FOREIGN KEY (RouteID) REFERENCES ROUTE(RID)

);

INSERT INTO SHIPMENT VALUES ('111', '111111', DATE'2022-01-01') ;

INSERT INTO SHIPMENT VALUES ('222', '222222', DATE '2022-02-02') ;

INSERT INTO SHIPMENT VALUES ('333', '333333', DATE '2022-03-03') ;

INSERT INTO SHIPMENT VALUES ('444', '444444', DATE '2022-04-04') ;

INSERT INTO SHIPMENT VALUES ('111', '333333', DATE '2022-05-05') ;


SELECT * FROM SHIPMENT;

SELECT * FROM VAN;

SELECT * FROM ROUTE;

SELECT * FROM DRIVER;

COMMIT;
