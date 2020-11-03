--------------------------------------------------------
--  已建立檔案 - 星期一-十一月-02-2020   version:03
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence RESTAURANT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "III_TEAM_DBA"."RESTAURANT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 162 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

--------------------------------------------------------
--  DDL for Table RESTAURANT
--------------------------------------------------------

  CREATE TABLE "III_TEAM_DBA"."RESTAURANT" 
   (	"R_SN" NUMBER, 
	"NAME" VARCHAR2(255 BYTE), 
	"ADDRESS" VARCHAR2(255 BYTE), 
	"OPENTIME" VARCHAR2(255 BYTE), 
	"DESCRIPTION" VARCHAR2(1024 BYTE), 
	"TRANSPORTATION" VARCHAR2(1024 BYTE), 
	"TYPE" VARCHAR2(255 BYTE), 
	"RATING" NUMBER(3,1), 
	"REGION" VARCHAR2(255 BYTE), 
	"PIC_URL" VARCHAR2(255 BYTE), 
	"SERVICEINFO" VARCHAR2(1024 BYTE), 
	"USERNAME" VARCHAR2(255 BYTE), 
	"TABLENUM" NUMBER DEFAULT 2, 
	"STATUS" VARCHAR2(20 BYTE), 
	"PIC" BLOB
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("PIC") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
REM INSERTING into III_TEAM_DBA.RESTAURANT
SET DEFINE OFF;
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (100,'KILI BAY 奇麗灣珍奶文化館','宜蘭縣蘇澳鎮頂寮里頂強路 23 號','[全天開放]
 週一 - 週五 09:30-17:30
 週六 - 週日 09:30-18:00','戶外座椅, 有免費停車場, Wi-Fi, 無障礙空間, 信用卡','★ 火車路線：蘇澳火車站下車--轉搭公車 1791 線（往國光客運羅東站）龍德工業區下車--步行約 9 分鐘抵達奇麗灣

★ 客運路線：羅東站下車--轉搭公車 1791 線（往岳明新村）龍德工業區--下車步行約9分鐘抵達奇麗灣

★ 開車路線：國道五號蘇澳交流道下--左轉馬賽路--左轉蘇濱路兩段右轉頂強路（龍德工業區自強路對面）--直行 500 公尺抵達奇麗灣 

★ 設有免費停車場','下午茶, 自助餐, 素食, 中式料理',3.9,'宜蘭','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R13297_EZTABLE_0605_26_d64970519e.png','浪漫約會, 商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (101,'慕拉西餐廳 - 花蓮煙波大飯店','花蓮縣花蓮市中美路142號','[早餐]
 週一 - 週日 06:30-10:00
[午餐]
 週一 - 週日 11:30-14:00
[晚餐]
 週一 - 週日 17:30-21:00','嚴選當季新鮮食材，以多元創意手法烹調，供應自助式早餐以及套餐式精緻午晚餐。設有140個座位區，以咖啡色木紋與純白牆面點綴海洋元素，自大廳延伸入內大片落地窗，為每道餐點打上自然光，呈現寬敞明亮的用餐環境。全新的中式料理，採現點現做手感快炒烹飪。餐點運用在地食材，主廚特製醬汁及大火爆香快炒，讓料理呈現最佳原味和口感，鹹香涮口。','➤ 台鐵：搭乘火車至「花蓮火車站」→計程車至煙波大飯店（車程約15分鐘）
➤ 自行開車：
【南下】台北往花蓮方向：蘇花公路→台九線→經花蓮機場→府前路→左轉中美路→抵達煙波花蓮館
【北上】高雄往花蓮方向：南迴公路→台九線→193線道→海岸路→民權五街左轉→中美路右轉→約100公尺即可抵達煙波花蓮館
➤ 停車資訊：B1-B2停車場','西式料理, 自助餐, 早午餐, 套餐, 餐酒館',4,'花蓮','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R15548_EZTABLE_0416_1_1a361a7225.png','浪漫約會, 商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐, 生日慶祝',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (102,'赫赫斯 Huhus Restaurant','花蓮縣花蓮市秀林鄉富世村9鄰民樂路5號','[午餐]
 週一 - 週日 11:00-14:00
[晚餐]
 週四 - 週二 18:00-20:00','赫赫斯取自於我們部落的名稱，『赫赫斯』是太魯閣族語，

中文是: 大禮部落的舊稱。 

我們是來自大禮部落的族人(太魯閣族)。 

「赫赫斯」意謂著在赫赫斯部落裡有著外婆對媽媽的懷念，

更有著我們對媽媽的印象與回憶。

《餐飲》

瑪格麗鹹豬肉、瑪格麗豬肋排、瑪格麗雞腿排、香煎瑪格麗香腸、香煎飛魚卵香腸

赫赫斯風味套餐

-野菜沙拉

-開胃小米酒

-柚香蓮藕

-香脆山豬皮

-炒梨山高麗菜

-紫米竹筒飯

-麵包果湯/野菜湯

-炸香蕉飯



部落好物

-幽谷辣椒

-野生瑪格麗

-德魯固小米酒','停車資訊：
路邊可停車

大眾運輸：
搭乘公車 #太魯閣站(徒步5分鐘)','亞洲料理, 台式料理, 下午茶, 套餐',4.2,'花蓮','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R14607_EZTABLE_0807_1_0a12f2016e.png','家庭聚餐, 朋友聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (103,'聚悅樓餐廳 - 花蓮力麗華美達安可酒店','花蓮縣花蓮市林森路33號','[午餐]
 週一 - 週日 11:30-13:30
[晚餐]
 週一 - 週日 17:30-20:30','適合青少年, 提供優質當地菜餚, 有付費停車場, 提供素食選項, Wi-Fi, 無障礙空間, 提供兒童座椅, 信用卡','免費地下室平面停車場','亞洲料理, 中式料理, 素食, 套餐',3.5,'花蓮','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R14159_EZTABLE_1030_1_32be916897.png','浪漫約會, 商業聚餐, 家庭聚餐, 朋友聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (104,'莫非鍋物','花蓮縣花蓮市建國路105號','[午餐]
 週一 - 週日 11:30-14:30
[晚餐]
 週一 - 週日 17:00-21:30','擁有超過100坪的寬敞空間，中餐晚餐兩時段營業時間，提供套餐式鍋物的餐飲服務，期許每位客人在我們餐廳都有享受的特別時間。
大部分牛肉商品產自美國Prime等級牛肉，特別推薦雪花牛肉，肥肉瘦肉層次分明，口感有層次，性價比極高，在推鮮嫩雞腿，選自軟嫩極致的台灣肉雞，再來是海鮮總匯，八種海鮮乘坐料理船出港，一次滿足饕客的嘴。','請以摩托車、騎車運輸方式為主，餐廳有數個免費停車位方便客人停放。','亞洲料理, 台式料理, 火鍋',4.3,'花蓮','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R14548_EZTABLE_0531_1_b333bb475b.png','浪漫約會, 商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐, 生日慶祝',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (105,'彩雲軒 - 日月潭雲品溫泉酒店','南投縣魚池鄉中正路23號','[午餐]
 週一 - 週日 11:00-12:30
 週一 - 週日 12:30-14:00
[晚餐]
 週一 - 週日 17:00-19:00
 週一 - 週日 19:30-21:30','Wi-Fi, 受當地人歡迎, 信用卡, 適合團體聚餐, 有免費停車場, 百貨商場停車場, 五星飯店','每日12:30可於臺中高鐵站搭乘高鐵免費接駁專車至雲品溫泉酒店','西式料理, 創意料理, 鐵板燒',3.3,'南投','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R599_EZTABLE_0715_1_3336125acf.png','浪漫約會, 家庭聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (106,'皇樓中餐廳- 義大皇家酒店','高雄市大樹區學城路一段153號','[午餐]
 週一 - 週日 11:30-14:30
[晚餐]
 週一 - 週日 17:30-21:30','正統廣東菜式，提供帝王饗宴。高雅氣氛，精饌美食，瞬間贏得您的讚賞。另設有四間獨立式包廂，滿足私人聚會獨立用餐空 間的需求。
靠近窗邊的區域 ,讓你能欣賞摩天輪的美景,用餐更加愉快,餐點更加好吃。','左營高鐵站搭乘義大客運直接前往義大世界即可','亞洲料理, 粵式料理, 點心',4,'高雄','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R2087-1.jpg','商業聚餐, 家庭聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (107,'漢來海港餐廳-巨蛋店 (漢神巨蛋 5F)','高雄市左營區博愛二路777號5樓','[午餐]
 週一 - 週日 11:30-14:00
[下午茶]
 週一 - 週日 14:30-16:30
[晚餐]
 週一 - 週日 17:30-21:30','有免費停車場, Wi-Fi, 無障礙空間, 提供兒童座椅, 信用卡, 提供優質當地菜餚, 提供酒精飲料','自高雄九如交流道下，沿九如路往高雄後火車站方向前進，至博愛路口右轉繼續直行，注意左側即可抵達漢神巨蛋。
有免費停車場
捷運高雄巨蛋站 5 號出口，步行約 5 分鐘','多國料理, 下午茶, 自助餐, 海鮮',3.8,'高雄','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R768_EZTABLE_0605_1_eec1cfa4b2.png','家庭聚餐, 朋友聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (108,'四川小灶','高雄市鼓山區南屏路585號','[全天開放]
 週一 - 週日 17:30-22:30','提供優質當地菜餚, 適合肉食愛好者, 提供宵夜晚食',null,'亞洲料理, 川菜, 單點式, 套餐',3.9,'高雄','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R14310_EZTABLE_0104_5_715f8900a0.png','浪漫約會, 商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐, 生日慶祝',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (109,'18F咖啡廳-長榮桂冠酒店(基隆)','基隆市中正區中正路62-1號18樓','[早餐]
 週一 - 週日 06:30-10:00
[午餐]
 週一 - 週日 11:30-14:00
[下午茶]
 週五 - 週日 14:30-17:00
[晚餐]
 週一 - 週日 17:30-21:00','Wi-Fi, 無障礙空間, 信用卡, 適合團體聚餐, 生日特別招待, 有免費停車場, 百貨商場停車場, 適合幼兒（七歲以下）','>大台北地區或西部地區可走中山高、北二高或台五線省道至基隆。
淡水地區可走台二線省道至基隆(陽金公路、淡金公路轉麥金公路)。
宜蘭或東部地區可走台二線省道或台102縣道至基隆。
>備有室內停車場
>公車信五路站下車，步行約5分鐘。"
基隆市區內公車於信五路站下車(對面為中華商業銀行)，過馬路即可到達飯店。
由基隆市政府沿北部濱海公路往田寮河方向直行，至信一路左轉即可抵達。','下午茶, 自助餐, 多國料理, 早午餐',4,'基隆','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R1296_EZTABLE_0605_1_dd298415a8.png','浪漫約會, 商業聚餐, 家庭聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (126,'太盛 - 彰化店','彰化縣彰化市金馬路二段321號B1','[全天開放]
 週一 - 週日 11:00-21:00','太盛たも屋烏龍麵
TAMOYA太盛烏龍麵創立於1996年，創辦人黑川保先生曾獲日本『電視冠軍』烏龍麵職人殊榮，20年來，極力追求完美極致的匠人精神，從製麵技藝到高湯、醬料、食材的選擇，無不講究細節與力求完美，就是要給顧客最道地、安心的好滋味！','於彰化家樂福內','日式料理, 亞洲料理, 單點式, 套餐',4.2,'彰化','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R15562_EZTABLE_0420_1_97f95cfe7a.png','商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (119,'盛宴自助餐廳 - 新竹喜來登大飯店','新竹縣竹北市光明六路東一段 265 號 2 樓','[早餐]
 週一 - 週日 06:00-10:00
[午餐]
 週六 - 週日 11:30-14:00
[下午茶]
 週一 - 週日 14:30-16:30
[晚餐]
 週五 - 週日 17:30-21:00','適合團體聚餐, 適合幼兒（七歲以下）, 生日特別招待, Wi-Fi, 無障礙空間, 信用卡, 五星飯店, Halal認證, 提供兒童座椅','1、	由國道一號 (中山高) 竹北/芎林交流道出口下之後往「芎林」方向，沿光明六路往新竹高鐵站方向直行至自強南路口，即可抵達新竹喜來登大飯店。
2、	由國道三號 (北二高) 於竹林交流道 (芎林/竹東) 出口下，轉往台 68 線東西向快速道路直行至往竹北方向下高架道路往自強南路行駛，直行至光明六路口後左轉即可抵達新竹喜來登大飯店。
3、	由新竹高鐵站出發，於出口至高鐵七路後左轉，光明六路東二段左轉並沿光明六路直行約 1.5 公里，即可抵達新竹喜來登大飯店。
新竹喜來登大飯店備有停車場

公車自強七街 (新竹喜來登飯店) 下車，步行約 3 分鐘','西式料理, 亞洲料理, 多國料理, 下午茶, 自助餐',3.5,'新竹','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R1658_EZTABLE_0511_4_f8621cf165.png','商業聚餐, 家庭聚餐, 朋友聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (120,'舞蔬弄果(竹北店)','新竹縣竹北市嘉豐南路一段80號','[全天開放]
 週一 - 週日 11:30-22:00','開創飲食生活的黃金比例。
這黃金比例 滿足口腹之慾 是好吃 是好玩 是健康
這黃金比例 響應熱愛地球 是城市 是綠化 是希望
都市叢林裡，緊張工作、忙碌人生，我們想要讓大家快樂過生活，『玩』就是『舞蔬弄果』的主題。舞蔬=五蔬，代表健康、代表鮮豔顏色。『舞蔬弄果』充滿生命力，是廚師做菜的創意，行雲流水，揮灑自如；是舞動自然、蔬活大地。

即日起凡來店用餐 當月壽星皆可獲得下列壽星專屬禮：
1. 當日壽星本人餐點 9 折。
2. 9 折優惠券壹張 (下次使用)。
3. 生日小蛋糕壹個 (每桌壹個)。



貼心提醒：
結帳出示本人身分證得享此優惠，且不與其他優惠同時併用。','高鐵新竹站1號出口，往嘉豐南路一段步行約10~15分鐘，即可到達。','素食, 西式料理, 創意料理',4.3,'新竹','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/1_2d25eb8374.jpg','浪漫約會, 家庭聚餐, 團體聚餐, 朋友聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (121,'宙斯果霸 - 嘉義中山店','嘉義市東區中山路141號','[全天開放]
 週二 - 週四 10:00-22:00
 週五,  10:00-00:00
 週六 09:00-00:00
 週日 09:00-22:00','台灣地處亞熱帶與熱帶地區，氣候溫和，雨量充沛，非常適合各類水果的栽培，四季皆產水果，是個名符其實的水果王國。宙斯果霸為發跡自台灣的連鎖飲料品牌，希望承接水果王國之名，講求使用真材實料的繽紛水果飲品，帶給消費者健康與快樂！
我們期望以稱霸市面飲品的特殊口味、霸氣的水果用料，讓消費者在忙碌繁雜的日常生活中，無論身體或心靈都能「 呷霸 」獲得療癒！','近東門圓環','下午茶',3.3,'嘉義','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R15145_EZTABLE_1231_1_3dfeca6840.png','浪漫約會, 朋友聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (122,'元町家橫濱家系拉麵','嘉義市東區忠孝路600號B1','[全天開放]
 週一 - 週日 11:00-21:00','源自1974年於日本橫濱發跡的家系拉麵，在全日本多達50多種拉麵派系當中，以鮮明的特色脫穎而出，堅持採用中粗直麵、秘製叉燒佐以醬油味豚骨湯頭，再添上海苔與不可或缺的鮮嫩菠菜，成就了一碗令人垂涎的橫濱家系拉麵。','嘉北火車站步行約10分
耐斯廣場時尚百貨B1','亞洲料理, 日式料理, 拉麵, 單點式, 套餐',4,'嘉義','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R15584_EZTABLE_0421_1_73e6daeee7.png','浪漫約會, 商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐, 生日慶祝',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (123,'牛角日本燒肉 - 嘉義耐斯店','嘉義市東區忠孝路600號B1','[全天開放]
 週一 - 週五 11:00-15:00
 週六 - 週日 11:00-22:00
 週一 - 週五 17:00-22:00','適合青少年, 受大學生歡迎, 適合肉食愛好者, 提供優質甜點, 提供優質啤酒選項, 提供酒精飲料, 信用卡','嘉北火車站步行約10分','亞洲料理, 日式料理, 燒烤',3.8,'嘉義','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R15575_EZTABLE_0421_1_a27ad2729d.png','浪漫約會, 商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐, 生日慶祝',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (64,'漢來軒 - 台中店',null,'[午餐]
 週一 - 週五 11:30-14:00
 週六 - 週日 11:00-14:30
[晚餐]
 週一 - 週日 17:00-21:00','提供私人包廂, 百貨商場停車場, 無障礙空間, 提供兒童座椅, 信用卡',null,'亞洲料理, 中式料理',3.9,'台中','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R14135_EZTABLE_0904_1_34cb589ba1.png',null,null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (110,'19F無敵海景咖啡廳-長榮桂冠酒店(基隆)','基隆市中正區中正路62-1號19樓','[早餐]
 週一 - 週日 06:30-10:00
[午餐]
 週一 - 週日 11:30-14:00
[下午茶]
 週五 - 週日 14:30-17:00
[晚餐]
 週一 - 週日 17:30-21:00','Wi-Fi, 無障礙空間, 信用卡, 適合團體聚餐, 適合幼兒（七歲以下）, 生日特別招待, 提供私人包廂, 有免費停車場, 百貨商場停車場','基隆市區內公車於信五路站下車(對面為中華商業銀行)，過馬路即可到達飯店。','下午茶, 創意料理, 多國料理',4,'基隆','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R1297_EZTABLE_0605_1_a07b70bad2.png','浪漫約會, 商業聚餐, 家庭聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (111,'小蒙牛頂級麻辣養生鍋 - 基隆店','基隆市中正區信一路 177 號 32 樓','[午餐]
 週一 - 週五 11:30-14:00
[晚餐]
 週一 - 週五 17:30-21:00
[全天開放]
 週六 - 週日 11:30-21:00','信用卡, 百貨商場停車場, 適合青少年, 受大學生歡迎, 適合肉食愛好者, 提供兒童座椅','由基隆市政府沿北部濱海公路往田寮河方向直行，至信一路左轉即可抵達。','亞洲料理, 火鍋, 海鮮, 麻辣火鍋, 蒙古料理',4.2,'基隆','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R1821_EZTABLE_0716_1_339d079890.png','朋友聚餐, 家庭聚餐, 浪漫約會, 商業聚餐, 團體聚餐, 生日慶祝',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (112,'JA火鍋','新北市板橋區文化路一段188巷11號','[午餐]
 週二 - 週五 11:30-15:00
[晚餐]
 週二 - 週五 17:00-22:00
[全天開放]
 週六 - 週日 11:30-22:00','提供優質當地菜餚, 提供健康食物, 適合肉食愛好者, 受大學生歡迎','➤ 捷運新埔站2號出口，步行五分鐘即可抵達
➤ 停車資訊:1.文化路一段介壽街口(星巴克旁田明文化大樓地下停車場) 2.致理商專正門旁，福利站停車場','亞洲料理, 日式料理, 火鍋, 單點式',3.5,'新北','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R15188_EZTABLE_0219_1_c98ffdd9ee.png','浪漫約會, 商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐, 生日慶祝',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (113,'蒸翻天海鮮蒸氣火鍋','新北市林口區仁愛路二段155號','[午餐]
 週一 - 週日 11:00-14:00
[晚餐]
 週一 - 週日 17:00-22:00','提供優質當地菜餚, 適合肉食愛好者, 提供健康食物',null,'亞洲料理, 中式料理, 海鮮, 火鍋',4.3,'新北','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R14651_EZTABLE_0930_1_602b6d4d27.png','商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (114,'鹿野桂花雞','新北市林口區文化一路二段190號','[午餐]
 週四 - 週二 11:30-14:30
[晚餐]
 週四 - 週二 17:00-23:00','林口十二年老店全新打造
標榜創意料理與另類火鍋','搭乘捷運至台北車站
轉乘1210公車至仁愛東湖路口站
步行約10分鐘','亞洲料理, 火鍋, 台式料理',3.3,'新北','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R15116_EZTABLE_1219_1_098373a5c0.png','家庭聚餐, 團體聚餐, 朋友聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (115,'老四川-新北林口店','新北市林口區文化三路一段125號1、2樓','[全天開放]
 週一 - 週日 11:30-01:30','適合幼兒（七歲以下）, 適合青少年, 提供優質當地菜餚, 提供優質點心、下酒菜, 適合肉食愛好者, 提供優質甜點, 提供優質啤酒選項, 提供宵夜晚食, 提供酒精飲料, 提供素食選項, Wi-Fi, 提供兒童座椅, 信用卡',null,'亞洲料理, 中式料理, 台式料理, 川菜, 火鍋, 麻辣火鍋',4,'新北','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R14297_EZTABLE_0730_1_7704775e17.png','浪漫約會, 商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐, 生日慶祝',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (116,'J.E 創作廚坊','新北市新莊區復興路一段109號','[全天開放]
 週二 - 週五 12:30-21:00
 週六 - 週日 12:30-20:30','輕食主義早午餐、咖啡
道地作法的義大利麵及燉飯
~不定時隱藏版限定餐點~
純手工新鮮製作、創意甜點
皆為主廚嚴選新鮮食材
提供舒適及放鬆的用餐環境','臨近新莊運動公園 棒球場，停車便利','多國料理, 西式料理, 義大利料理, 早午餐, 義大利麵, 咖啡館',3.8,'新北','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R14704_EZTABLE_0812_1_1a105de423.png','團體聚餐, 朋友聚餐, 家庭聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (117,'城咖牛排啤酒餐廳','新竹市北區武陵路22號','[晚餐]
 週二 - 週日 17:00-00:00
[全天開放]
 週六 - 週日 14:00-00:00','適合青少年, 受大學生歡迎, 提供優質當地菜餚, 適合肉食愛好者, 提供優質啤酒選項, 提供酒精飲料, 信用卡','新竹火車站搭乘藍15，於國軍新竹地區醫院下車步行1分鐘','西式料理, 美式料理, 義大利料理, 下午茶, 早午餐, 牛排, 漢堡, 比薩, 咖啡館',3.9,'新竹','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R14716_EZTABLE_1030_6_10177bec5e.png','生日慶祝, 朋友聚餐, 團體聚餐, 家庭聚餐, 浪漫約會',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (118,'饗食天堂 - 新竹大遠百店','新竹市東區西大路323號（新竹大遠百9F)','[午餐]
 週一 - 週日 11:30-14:00
[下午茶]
 週一 - 週日 14:30-16:30
[晚餐]
 週一 - 週日 17:30-21:30','信用卡','搭遠百接駁車
地點：台灣銀行(林森路)、麥當勞(中正路)、美乃斯(中正路及中央路交接口)、新竹一信(中山路及中正路交接口)
搭公車10路、11路、11甲路至西門市場站，步行約5分鐘。','多國料理, 自助餐',4,'新竹','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R15233_EZTABLE_0321_1_aa30125b1f.png','商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (124,'阿杜皇家泰式料理（員林旗艦店）','彰化縣員林市大同路二段 131 號','[午餐]
 週一 - 週五 11:00-14:30
[晚餐]
 週一 - 週五 17:00-22:00','戶外座椅, Wi-Fi, 信用卡, 提供兒童座椅',null,'亞洲料理, 泰式料理, 單點式, 套餐',4.2,'彰化','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R12720_EZTABLE_0130_2_a637d67eb9.png','商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (125,'牧館牛排 - 鹿港澄悅商旅 JOY INN','彰化縣鹿港鎮埔崙里中正路510巷1號','[午餐]
 週六 - 週日 11:30-14:00
[晚餐]
 週六 - 週日 17:30-22:00
 週一 - 週五 17:30-22:00','以古色古香、樹映盎然的詮釋鹿港風格為印象，並獨創出據有特色頂級異國料理，享受各國界美食新體驗，徜徉在牧館的多樣Buffet與頂級排餐中度過美好的餐宴時光。','南下：國道一號彰化交流道下 →右轉142號縣道彰鹿路直行8.4公里→中正路口右轉後直行1.6公里→澄悅商旅(星巴克正後方)
北上：國道一號埔鹽系統交流道下 →東西向快速道路(台76線)→青雲路→左轉彰鹿路(142縣道)→中正路→澄悅商旅(星巴克正後方)','西式料理, 亞洲料理, 牛排, 自助餐, 豬排, 美式料理, 日式料理, 中式料理, 台式料理',3.5,'彰化','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R14526_EZTABLE_0517_1_2f2d146358.png',null,null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (65,'TF 想食廚房','台中市西區明義街 81 號','[午餐]
 週三 - 週一 11:30-14:30
[晚餐]
 週三 - 週一 18:00-21:30','戶外座椅, 提供優質當地菜餚, 提供優質點心、下酒菜, 生日特別招待, 適合青少年, 受大學生歡迎, 提供優質甜點, 提供優質啤酒選項, 提供酒精飲料, 適合商務談話, 受當地人歡迎, 適合肉食愛好者','公車：搭乘 BRT 於忠明國小站下車後朝忠明南路，忠明加油站的方向前進，TF 想食廚房就位於 7-11 對面的明義街','義大利料理, 多國料理, 西式料理',3.3,'台中','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R13574_EZTABLE_1222_1_0915a7e63d.png','浪漫約會, 家庭聚餐, 團體聚餐, 朋友聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (66,'Yame叻南洋風味火鍋','台北市萬華區中華路一段76巷11號',null,'地點鄰近捷運北門站、西門町商圈，交通非常便利！專營獨特南洋風味火鍋，從食材的挑選、湯底的烹調、擺盤的呈現，極致追求每個細節上的處理，依據當季海鮮搭配應景食材，完美呈現海陸珍饌，更蘊藏了濃濃的馬來西亞風情！入店用餐可以享用飲品、品牌低脂冰淇淋吃到飽，一切隨心情享用，相當適合與家人、好友一同共享的優質餐廳，推薦給您！','台北車站步行約1.2公尺','火鍋, 東南亞料理',4,'台北','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R14725_EZTABLE_0813_1_e0cd95b2a4.png','浪漫約會, 商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐, 生日慶祝',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (67,'THE CHEFF大茶飯香港快餐','台北市萬華區昆明街123號',null,'快．靚．正','捷運西門站步行450公尺','粵式料理',3.8,'台北','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R14835_EZTABLE_1014_1_449a1554de.png',null,null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (68,'上官木桶鍋 - 萬華旗艦店','台北市萬華區南寧路68號',null,'帶給顧客新鮮高品質的食材是我們的宗旨，
濃郁高湯絕不添加任何調味粉，使用大骨、甘蔗熬製48小時而成，
本店首創甜蜜痛風鍋、大胃王肉盤始祖 頂級和牛先驅！
想品嚐原汁原味的食材，歡迎來到上官木桶鍋-萬華旗艦店！','捷運龍山寺站步行約 400 公尺','中式料理, 火鍋, 單點式, 套餐, 亞洲料理',3.9,'台北','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R14850_EZTABLE_1001_1_e6f11cb0a5.png','商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (69,'小林英夫日本料理','台北市萬華區康定路120號',null,'小林英夫為數十年老店三十三間堂姊妹店品牌，為了讓更多人能品嚐精緻的日式料理，日籍老闆KOBAYASHI(小林英夫)改走平價超值路線，推出680元八品懷食套餐，不同於三十三間堂陳老大的高價極品美食取向，小林英夫提供精緻平價好吃又飽足的新式懷食料理。

歡迎您在浪漫的日式牡丹花氛圍及熱情小姑娘的貼心服務中享受午茶般的愜意時光。

超值單點菜色，也依季節，常態的推出各種70元~520元的平價精緻手工料理，秋冬小陶鍋已經準備開賣囉','西門捷運站六號出口，步行約12分鐘(直走成都路於康定路左轉)','日式料理, 壽司',4,'台北','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R14795_EZTABLE_0306_1_5a01bb679c.png','家庭聚餐, 朋友聚餐, 浪漫約會, 商業聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (70,'宮原眼科醉月樓','台中市中區中山路20號2樓','[午餐]
 週一 - 週五 11:30-14:30
 週六 - 週日 11:30-14:30
[下午茶]
 週一 - 週五 14:00-17:00
 週六 - 週日 14:30-17:00
[晚餐]
 週一 - 週五 17:00-20:30
 週六 - 週日 17:00-20:30','位於宮原眼科二樓',null,'亞洲料理, 中式料理, 單點式, 套餐',4.2,'台中','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R15681_EZTABLE_0717_1_bc22334d7f.png','浪漫約會, 商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐, 生日慶祝',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (71,'山鯨燒肉','台中市西屯區台灣大道300號','[午餐]
 週一 - 週五 11:30-14:00
 週六 - 週日 11:30-17:00
[晚餐]
 週六 - 週日 17:00-21:30
 週一 - 週五 17:30-21:30','適合肉食愛好者, 提供優質啤酒選項, 信用卡, 提供兒童座椅, 提供優質點心、下酒菜','【客運】

＊漢口山西路口：東南客運 67 

＊中清漢口路口：台中客運 6、9、33、101、108

    仁友客運 29 

    統聯客運 61

    巨業客運 6856

＊曉明女中：台中客運 115

【自行開車】

國道１號：於「大雅（中清）交流道」下，走中清路往台中市區方向，過文心路接大雅路，於漢口路左轉後，右側方向。','亞洲料理, 多國料理, 燒烤, 中式料理, 韓式料理, 創意料理, 牛排, 串燒',3.5,'台中','https://1.bp.blogspot.com/-JdnTarNbitQ/WhGKHp4tQNI/AAAAAAAAGuc/IQVPp8xw-YU0sXrjKoa-ZDJywf-LZUjfwCLcBGAs/s1600/_MG_411.jpg
','商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐','Iring29',2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (72,'Aqua水相餐廳','Aqua水相餐廳','[午餐]
 週一 - 週五 11:00-14:30
[晚餐]
 週一 - 週五 17:30-21:00
[全天開放]
 週六 - 週日 11:00-21:00','信用卡, Wi-Fi, 有免費停車場, 有付費停車場','開車：中山高台中交流道下，台灣大道往市區方向行駛，右轉惠中路五分鐘即可到達(位於僑園大飯店旁)
餐廳附有停車場 / 特約停車場

公車：1. 統聯 73路 中央健保局站下車，再由市政北一路步行約 3 分鐘抵達餐廳
2. 全航中央健保局站下車 (即為水相餐廳大門口)

停車資訊：
附近停車場或 市政府及附近的停車場依消費滿500元折抵停車20元，每台最多折抵現金40元','西式料理, 法國料理, 義大利料理, 下午茶, 義大利麵, 創意料理, 牛排, 比薩',4.3,'台中','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R2025_EZTABLE_0623_4_08d6ab3894.png','浪漫約會, 商業聚餐, 朋友聚餐, 生日慶祝, 團體聚餐, 家庭聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (73,'家宴中餐廳 - 凱達大飯店 3 樓 (萬華雙子星)','台北市萬華區艋舺大道167號',null,'家宴中餐廳設計概念融入古典細緻的窗花以及雲朵，氣宇不凡的雍容氣質，在濃鬱的古色古香氛圍中表露無遺，八間獨立貴賓包廂皆採用花名命名，以萬華區區花「白牡丹」作為延伸發想精雕細琢屬於家宴的經典時尚品味，透過專人包廂式服務滿足各式大小宴會需求、成為您或作東、開會的絕佳場所。
餐廳內另規劃雅致舒適的小吃區適合闔家歡聚。從食材挑選到調理製作，秉持著細膩創新的精神推出道道精彩的新潮滬粵料理，人氣招牌菜有蟹黃豆腐煲、家宴私房滷肉、蒜香牛菲力、紅酒醋松阪豬、無錫脆鱔等功夫名菜，融合新意與傳統美味。','捷運信息 : 龍山寺站2號出口，步行約3分鐘。

台鐵信息 : 台鐵萬華站，出站步行約1分鐘。

公車信息 : 搭乘1 / 201 / 205 / 231 / 234 / 242 / 264 / 265 / 49/ 601 / 62 / 624至龍山寺站下車，步行約5分鐘即可抵達飯店。搭乘667 / 956至萬華車站下車，步行約1分鐘即可抵達飯店。','亞洲料理, 中式料理, 粵式料理, 台式料理',3.5,'台北','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R14234_EZTABLE_1221_1_05d0e1da14.png','商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐, 生日慶祝','iii',2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (92,'小蒙牛頂級麻辣養生鍋 - 台南店','台南市安平區永華路二段349號','[午餐]
 週一 - 週日 11:30-14:30
[晚餐]
 週一 - 週日 18:00-22:00','信用卡, 百貨商場停車場, 適合青少年, 受大學生歡迎, 適合肉食愛好者, 提供兒童座椅',null,'亞洲料理, 火鍋, 海鮮, 麻辣火鍋, 蒙古料理',4.3,'台南','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R1822_EZTABLE_0716_1_414291ada8.png','朋友聚餐, 家庭聚餐, 團體聚餐, 浪漫約會, 商業聚餐, 生日慶祝',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (93,'轉角餐廳 Corner Steak House','台南市東區大學路 22 巷 12 號','[午餐]
 週一 - 週五 11:30-14:00
[晚餐]
 週一 - 週五 17:30-21:00
[全天開放]
 週六 - 週日 11:30-21:00','轉角餐廳創立於 1995 年，位於台南車站後車站出站後直走約 10 分鐘、成大學區僻靜的小巷中
簡單優雅的白色建築外觀搭配內部挑高的空間設計與潔淨明亮的開放式廚房、寬敞雅致的用餐環境與深受好評的料理，使得轉角餐廳成為台南商務人士與成大教師生最愛的用餐地點之一，更是公司行號、學校機關開會聚餐最適合的場所。轉角廚藝秉持著美食就是追求食物天然與原味的呈現，從其獲取均衡之營養，達到食饗養生之目的為精神。','台鐵台南車站後車站出站後直走約 10 分鐘路程','西式料理, 義大利料理, 牛排, 套餐, 海鮮, 法國料理',3.3,'台南','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R1850_EZTABLE_0528_1_864f5aad91.png','浪漫約會, 商業聚餐, 朋友聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (94,'遠東Café (10F) – 香格里拉台南遠東國際大飯店','台南市東區大學路西段 89 號','[午餐]
 週一 - 週日 11:30-14:00
[晚餐]
 週一 - 週日 17:30-22:00','引領時尚的自助餐廰，以開放式廚房提供新鮮現製的十大主題美食、及單點佳餚，無與倫比的餐飲娛樂享受，全天候迎賓。','可搭乘台鐵到台南火車站,後火車站出口 20M','多國料理, 自助餐',4,'台南','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R618_EZTABLE_0321_1_1ac534cba4.png','商業聚餐, 家庭聚餐, 朋友聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (95,'The Mezz 牛排龍蝦館 - 香格里拉台南遠東國際大飯店','台南市東區大學路西段 89 號 2 樓','[午餐]
 週一 - 週日 11:30-14:30
[晚餐]
 週一 - 週日 18:00-21:30','有付費停車場, Wi-Fi, 信用卡, 五星飯店','台南火車站附近，步行約 1 分鐘','西式料理, 創意料理, 酒吧, 牛排, 套餐',3.8,'台南','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/0_9920858203.png','浪漫約會, 商業聚餐, 家庭聚餐, 朋友聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (96,'舞饌日式料理 - 綠舞國際觀光飯店','宜蘭縣五結鄉五濱路二段459號','[晚餐]
 週二 - 週日 18:00-23:00','宜蘭綠舞國際觀光飯店 結合全台唯一的日式主題園區，不僅占地廣闊 設施齊備，舞饌日式料理 Odori-Cuisine吃的是無菜單日料，以經典和食．創意日式會席料理方式呈現，每道菜色以食材的原味並予以創新後為起點，加上主廚精湛廚藝詮釋，無論在經典的和食或是創意料理都完整表現日式精髓，特別在火候的掌握、宜蘭在地與當季食材的運用、及會席料理多款主食的講究，道道展現出和食的真實本味。','【臺北出發】
綠舞國際觀光飯店
● 由國道五號高速公路，於羅東（五結）交流道下，由迴轉道左轉傳藝路，經傳藝大橋至北部濱海公路（台二線），左轉後行駛約2公里，於大眾北路(大眾六路)左轉即可進入飯店。
● 由台二線濱海公路南下，約153公里處即可直接進入飯店。

綠舞日式主題園區
● 由國道五號高速公路，於羅東（五結）交流道下，由迴轉道左轉傳藝路，經傳藝大橋至北部濱海公路（台二線），左轉後行駛約2.7公里即可進入園區。
● 由台二線濱海公路南下，約153公里處即可直接進入園區。

【客運】
搭乘【葛瑪蘭】【首都】【國光】【大都會】至【羅東】轉運站或【宜蘭】轉運站 --- 搭乘勁好行市區客運或是計程車

【火車】
搭乘至【羅東】火車站--- 搭乘勁好行市區客運或是計程車','亞洲料理, 日式料理, 套餐',3.9,'宜蘭','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R14372_EZTABLE_0614_1_6d7c62bb00.png','浪漫約會, 商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐, 生日慶祝',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (97,'i-FRANCE Bistronomy愛法餐廳 (宜蘭人故事館)','宜蘭縣宜蘭市中山路二段426號','[午餐]
 週三 - 週日 11:30-14:30
[晚餐]
 週三 - 週日 18:00-21:00','提供優質當地菜餚, 提供優質甜點, 提供優質點心、下酒菜, 提供酒精飲料','宜蘭轉運站下車步行10分鐘；宜蘭火車站下車步行10分鐘','法國料理, 套餐',4,'宜蘭','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R14531_EZTABLE_0203_1_6011151921.png','浪漫約會, 商業聚餐, 家庭聚餐, 朋友聚餐, 生日慶祝',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (98,'Café Lounge 咖啡酒吧 - 宜蘭力麗威斯汀度假酒店','宜蘭縣員山鄉永同路三段268號','[AllDay]
 All week 11:00-23:00','Wi-Fi, 信用卡, 提供優質甜點, 無障礙空間, 提供兒童座椅, 五星飯店','宜蘭火車站或轉運站下車，搭乘計程車至酒店，大約10-15分鐘，收費約新台幣200元。','西式料理, 單點式, 下午茶, 點心, 酒吧, 咖啡館',4.2,'宜蘭','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R14540_EZTABLE_0531_1_089e83f10f.png','浪漫約會, 商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐, 生日慶祝',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (99,'雲天自助餐廳 - 礁溪老爺酒店','宜蘭縣礁溪鄉五峰路 69 號','[全天開放]
 週一 - 週五 17:30-21:00
 週六 - 週日 17:20-21:20
 週六 - 週日 11:30-14:00','提供優質當地菜餚, 有付費停車場, 提供素食選項, 無障礙空間, 信用卡, 外語服務, 五星飯店','*提供飯店停車場
*礁溪轉運站→礁溪老爺酒店
可轉乘礁溪老爺往返礁溪火車站&轉運站之接駁巴士，房客免費搭乘。 
*請於前2個小時預約 
*非房客每人每趟收費 NT100','西式料理, 亞洲料理, 多國料理, 美式料理, 中式料理, 創意料理, 台式料理, 自助餐',3.5,'宜蘭','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R13837_EZTABLE_0821_1_f3b5938c42.png','浪漫約會, 商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐, 生日慶祝',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (74,'萬象廳 無國界料理 - 日月行館國際溫泉觀光酒店 (日月潭)','南投縣魚池鄉水社村中興路139號','[下午茶]
 週一 - 週日 14:00-16:00
[晚餐]
 週一 - 週日 17:30-21:00','萬象料理廳為無國界料理，結合歐美及亞洲多國料理，結合台灣傳統在地小吃，配合時令及當季食材，運用不同料理手藝，與南投當地小農契作之鮮美材料，迎合不同需求，滿足不同味蕾。整片的落地窗，將日月潭的美景一覽無遺。','高鐵【台中烏日站】與客運
台中高鐵【烏日站】第 5 出口第 3 月台 → 南投客運、台灣好行【直達日月潭】
火車與客運
台中火車站 → 南投客運、台灣好行【直達日月潭】','下午茶, 多國料理',3.3,'南投','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R14427_EZTABLE_0411_4_0e705ba122.png','浪漫約會, 商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐, 生日慶祝',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (75,'Ken can - 日月潭雲品溫泉酒店','南投縣魚池鄉中正路23號','[午餐]
 週一 - 週日 11:30-14:00
[晚餐]
 週一 - 週日 17:30-21:00','戶外座椅, 無障礙空間, 信用卡, 有免費停車場, 百貨商場停車場, Wi-Fi, 適合團體聚餐, 五星飯店','每日12:30可於臺中高鐵站搭乘高鐵免費接駁專車至雲品溫泉酒店','台式料理, 亞洲料理, 中式料理, 粵式料理, 點心, 海鮮',4,'南投','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R600_EZTABLE_0715_1_454a7fad80.png','家庭聚餐, 朋友聚餐, 團體聚餐, 商業聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (76,'黑浮咖啡 (屏東東港加盟店)','屏東縣東港鎮光復路一段180號','[全天開放]
 週一 - 週五 11:00-21:00
 週六 - 週日 10:00-21:00','提供優質當地菜餚, 受當地人歡迎, Wi-Fi, 信用卡','公車新街站，步行約5分鐘','西式料理, 美式料理, 義大利料理, 下午茶, 義大利麵, 單點式, 套餐',3.8,'屏東','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R11281_EZTABLE_0622_1_7c7f2d1ee5.png','浪漫約會, 商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (77,'小蒙牛頂級麻辣養生鍋 - 屏東店','屏東縣屏東市公園路15號','[午餐]
 週一 - 週五 11:30-14:00
[晚餐]
 週一 - 週五 17:30-21:00
[全天開放]
 週六 - 週日 11:30-21:00','有付費停車場, 信用卡, 提供兒童座椅, 適合肉食愛好者, 適合青少年, 受大學生歡迎','公車英雄館站下車，步行約2分鐘','亞洲料理, 火鍋, 麻辣火鍋, 自助餐',3.9,'屏東','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R1933_EZTABLE_0710_1_cd8c8182f7.png','朋友聚餐, 家庭聚餐, 團體聚餐, 生日慶祝, 商業聚餐, 浪漫約會',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (78,'冒煙的喬美式墨西哥餐廳(墾丁大灣店)','屏東縣恆春鎮大灣路188號','[全天開放]
 週一 - 週日 11:00-22:00','提供優質點心、下酒菜, Wi-Fi, 無障礙空間, 信用卡, 提供酒精飲料','可搭乘屏東客運、墾丁列車於【墾丁大街站】下車，步行約5分鐘即可到墾丁大灣店。','西式料理, 美式料理, 墨西哥料理',4,'屏東','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R13954_EZTABLE_0930_1_e1995d9363.png','浪漫約會, 商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐, 生日慶祝',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (79,'初原壽司(苗栗馥藝金鬱金香酒店)','苗栗縣竹南鎮公園六街6號','[全天開放]
 週二 - 週日 11:40-14:00
 週二 - 週日 17:40-21:00','提供兒童座椅, 適合青少年, 提供素食選項, 適合肉食愛好者','竹南火車站東出口搭乘大眾運輸工具至公園六街或租用youbike騎至公園路即可','日式料理, 拉麵, 單點式, 串燒, 豬排',4.5,'苗栗','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R14707_EZTABLE_0815_2_3e7ecd6467.png','浪漫約會, 商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐, 生日慶祝',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (80,'趣吧(苗栗馥藝金鬱金香酒店)','苗栗縣竹南鎮公園路106號','[早餐]
 週一 - 週五 06:30-09:30
[早午餐]
 週六 - 週日 06:30-13:00','挑高的室內空間與窗外光線結合，襯托出高雅舒適的用餐環境。服務人員親切貼心又專業的服務，創造愉快悠閒的用餐氣氛，是苗栗鄉親餐敘的絕佳選擇。','飯店提供地下室停車場於B1、B2。飯店位置周邊皆可路邊停車，非常便利。
第二高速公路由北往南，請於香山交流道下，直行第二個路口左轉經台13甲線往竹南方向接永貞路，左轉公園路，車程約需10分鐘。','西式料理, 多國料理, 自助餐',3.3,'苗栗','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R14494_EZTABLE_0509_1_5e50d7d89c.png','浪漫約會, 商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐, 生日慶祝',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (81,'Le Vino 酒吧 (苗栗馥藝金鬱金香酒店)','苗栗縣竹南鎮公園路106號','[全天開放]
 週日 - 週四 11:00-21:00
 週五 - 週六 11:00-23:00','結合東方與西方複合元素，以黑白為基調，引用酒仙李白的酒詩，營造低調愜意氛圍，讓您與家人朋友享受夜晚的歡愉。','交通：第二高速公路由北往南，請於香山交流道下，直行第二個路口左轉經台13甲線往竹南方向接永貞路，左轉公園路，車程約需10分鐘。','西式料理, 酒吧, 單點式, 創意料理',4,'苗栗','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R14486_EZTABLE_0503_1_911c133e7a.png','浪漫約會, 商業聚餐, 朋友聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (82,'帕莎蒂娜法式餐廳','高雄市三民區河堤路298號','[午餐]
 週二 - 週日 11:30-14:00
[晚餐]
 週二 - 週日 18:00-22:30','代客泊車, 生日特別招待, 適合商務談話, 信用卡, 提供私人包廂, Wi-Fi, 提供優質甜點','愛河、河堤路畔，明誠二路與明哲路中間，長谷國家公園音樂廳大樓旁。','西式料理, 法國料理',3.8,'高雄','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/1_54cc38c5bd.png','浪漫約會, 家庭聚餐, 團體聚餐, 朋友聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (83,'牛角日本燒肉 - 義大店','高雄市大樹區學城路一段12號2樓','[午餐]
 週一 - 週五 12:00-15:00
[晚餐]
 週二 - 週五 17:00-21:00
[全天開放]
 週六 - 週日 11:00-22:00','適合青少年, 受大學生歡迎, 適合肉食愛好者, 提供優質甜點, 提供優質啤酒選項, 提供酒精飲料, 信用卡','1.台鐵(岡山/楠梓/新左營/鳳山站
2.高鐵左營站2號出口，至公車第3站牌
3.高捷高鐵左營1號出口，至公車第3站牌
以上轉搭義大客運：8501、8502、8503、8504、8505、8506','亞洲料理, 日式料理, 燒烤',3.9,'高雄','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R15580_EZTABLE_0421_1_a17cd1c3f9.png','浪漫約會, 商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐, 生日慶祝',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (84,'魔法咖哩 - 頭份店','苗栗縣頭份市中央路103號2樓','[全天開放]
 週一 - 週日 11:00-21:00','信用卡, 有免費停車場, 適合團體聚餐','高鐵：
由新竹站下車後轉乘計程車，車程約20分鐘至尚順育樂世界。

台鐵：
由竹南站下車後轉乘計程車或搭乘苗栗客運，車程約5分鐘至尚順育樂世界。

苗栗客運：
從台鐵竹南站上車到六合國小下車的路線有5802、5803、5804、5805、5806。
從頭份總站上車到六合國小下車的路線有5802、5803、5804、5806、5810、5823。

國光客運：
從台北站、板橋站上車到頭份民族站下車。','咖哩, 亞洲料理',4,'苗栗','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R5992_EZTABLE_0731_3_53a16ce855.png','家庭聚餐, 浪漫約會, 商業聚餐, 團體聚餐, 朋友聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (85,'小蒙牛頂級麻辣養生鍋 - 尚順廣場頭份店','苗栗縣頭份市和平路 188 號 2 樓','[全天開放]
 週一 - 週日 11:00-20:30','信用卡, 百貨商場停車場, 適合青少年, 受大學生歡迎, 適合肉食愛好者, 提供兒童座椅',null,'亞洲料理, 火鍋, 自助餐, 麻辣火鍋',4.5,'苗栗','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R4580_EZTABLE_0710_1_09a7dc3aab.png','家庭聚餐, 團體聚餐, 朋友聚餐, 生日慶祝, 商業聚餐, 浪漫約會',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (86,'福粵樓 - 桃園福容大飯店','桃園市桃園區大興西路一段200號','[午餐]
 週一 - 週日 11:30-14:00
[晚餐]
 週一 - 週日 17:30-21:00','Wi-Fi, 無障礙空間, 提供素食選項, 提供酒精飲料, 提供兒童座椅','➤ 於桃園火車站附近統領百貨站搭成151公車至慈文國中站下車步行5分鐘、搭乘152公車至大興新埔六街口站步行2分鐘即可抵達
➤ 飯店附設地下停車場，餐飲消費即可免費停車','亞洲料理, 單點式, 套餐, 中式料理, 台式料理, 粵式料理',3.3,'桃園','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R15261_EZTABLE_0826_1_6cb18cf906.png','團體聚餐, 家庭聚餐, 商業聚餐, 朋友聚餐, 生日慶祝, 浪漫約會',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (87,'村民食堂廚窗港點（桃園藝文特區）','桃園市桃園區中正路1078號','[午餐]
 週一 - 週日 11:30-14:00
 週六 - 週日 11:00-15:00
[晚餐]
 週一 - 週日 17:30-21:00
 週六 - 週日 17:00-21:00','適合青少年, 受大學生歡迎, 有付費停車場, Wi-Fi, 無障礙空間, 提供兒童座椅, 信用卡','A.市區公車-搭乘GR線、117、151、152、9005、9023至福安宮站。
B.台北-市府轉運站或捷運圓山站搭乘9005、9023至中正藝文特區站。','亞洲料理, 粵式料理, 自助餐, 點心',4,'桃園','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R13963_EZTABLE_0321_2_be141a3cdd.png','浪漫約會, 商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐, 生日慶祝',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (88,'和東燒肉屋','桃園市桃園區民有三街485號','[午餐]
 週二 - 週五 11:30-14:00
 週六 - 週日 11:30-15:00
[晚餐]
 週二 - 週五 17:30-22:00
 週六 - 週日 17:00-22:00','提供專業炭火燒肉與新鮮多樣的蔬菜，讓您放心吃肉同時沒有負擔，重視店內愉快放鬆的氛圍，對待顧客如同家人一般，我們用心在每個細節上，希望能帶給每位顧客一份簡單卻深刻的感動',null,'亞洲料理, 日式料理, 燒烤, 單點式, 套餐',3.8,'桃園','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R15051_EZTABLE_1203_1_237a29cfc0.png','浪漫約會, 朋友聚餐, 生日慶祝',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (89,'Mix Bistro','桃園市桃園區成功路一段5號2F','[晚餐]
 週五 - 週三 17:30-12:00','桃園地區第一間以創意調酒mix創意料理的餐酒館，輕鬆美好的氛圍、創意專業的調酒、美味健康的料理，將這些結合在一起，Mix Bistro複合式餐酒館因此誕生！','距離桃園火車站步行約8分鐘','西式料理, 美式料理, 酒吧, 餐酒館, 單點式',3.9,'桃園','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R15210_EZTABLE_0306_1_b551cc55fb.png','浪漫約會, 朋友聚餐, 生日慶祝, 團體聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (90,'喵日子 Café','桃園市桃園區保定三街93號','[全天開放]
 週一 - 週日 11:00-22:00','在喵日子裡，無服務費的加成，且免費提供插座及高速無線網路，供商務人士或有需要的您使用。
無論想來閱讀、用筆電、談生意、或是好友聚會、獨自一人喝咖啡，都非常適合！
為顧及其他顧客，於店內聊天時幫我們注意一下音量喲^^
而因喵日子店內，無論在裝潢、傢俱，或是擺設、風格上，取向偏為商務、好友小聚方面的顧客，故暫時沒有接待12歲以下小朋友，同時店內嚴禁大聲喧嘩、追逐貓咪、踩踏椅子、攀爬貓跳台。
最後喵日子為主題式咖啡館，因貓咪健康、地域性相關問題，暫時沒有給朋友們也帶寵物至店內交流的措施，敬請見諒。','若想搭公車至喵日子，可搭乘188或189號公車，於向陽運動公園站下車，步行1分鐘即可至店內。或是搭乘L111、L111A、L110此三號的公車，至保定六街口下車，步行三分鐘可至店內。騎乘Ubike也可以，喵日子旁就有還車處。而搭乘計程車亦可。','下午茶, 咖啡館, 單點式, 點心',4,'桃園','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R15137_EZTABLE_1227_1_cdc42d5fb9.png','浪漫約會, 商業聚餐, 朋友聚餐',null,2,'Y');
Insert into III_TEAM_DBA.RESTAURANT (R_SN,NAME,ADDRESS,OPENTIME,DESCRIPTION,TRANSPORTATION,TYPE,RATING,REGION,PIC_URL,SERVICEINFO,USERNAME,TABLENUM,STATUS) values (91,'Les OMBRES d’Ambre光影新歐陸料理','台南市中西區和緯路五段203號','[午餐]
 週一 - 週日 11:30-14:30
[晚餐]
 週一 - 週日 18:00-22:00','提供私人包廂, 有免費停車場, 吸菸區, Wi-Fi, 信用卡','*搭乘十號公車，於中華西路二段下車，往和緯路五段步行，位於和緯路五段與湖美二街交叉口','西式料理, 法國料理',4.5,'台南','https://dgo9uctxwg500.cloudfront.net/images/1200x1200/R13890_EZTABLE_0525_4_db6b036987.png','浪漫約會, 商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐, 生日慶祝',null,2,'Y');
--------------------------------------------------------
--  DDL for Index RESTAURANT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "III_TEAM_DBA"."RESTAURANT_PK" ON "III_TEAM_DBA"."RESTAURANT" ("R_SN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger RESTAURANT_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "III_TEAM_DBA"."RESTAURANT_TRG" 
    BEFORE INSERT ON RESTAURANT
    FOR EACH ROW
BEGIN
    <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "III_TEAM_DBA"."RESTAURANT_TRG" ENABLE;
--------------------------------------------------------
--  Constraints for Table RESTAURANT
--------------------------------------------------------

  ALTER TABLE "III_TEAM_DBA"."RESTAURANT" MODIFY ("R_SN" NOT NULL ENABLE);
  ALTER TABLE "III_TEAM_DBA"."RESTAURANT" ADD CONSTRAINT "RESTAURANT_PK" PRIMARY KEY ("R_SN")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RESTAURANT
--------------------------------------------------------

  ALTER TABLE "III_TEAM_DBA"."RESTAURANT" ADD CONSTRAINT "RESTAURANT_FK1" FOREIGN KEY ("USERNAME")
	  REFERENCES "III_TEAM_DBA"."ACCOUNT" ("USERNAME") ENABLE;
--------------------------------------------------------
--  Create VIEW Table SHOW_RVIEW
--------------------------------------------------------	    
create view SHOW_RVIEW as
select R_SN, NAME, ADDRESS, REGION, USERNAME, STATUS from RESTAURANT;