--SPNORMS

CREATE TABLE "MISDEV"."SPNORMS"
(
   LINESECTIONTYPEID varchar2(150) PRIMARY KEY NOT NULL,
   UOM varchar2(20),
   STANDARDCOST float(8),
   DESCRIPTION varchar2(200)
)
;
CREATE UNIQUE INDEX SYS_C007018 ON SPNORMS(LINESECTIONTYPEID)
;
-----------------------




--SPSTDESTHMT
CREATE TABLE "MISDEV"."SPSTDESTHMT"
(
   APP_NO varchar2(20) NOT NULL,
   STD_NO varchar2(50) NOT NULL,
   JOBNAME varchar2(50),
   CONTINGENCY varchar2(20),
   DESCRIPTION varchar2(60),
   TOTAL_COST float(20),
   SECDEPOSIT float(20),
   PROJECTTYPE varchar2(30),
   DEPT_ID varchar2(20) NOT NULL,
   STATUS decimal(22),
   ENTRY_BY varchar2(20),
   ENTRY_DATE date,
   VALIDATE_BY_EE varchar2(20),
   VALIDATE_DATE_EE date,
   APPROVED_BY varchar2(20),
   REJECTED_BY varchar2(20),
   REJECTED_DATE date,
   REJ_REASON_EE varchar2(200),
   REJ_RESON_CE varchar2(100),
   PLANING_BY varchar2(20),
   PLANING_DATE date,
   POST_DEPTID varchar2(10),
   REBATE_COST float(20),
   CEBCOST float(20),
   TOCONPAY float(20),
   CON_COST float(20),
   SINNO varchar2(20),
   VALIDATE_DATE_CE date,
   REJ_RESON_PE varchar2(200),
   VALIDATE_BY_CE varchar2(20),
   APPROVED_DATE date,
   CONSTRAINT SYS_SPSTDESTHMT PRIMARY KEY (APP_NO,STD_NO,DEPT_ID)
)
;
CREATE UNIQUE INDEX SYS_SPSTDESTHMT ON SPSTDESTHMT
(
  APP_NO,
  STD_NO,
  DEPT_ID
)
;

--SPSTDESTDMT
CREATE TABLE "MISDEV"."SPSTDESTDMT"
(
   APP_NO varchar2(20) NOT NULL,
   STD_NO varchar2(20) NOT NULL,
   LINE_TYPE varchar2(50) NOT NULL,
   LENGTH float(8),
   LINE_COST float(20),
   EST_COST float(20),
   DEPT_ID varchar2(10),
   UOM varchar2(10),
   LINEDES varchar2(200),
   CONSTRAINT SYS_SPSTDESTDMT PRIMARY KEY (APP_NO,STD_NO,LINE_TYPE)
)
;
CREATE UNIQUE INDEX SYS_SPSTDESTDMT ON SPSTDESTDMT
(
  APP_NO,
  STD_NO,
  LINE_TYPE
)
;

--SPESTEDY_CONS
CREATE TABLE "MISDEV"."SPESTEDY_CONS"
(
   APPOINTMENT_ID varchar2(11) NOT NULL,
   DEPT_ID char(6) NOT NULL,
   APPOINMENT_TYPE varchar2(10),
   REFERENCE_NO varchar2(20),
   APPOINTMENT_DATE date,
   TIME_SESSION varchar2(10),
   SUBURB varchar2(50),
   STATUS char(1),
   ALLOCATED_BY varchar2(10),
   ALLOCATED_DATE date,
   ALLOCATED_TIME varchar2(11),
   ALLOCATED_TO varchar2(10),
   DESCRIPTION varchar2(100),
   CONSTRAINT PK_SPESTEDY_CONS PRIMARY KEY (DEPT_ID,APPOINTMENT_ID)
)
;
ALTER TABLE SPESTEDY_CONS
ADD CONSTRAINT FK_SPESTEDY_CONS
FOREIGN KEY (DEPT_ID)
REFERENCES GLDEPTM(DEPT_ID) ON DELETE NO ACTION ON UPDATE CASCADE

