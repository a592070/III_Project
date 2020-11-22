--------------------------------------------------------
--  已建立檔案 - 星期二-十一月-17-2020   
--------------------------------------------------------
DROP SEQUENCE "COMID_SEQUENCE";
DROP SEQUENCE "ARTID_SEQUENCE";
DROP TABLE "F_MULTI_COM";
DROP TABLE "F_COMMENT";
DROP TABLE "F_ART_TYPE";
DROP TABLE "F_ARTICLE";
DROP VIEW "SHOW_RVIEW";
--------------------------------------------------------
--  DDL for Sequence COMID_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "COMID_SEQUENCE"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 121 CACHE 20 ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ARTID_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "ARTID_SEQUENCE"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 181 CACHE 20 ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table F_MULTI_COM
--------------------------------------------------------

  CREATE TABLE "F_MULTI_COM" 
   (	"MULTI_COM_COM_ID" NUMBER, 
	"MULTI_COM_USER_ID" VARCHAR2(255 BYTE), 
	"MULTI_COM_DATE" TIMESTAMP (6), 
	"MULTI_COM_CONTENT" VARCHAR2(255 BYTE), 
	"MULTI_COM_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE 
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table F_COMMENT
--------------------------------------------------------

  CREATE TABLE "F_COMMENT" 
   (	"COM_ID" NUMBER, 
	"COM_CONTENT" VARCHAR2(255 BYTE), 
	"COM_ART_ID" NUMBER, 
	"COM_USER_ID" VARCHAR2(255 BYTE), 
	"COM_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table F_ART_TYPE
--------------------------------------------------------

  CREATE TABLE "F_ART_TYPE" 
   (	"TYPE_ID" NUMBER(*,0), 
	"TYPE_NAME" VARCHAR2(225 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table F_ARTICLE
--------------------------------------------------------

  CREATE TABLE "F_ARTICLE" 
   (	"ART_CONTENT" CLOB, 
	"ART_CRE_TIME" DATE, 
	"ART_USERID" VARCHAR2(255 BYTE), 
	"ART_COMM_NUM" NUMBER(*,0), 
	"ART_VIEW" NUMBER(*,0), 
	"ART_ID" NUMBER(*,0), 
	"ART_TYPE_ID" NUMBER, 
	"ART_TITLE" VARCHAR2(255 BYTE), 
	"ART_PIC" BLOB, 
	"ART_PIC_URL" VARCHAR2(255 BYTE), 
	"ART_STATUS" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("ART_CONTENT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("ART_PIC") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "F_ARTICLE"."ART_CRE_TIME" IS '建立時間';
   COMMENT ON COLUMN "F_ARTICLE"."ART_COMM_NUM" IS '評論數';
   COMMENT ON COLUMN "F_ARTICLE"."ART_VIEW" IS '文章觀看數';
   COMMENT ON COLUMN "F_ARTICLE"."ART_TYPE_ID" IS '文章分類';
--------------------------------------------------------
--  DDL for View SHOW_RVIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "SHOW_RVIEW" ("R_SN", "NAME", "ADDRESS", "REGION", "USERNAME", "STATUS") AS 
  select R_SN, NAME, ADDRESS, REGION, USERNAME, STATUS from RESTAURANT
;
REM INSERTING into F_MULTI_COM
SET DEFINE OFF;
REM INSERTING into F_COMMENT
SET DEFINE OFF;
REM INSERTING into F_ART_TYPE
SET DEFINE OFF;
Insert into F_ART_TYPE (TYPE_ID,TYPE_NAME) values (1,'旅遊');
Insert into F_ART_TYPE (TYPE_ID,TYPE_NAME) values (2,'住宿');
Insert into F_ART_TYPE (TYPE_ID,TYPE_NAME) values (3,'美食');
Insert into F_ART_TYPE (TYPE_ID,TYPE_NAME) values (5,'交通');
Insert into F_ART_TYPE (TYPE_ID,TYPE_NAME) values (6,'行程');
Insert into F_ART_TYPE (TYPE_ID,TYPE_NAME) values (7,'購物');
Insert into F_ART_TYPE (TYPE_ID,TYPE_NAME) values (0,'其他');
Insert into F_ART_TYPE (TYPE_ID,TYPE_NAME) values (4,'景點');
REM INSERTING into F_ARTICLE
SET DEFINE OFF;
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('09-11月-20','DD-MON-RR'),'zxc456',0,0,41,1,'到台北畢業旅行一個月，30k台幣夠嗎？',null,'disabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('18-11月-20','DD-MON-RR'),'hahaball123',0,0,42,2,'請推薦九份住宿2',null,'disabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('18-11月-20','DD-MON-RR'),'eesther',0,0,43,1,'初遊台中感想+注意事項',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('27-11月-20','DD-MON-RR'),'missu123',0,0,44,3,'[宜蘭旅遊] 烏石港美食,在地人都推薦的幸福36海鮮餐廳二館',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('09-11月-20','DD-MON-RR'),'abc123',0,0,45,1,'東北角吃海鮮、看海景好去處，推薦小漁村海產店 2',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'whiteclound1010',0,0,108,1,'桃園龜山大棟山縱走 (大棟山-青龍嶺)',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'hwsln',0,0,109,1,'八德水岸風華：西坡埤塘生態公園~~',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'fluorite',0,0,110,4,'大溪 金興觀光蘭園',null,'disabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'biiu80321948',0,0,111,1,'桃園旅遊地圖景點大公開 桃園西邊玩 – 戶外最健康 ~ 馬祖新村眷村文創園區',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'biiu80321948',0,0,112,1,'桃園旅遊地圖景點大公開 桃園北邊玩–戶外最健康 ~五酒桶山步道',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'breeze1024',0,0,113,4,'2020桃園地景藝術節 作品精選 看展攻略',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'cvqst83k',0,0,114,2,'親子飯店推薦。桃園大溪笠復威斯汀度假酒店。超夢幻游泳池',null,'disabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'libaoer1556',0,0,115,3,'大業國小附近的美食',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'art440022',0,0,116,1,'桃園之旅 2020.08.22 桃園市旅遊筆記，東、南、西、北邊100個景點…',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'biiu80321948',0,0,117,1,'桃園旅遊地圖景點大公開 桃園北邊玩–戶外最健康 ~外社輕便車站',null,'disabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'biiu80321948',0,0,118,1,'桃園旅遊地圖景點大公開 桃園北邊玩 –懷舊風情 ~新屋范姜祖堂',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'austin8win',0,0,107,2,'桃園大溪笠復威斯汀度假酒店體驗分享',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'oldwagon4096',0,0,119,1,'請問，有成年人可以使用的普通版TR PASS嗎?',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'biiu80321948',0,0,120,1,'桃園旅遊地圖景點大公開 桃園北邊玩 –戶外最健康 ~國防砲陣地運動公園',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'biiu80321948',0,0,121,1,'桃園旅遊地圖景點大公開 桃園南邊玩 –戶外最健康 ~樂信瓦旦紀念公園',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'jumpnbjandsherry',0,0,122,4,'桃園竹圍海岸線一日遊！許厝港濕地・豬鼻子沙灘・竹圍漁港',null,'disabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'biiu80321948',0,0,123,1,'桃園旅遊地圖景點大公開 桃園南邊玩 –戶外最健康 ~羅浮溫泉',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'biiu80321948',0,0,124,1,'桃園旅遊地圖景點大公開 桃園南邊玩 –戶外最健康 ~義興吊橋',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'biiu80321948',0,0,125,1,'桃園旅遊地圖景點大公開 桃園南邊玩 – 戶外最健康 ~ 新溪口吊橋',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'austin8win',0,0,126,2,'COZZI Blu 和逸飯店．桃園館 舒適客房與和逸客房 搶先體驗',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'biiu80321948',0,0,127,1,'桃園旅遊地圖景點大公開 桃園東邊玩 –校園風情 ~國立體育大學',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'biiu80321948',0,0,128,1,'桃園旅遊地圖景點大公開 桃園西邊玩 – 祈福保平安 ~中壢仁海宮~',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'biiu80321948',0,0,129,1,'桃園旅遊地圖景點大公開 桃園西邊玩 –戶外最健康 ~龍岡森林公園',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'biiu80321948',0,0,130,1,'桃園旅遊地圖景點大公開 桃園東邊玩 – 祈福保平安 ~壽山巖觀音寺',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'biiu80321948',0,0,131,1,'桃園旅遊地圖景點大公開 桃園東邊玩 – 戶外最健康 ~楓樹坑',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'biiu80321948',0,0,132,1,'桃園旅遊地圖景點大公開 桃園西邊玩 – 購物樂 ~ 華泰名品城',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'biiu80321948',0,0,133,1,'桃園旅遊地圖景點大公開 桃園西邊玩 – 走入校園風情 ~ 中央大學',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'biiu80321948',0,0,134,1,'桃園旅遊地圖景點大公開 桃園西邊玩 – 戶外最健康 ~ 壢小故事森林',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'EstelaLeeeeee',0,0,135,3,'桃園餐廳推薦 舒適清幽的鄉村風格咖啡屋–小弘曆咖啡屋',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'biiu80321948',0,0,136,1,'桃園旅遊地圖景點大公開 桃園西邊玩 – 最佳閱讀好去處 ~ 龍岡圖書館',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'DJLIU',0,0,141,5,'台南租機車',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'bonhear',0,0,143,5,'台南火車站租機車推薦',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'missutrip',0,0,144,2,'[台南旅行] 舒適氣派 交流道旁 機能便利 -台南麗新大酒店-missutrip',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'littleyeejoy',0,0,145,4,'台南烏樹林糖廠',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'shtsui',0,0,146,4,'值得去的台南文創市集/景點',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'MinakoTseng',0,0,147,2,'與書香共眠。台南文青背包客棧：艸祭book inn',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'vegeta',0,0,148,0,'今年的國慶煙火在台南安平',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'cargod0204',0,0,149,1,'探索古老鹽田 欣賞醉人黃昏',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'kch0511',0,0,150,4,'[我的足跡]2016年9月16日-台南十鼓仁糖文創園區',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'edcat',0,0,151,1,'台南秘境 台南鬼子山/警察局鎮守的風水森林 與 文創社區',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'yuu0416',0,0,154,5,'台南停車',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'missutrip',0,0,152,1,'[台南旅遊] 台南四大月老廟-月老賜條紅線吧 (農曆七月可以拜嗎?五大禁忌) -missutrip',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'sodasky',0,0,153,2,'台南10間高cp值住宿整理',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'richlin914',0,0,155,6,'請問大台南兩週的行程安排',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'kas88',0,0,156,6,'兩個女生第一次台南3天兩夜',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'sodasky',0,0,157,2,'U.I.J HOTEL & HOSTEL 友愛街旅館',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'smellonesmell',0,0,158,6,'熱血騎車環半島',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'hellostar',0,0,159,2,'無印風台南民宿推薦！美食走得到｜重點是不貴 還有貓陪宿',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'edcat',0,0,160,1,'台南 左鎮化石館新活動:360度環景電影與巨齒鯊',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'green26',0,0,161,4,'台南阿勃勒現況一問？',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'tiger222',0,0,162,6,'6/19~6/21台南高雄三天兩夜',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'edcat',0,0,163,1,'湖邊黃金的阿勃勒 與 鳳凰木/新化 虎頭埤 阿勃勒花季',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'onehair123',0,0,165,3,'市區美食 | 豆弄．手作_狗狗造型早午餐✈MONI大口吃台南',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'onehair123',0,0,166,3,'MONI大口吃台南✈新營美食 | 甜點很厲害的卡布里義廚capri pasta',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'edcat',0,0,167,1,'鳳凰木 與 蓮花 的相遇/ 台南夏天賞花',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'art440022',0,0,168,4,'景點2020.05.19 台南台灣好行88府城巡迴線，赤崁樓…',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'art440022',0,0,169,4,'景點2020.05.17 台南台灣好行99安平台江線，台南公園-四草-七股鹽山，一站之旅…',null,'enabled');
Insert into F_ARTICLE (ART_CRE_TIME,ART_USERID,ART_COMM_NUM,ART_VIEW,ART_ID,ART_TYPE_ID,ART_TITLE,ART_PIC_URL,ART_STATUS) values (to_date('13-11月-20','DD-MON-RR'),'Emily0219',0,0,170,1,'台南關子嶺雞籠山-親子登山步道',null,'enabled');
--------------------------------------------------------
--  DDL for Index ARTICLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ARTICLE_PK" ON "F_ARTICLE" ("ART_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index F_ART_TYPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "F_ART_TYPE_PK" ON "F_ART_TYPE" ("TYPE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index F_COMMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "F_COMMENT_PK" ON "F_COMMENT" ("COM_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index F_MULTI_COM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "F_MULTI_COM_PK" ON "F_MULTI_COM" ("MULTI_COM_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index F_MULTI_COM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "F_MULTI_COM_PK" ON "F_MULTI_COM" ("MULTI_COM_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index F_COMMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "F_COMMENT_PK" ON "F_COMMENT" ("COM_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index F_ART_TYPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "F_ART_TYPE_PK" ON "F_ART_TYPE" ("TYPE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ARTICLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ARTICLE_PK" ON "F_ARTICLE" ("ART_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger COMMENT_TRIGGER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "COMMENT_TRIGGER" 
   before insert on "F_COMMENT" 
   for each row 
begin  
   if inserting then 
      if :NEW."COM_ID" is null then 
         select COMID_SEQUENCE.nextval into :NEW."COM_ID" from dual; 
      end if; 
   end if; 
end;

/
ALTER TRIGGER "COMMENT_TRIGGER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ART_ID_TRIGGER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ART_ID_TRIGGER" 
   before insert on "F_ARTICLE" 
   for each row 
begin  
   if inserting then 
      if :NEW."ART_ID" is null then 
         select ARTID_SEQUENCE.nextval into :NEW."ART_ID" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "ART_ID_TRIGGER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger COMMENT_TRIGGER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "COMMENT_TRIGGER" 
   before insert on "F_COMMENT" 
   for each row 
begin  
   if inserting then 
      if :NEW."COM_ID" is null then 
         select COMID_SEQUENCE.nextval into :NEW."COM_ID" from dual; 
      end if; 
   end if; 
end;

/
ALTER TRIGGER "COMMENT_TRIGGER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ART_ID_TRIGGER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ART_ID_TRIGGER" 
   before insert on "F_ARTICLE" 
   for each row 
begin  
   if inserting then 
      if :NEW."ART_ID" is null then 
         select ARTID_SEQUENCE.nextval into :NEW."ART_ID" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "ART_ID_TRIGGER" ENABLE;
--------------------------------------------------------
--  Constraints for Table F_MULTI_COM
--------------------------------------------------------

  ALTER TABLE "F_MULTI_COM" MODIFY ("MULTI_COM_ID" NOT NULL ENABLE);
  ALTER TABLE "F_MULTI_COM" MODIFY ("MULTI_COM_COM_ID" NOT NULL ENABLE);
  ALTER TABLE "F_MULTI_COM" MODIFY ("MULTI_COM_USER_ID" NOT NULL ENABLE);
  ALTER TABLE "F_MULTI_COM" MODIFY ("MULTI_COM_DATE" NOT NULL ENABLE);
  ALTER TABLE "F_MULTI_COM" MODIFY ("MULTI_COM_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "F_MULTI_COM" ADD CONSTRAINT "F_MULTI_COM_PK" PRIMARY KEY ("MULTI_COM_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table F_COMMENT
--------------------------------------------------------

  ALTER TABLE "F_COMMENT" MODIFY ("COM_ART_ID" NOT NULL ENABLE);
  ALTER TABLE "F_COMMENT" MODIFY ("COM_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "F_COMMENT" MODIFY ("COM_USER_ID" NOT NULL ENABLE);
  ALTER TABLE "F_COMMENT" MODIFY ("COM_DATE" NOT NULL ENABLE);
  ALTER TABLE "F_COMMENT" MODIFY ("COM_ID" NOT NULL ENABLE);
  ALTER TABLE "F_COMMENT" ADD CONSTRAINT "F_COMMENT_PK" PRIMARY KEY ("COM_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table F_ART_TYPE
--------------------------------------------------------

  ALTER TABLE "F_ART_TYPE" MODIFY ("TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "F_ART_TYPE" MODIFY ("TYPE_NAME" NOT NULL ENABLE);
  ALTER TABLE "F_ART_TYPE" ADD CONSTRAINT "F_ART_TYPE_PK" PRIMARY KEY ("TYPE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table F_ARTICLE
--------------------------------------------------------

  ALTER TABLE "F_ARTICLE" MODIFY ("ART_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "F_ARTICLE" MODIFY ("ART_CRE_TIME" NOT NULL ENABLE);
  ALTER TABLE "F_ARTICLE" MODIFY ("ART_USERID" NOT NULL ENABLE);
  ALTER TABLE "F_ARTICLE" MODIFY ("ART_ID" NOT NULL ENABLE);
  ALTER TABLE "F_ARTICLE" MODIFY ("ART_TITLE" NOT NULL ENABLE);
  ALTER TABLE "F_ARTICLE" ADD CONSTRAINT "ARTICLE_PK" PRIMARY KEY ("ART_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table F_MULTI_COM
--------------------------------------------------------

  ALTER TABLE "F_MULTI_COM" ADD CONSTRAINT "FK_MULTI_COM" FOREIGN KEY ("MULTI_COM_COM_ID")
	  REFERENCES "F_COMMENT" ("COM_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table F_COMMENT
--------------------------------------------------------

  ALTER TABLE "F_COMMENT" ADD CONSTRAINT "ART_ID" FOREIGN KEY ("COM_ART_ID")
	  REFERENCES "F_ARTICLE" ("ART_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table F_ARTICLE
--------------------------------------------------------

  ALTER TABLE "F_ARTICLE" ADD CONSTRAINT "TYPE_ID" FOREIGN KEY ("ART_TYPE_ID")
	  REFERENCES "F_ART_TYPE" ("TYPE_ID") ENABLE;
