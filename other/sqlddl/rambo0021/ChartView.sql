--------------------------------------------------------
--  已建立檔案 - 星期四-十二月-17-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View REGISTERMONTHVIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "III_TEAM_DBA"."REGISTERMONTHVIEW" ("MONTH", "COUNT") AS 
  select EXTRACT(month from REGISTER)"MONTH",
 count(REGISTER) "COUNT"
 from ACCOUNTLISTVIEW
 group by extract(month from REGISTER)
;
--------------------------------------------------------
--  DDL for View ACCOUNTCHARTVIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "III_TEAM_DBA"."ACCOUNTCHARTVIEW" ("INAME", "COUNT") AS 
  SELECT
    INAME,count(*) as count
FROM
ACCOUNTLISTVIEW
group by INAME
;