;
CREATE UNIQUE INDEX UC_SPESTEDY_CONS ON SPESTEDY_CONS
(
  DEPT_ID,
  REFERENCE_NO,
  APPOINMENT_TYPE,
  STATUS
)
;
CREATE UNIQUE INDEX PK_SPESTEDY_CONS ON SPESTEDY_CONS
(
  DEPT_ID,
  APPOINTMENT_ID
)
;
--ESTIMATE_REFERENCEBS
CREATE TABLE "MISDEV"."ESTIMATE_REFERENCEBS"
(
   SESTIMATE_NO varchar2(21) NOT NULL,
   DEPT_ID char(6) NOT NULL,
   WESTIMATE_NO varchar2(21) NOT NULL,
   STATUS varchar2(2),
   ID_NO varchar2(10),
   PROJECTNO varchar2(21),
   CONSRUCTOR_ID varchar2(4),
   POSTED_BY varchar2(8),
   POSTED_DATE date,
   POSTED_TIME varchar2(11),
   CONSTRAINT PK_ESTIMATE_REFERENCE_BS PRIMARY KEY (SESTIMATE_NO,WESTIMATE_NO,DEPT_ID)
)
;
CREATE UNIQUE INDEX PK_ESTIMATE_REFERENCE_BS ON ESTIMATE_REFERENCEBS
(
  SESTIMATE_NO,
  WESTIMATE_NO,
  DEPT_ID
)
;
CREATE UNIQUE INDEX SYS_ESTIMATE_REFERENCE_BS ON ESTIMATE_REFERENCEBS(WESTIMATE_NO)
;

--WIRING_LAND_DETAIL_CON
CREATE TABLE "MISDEV"."WIRING_LAND_DETAIL_CON"
(
   APPLICATION_ID varchar2(24) NOT NULL,
   DEPT_ID char(6) NOT NULL,
   CON_REF_NO varchar2(100),
   AREA_CODE char(6),
   FUND_SOURCE varchar2(10),
   REPRESENTATIVE varchar2(50),
   SCHEME_NO varchar2(100),
   SCHEME_NAME varchar2(500),
   IS_ELECTRICITY_HAVING char(1),
   DES_OF_PREMISES varchar2(50),
   ELECTORATE varchar2(50),
   DEV_SEC varchar2(50),
   GS_DIVISION varchar2(50),
   AGA_DIVISION varchar2(50),
   NO_OF_METER_POINT decimal(3),
   CAP_OF_SERVICE decimal(4),
   REPRESENTATIVE2 varchar2(50),
   REPCONTACT varchar2(50),
   REP2CONTACT varchar2(50),
   CONSTRAINT SYS_C0035311 PRIMARY KEY (APPLICATION_ID,DEPT_ID)
)
;
ALTER TABLE WIRING_LAND_DETAIL_CON
ADD CONSTRAINT SYS_C0035312
FOREIGN KEY (APPLICATION_ID)
REFERENCES APPLICATIONS(APPLICATION_ID) ON DELETE NO ACTION ON UPDATE CASCADE

;
CREATE UNIQUE INDEX SYS_C0035311 ON WIRING_LAND_DETAIL_CON
(
  APPLICATION_ID,
  DEPT_ID
)
;
--SPPEGINFOMATION
CREATE TABLE "MISDEV"."SPPEGINFOMATION"
(
   ID varchar2(25) NOT NULL,
   NAME varchar2(40),
   DESCRIPTION varchar2(50),
   DEPT_ID varchar2(6),
   PARENT_ID varchar2(25) NOT NULL,
   CONSTRAINT SYS_SPPEGINFOMATION PRIMARY KEY (ID,PARENT_ID)
)
;
CREATE UNIQUE INDEX SYS_SPPEGINFOMATION ON SPPEGINFOMATION
(
  ID,
  PARENT_ID
)
;
--SPPOINTDMT
CREATE TABLE "MISDEV"."SPPOINTDMT"
(
   LINESECTIONTYPEID varchar2(200) NOT NULL,
   POLETYPEID char(100),
   POINTTYPEID varchar2(200),
   RES_TYPE char(20),
   RES_CD char(20) NOT NULL,
   RES_CAT decimal(20),
   RES_NAME char(150),
   UOM char(4),
   ESTIMATE_QTY float(8),
   TOLERANCE decimal(22),
   UNIT_PRICE float(8),
   DEPT_ID varchar2(6),
   CONSTRAINT PK_SPPOINTDMT PRIMARY KEY (LINESECTIONTYPEID,RES_CD)
)
;
CREATE UNIQUE INDEX PK_SPPOINTDMT ON SPPOINTDMT
(
  LINESECTIONTYPEID,
  RES_CD
)
;

UPDATE spnorms sn
SET sn.description =
  (SELECT line.name
  FROM linesectype line
  WHERE line.lineid = sn.linesectiontypeid
  )
WHERE EXISTS
  (SELECT 1 FROM linesectype line1  WHERE line1.lineid =sn.linesectiontypeid 
  )

  
  drop index UC_SPESTEDY_CONS 

CREATE UNIQUE INDEX UC_SPESTEDY_CONS ON SPESTEDY_CONS
(
  DEPT_ID,
  REFERENCE_NO,
  APPOINMENT_TYPE,
  ALLOCATED_TO,
  STATUS
)
;

alter table "R3PRD1"."WIRING_LAND_DETAIL_CON" modify AREA_CODE varchar2(60);

alter table "MISDEV"."WIRING_LAND_DETAIL_CON" add district varchar2(50);
alter table estimate_referencebs rename column CONSRUCTOR_ID TO ENTRY_BY;