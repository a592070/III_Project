--------------------------------------------------------
--  已建立檔案 - 星期三-十一月-18-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View ACCOUNTLISTVIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "III_TEAM_DBA"."ACCOUNTLISTVIEW" ("USERNAME", "INAME", "EMAIL", "REGISTER", "MODIFY_DATE", "STATUS") AS 
  SELECT 
    account.username,
    identity.NAME as iNAME,
    account.email,
    account.REGISTER,
    account.MODIFY_DATE,
    account.STATUS    
FROM  account ,identity 
where account.identity = identity.id
;
