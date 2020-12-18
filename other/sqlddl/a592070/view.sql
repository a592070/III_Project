--------------------------------------------------------
--  DDL for View ATTRACTIONVIEW
--------------------------------------------------------

CREATE OR REPLACE VIEW "III_TEAM_DBA"."ATTRACTIONVIEW" ("SN", "NAME", "ADDRESS", "TICKETINFO", "DESCRIPTION", "RATING", "STATUS") AS
select A_SN as sn , NAME, ADDRESS, TICKETINFO, DESCRIPTION, rating, STATUS from ATTRACTION
;
--------------------------------------------------------
--  DDL for View TRAVEL_SET_CARVIEW
--------------------------------------------------------

CREATE OR REPLACE VIEW "III_TEAM_DBA"."TRAVEL_SET_CARVIEW" ("SN", "CARTYPE", "PRICE", "COMPANY") AS
select c1.SN_CARTYPE as sn, c1.CARTYPE as carType, c1.PRICE as price, c2.NAME_COMPANY as company from CARTYPE c1, CARRENTALCOMPANY c2 where c1.SN_RENTCARCOMPANY=c2.SN_RENTALCOMPANY
;
--------------------------------------------------------
--  DDL for View TRAVEL_SET_HOTELVIEW
--------------------------------------------------------

CREATE OR REPLACE VIEW "III_TEAM_DBA"."TRAVEL_SET_HOTELVIEW" ("SN", "NAME", "ADDRESS", "DOUBLEROOMPRICE", "QUADRUPLEROOMPRICE", "RATING", "DESCRIPTION", "REGION", pic, "STATUS") AS
select SN, NAME, ADDRESS, DOUBLE_ROOM as doubleRoomPrice, QUADRUPLE_ROOM as quadrupleRoomPrice, RATING, DESCRIPTION, REGION, PIC,
       (case STATUS when '啟用' then 1 when '禁用' then 0 end)as status
from HOTEL
;
--------------------------------------------------------
--  DDL for View TRAVEL_SET_RESTAURANTVIEW
--------------------------------------------------------

CREATE OR REPLACE VIEW "III_TEAM_DBA"."TRAVEL_SET_RESTAURANTVIEW" ("SN", "NAME", "TYPE", "ADDRESS", "DESCRIPTION", "RATING", "REGION", pic, "STATUS") AS
select R_SN as sn, NAME, TYPE, ADDRESS, DESCRIPTION, RATING, REGION, pic, (case STATUS when 'Y' then 1 when 'N' then 0 end)as status from RESTAURANT
;
--------------------------------------------------------
--  DDL for View TRAVEL_SET_VIEW
--------------------------------------------------------

CREATE OR REPLACE VIEW "III_TEAM_DBA"."TRAVEL_SET_VIEW" ("SN", "CREATED_USER", "IDENTITY", "NAME", "DESCRIPTION", "CREATED_TIME", "UPDATE_TIME", "PRIORITY", "STATUS") AS
select t.SN , t.CREATED , a.IDENTITY ,
       t.NAME , t.description , t.CREATED_TIME , t.UPDATE_TIME , PRIORITY, AVAILABLE
from TRAVEL_SET t, ACCOUNT a
where t.CREATED=a.USERNAME
;
