--------------------------------------------------------
--  已建立檔案 - 星期五-十一月-13-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table HOTEL
--------------------------------------------------------

  CREATE TABLE "HOTEL" 
   (	"SN" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"NAME" VARCHAR2(255 BYTE), 
	"REGION" VARCHAR2(255 BYTE), 
	"ADDRESS" VARCHAR2(255 BYTE), 
	"TEL" VARCHAR2(255 BYTE), 
	"DOUBLE_ROOM" NUMBER, 
	"QUADRUPLE_ROOM" NUMBER, 
	"DESCRIPTION" NVARCHAR2(2000), 
	"OPENTIME" VARCHAR2(1024 BYTE), 
	"TYPE" VARCHAR2(255 BYTE), 
	"RATING" NUMBER(2,1), 
	"ACCOUNT" VARCHAR2(255 BYTE), 
	"STATUS" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into HOTEL
SET DEFINE OFF;
Insert into HOTEL (SN,NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values (9,'蔚藍海岸休閒SPA汽車旅館','基隆市','基隆市安樂區武隆街67號','886-2-24332366',2800,4200,'蔚藍海岸休閒SPA汽車旅館『蔚藍海岸』這個名稱取自於法國最浪漫迷人的渡假勝地之名，是所有旅人最嚮往的美麗國度。有著藍天碧海、白牆、藍窗、紅瓦、鐘樓、陽光的地中海風情的建築外觀。著重休閒與情境空間的主題式旅館，館內規劃二十餘種不同主題風格的頂級套房及為商務人仕打造的專屬商務套房，是基隆地區的豪華旅館，更是台灣北海岸最浪漫的愛情城堡，讓每一位賓客享受到最豪華、最有格調的星級旅館。 本旅館座落於基隆基金三路上鄰近大武崙工業區旁，是基隆與萬里、金山之間的必經之路，當您瀏覽外木山海邊、情人湖公園、大武崙砲台、翡翠灣、野柳等旅遊景點時及享受鄰近物美價廉的生猛海鮮之餘，『蔚藍海岸休閒SPA汽車旅館』便是您最佳的休憩所在。讓您隨時沉醉在不同的異國風情，將一切煩瑣置身事外。本著服務至上、處處貼心的態度期待您來『擁抱蔚藍、縱情海岸』。','全年無休','汽車旅館',4,null,'啟用');
Insert into HOTEL (SN,NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values (10,'三重江月行館','新北市','新北市三重區重新路5段598號','886-2-85110998',3000,5000,'耗資三億五千萬的三重江月行館，鄰近新莊、三重、板橋、台北市，位處交通要道，距離中山高五股新莊、三重或二高中和、板橋交流道亦僅需10-15分鐘車程，距先嗇宮捷運站亦僅需五分鐘路程，為大台北地區新成立最新穎的時尚旅店。三重江月行館提供視聽影音、朋友聚會、Spa水療、並提供高質感的硬體設備與相關備品，無論是商務住宿或者短暫休憩，我們意旨提供給每一位客人"享受歡樂 享受愛"，在您如魚得水的生活中，找到一片"悠游自在 荒漫自得"的遊樂園放肆享樂。人生是一場華麗旅行，您會愛上三重江月行館，與愛上更好的自己。Fun and stay with your love，愛您所愛 悠游自在，三重江月行館，我們期盼與您見面。','全年無休','飯店',4.1,null,'啟用');
Insert into HOTEL (SN,NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values (11,'望幽谷民宿','新北市','新北市瑞芳區汽車路108之3號','886-2-24966296',1500,2000,'坐看幽幽山城，享受無邊的天際與青翠山色，望幽谷民宿依著九份溪，坐落在翠綠的山腰，慢步十分鐘，即可悠遊熱鬧的山城步道，收藏滿滿的流金歲月。庭院可以遠眺九份山城與基隆山，不管白天的熱鬧景象還是晚上的夜景，山城美境盡收眼底。    望幽谷是九份的傳統石屋改建，我們將老舊的石牆重新堆砌修復，一石一瓦都有的親切手感，從小在九份長大的濃濃情感，全心投入民宿的建造與經營，我們每個套房都設有供休息的小桌椅，空間在內人的精心佈置下，相信訪客都能感受到我們的用心。    歡迎訪客到望幽谷民宿休憩，如果下午入住，可以從頌德公園開始逛遊九份老街，挑個好茶館或特色咖啡廳，悠哉悠哉的度過輕鬆的懷舊時光；晚間可以在我們的庭院觀星賞夜景，安枕舒眠後享用我們為您準備的早餐、用完餐後朝氣滿滿，可以走一趟金瓜石參觀黃金園區，或者到基隆山健健腳、東北角濱海遊蹤，都是不錯選擇。    望幽谷民宿有三間不同風格的獨立套房:日式榻榻米風的竹風套房、藍色寬闊海洋風的藍影套房以及粉色甜美浪漫風的漫屋套房，每間套房內皆有獨立衛浴並貼心的附上免費小餐點-糖果、餅乾、泡麵、水及飲料，不僅可解嘴饞更不用擔心半夜肚子餓!!住宿費用-平日房價(周日~周四)NT$1500，假日房價(周五、周六、連續假期)NT$2000，加床費用另計，每加一人為NT$300，每房型以多加兩人為限。','全年無休','民宿',3.6,null,'啟用');
Insert into HOTEL (SN,NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values (12,'歐悅精品汽車旅館','新北市','臺南市南區灣裡路62巷2號1-2樓','886-2-26086611',2000,3000,'林口館於2010年落成，別名「歐悅音樂館」，全館38種風格套房， 以各類不同音樂風格為題，以打造「一日豪宅生活體驗」作為發想起點，挑戰集團創辦10年來的最大課題，全館以親水模設計搭配面積廣闊之水景綠意，搭配設計團隊巧妙的空間規劃與環保建材的使用，完全破除了制式格局與封閉空間的囹圄，在這裡，您可以無拘束的盡情享用專屬的泳池、遊樂設施、頂級SPA以及KTV歡唱設備，體驗50坪到300坪的奢華富麗。','全年無休','汽車旅館',4.4,null,'啟用');
Insert into HOTEL (SN,NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values (13,'約客頂級汽車旅館','桃園市','桃園市桃園區泰山街58號1-4樓','886-3-3386969',1800,3000,'跨世代 Top Motel 頂級汽車旅館誕生絕對隱密，引進高規格7層隔音設備、高科技聲控燈光影音連結， 每房配備專屬獨立Wi-Fi、27吋電腦螢幕、4核心電競級電腦、光纖專線上網服務斥資五億， 佔地1,400坪，33間頂級精品套房，4間豪華俱樂部、呈現20種設計家風格，跨世代頂級設計的大躍進，樹立頂級精品旅館的新典範。呈現集精緻、富麗、豪華、尊榮於一堂的頂級豪宅精品旅館，結合高科技聲光器材、更採用軍方7層隔音規格設備，為情侶歡聚、名流下榻、派對舞會的最佳首選。座擁桃園區精華黃金地點集娛樂、休閒、夜生活齊聚的核心地帶，鄰近大眾運輸系統中山高及北二高與縱貫公路；3分鐘車程到桃園火車站，30分鐘車程至桃園國際機場與高鐵站。','全年無休','汽車旅館',4.6,null,'啟用');
Insert into HOTEL (SN,NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values (14,'享樂文旅飯店桃園館','桃園市','桃園市桃園區復興路95號','886-3-3375988',2100,3200,'位於桃園客運總站正對面，桃園火車站步行距離３分鐘，三家百貨公司近在咫尺，是購物逛街好地點，還有知名「興仁夜市」占地七千坪，吃喝玩樂滿足您 。桃園，台灣的國門，北上首都台北、南下台中、阿里山、墾丁，甚至到台灣後花園的花蓮、台東，這兒就是您的起點；舒適的客房，簡單精緻，帶有小清新文創風格，體會獨家的台灣人情味，除了賓至如歸，我們還想讓您享樂桃園，看見台灣，就從這裡開始。享樂桃園館獲准穆斯林認證飯店 享樂桃園館獲准AED安心場所認證飯店 享樂桃園館獲准環保旅店認證飯店','全年無休','飯店',3.9,null,'啟用');
Insert into HOTEL (SN,NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values (15,'繪葉41町民宿','新竹縣','新竹縣峨眉鄉七星村17鄰藤坪26-8號','886-3-5800105',1700,2600,'民宿的日子是真實的生活經驗分享。我們在山與山間依偎著日光勞動，在月光裡靜數星月螢火，在每個季節守護迷路原為看花開的心意，在花褪蒂落與花草香氣間甜嘗小農及自栽的豐收感……，這些都是我們希望與旅人所分享，屬於家園再真切不過的生活滋味。繪葉41町，邀請旅人走進宛如明信片小鎮的山居歲月裡，一起好好生活。新竹縣合法民宿061號、好客民宿00987號	','全年無休','民宿',3.2,null,'啟用');
Insert into HOTEL (SN,NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values (21,'日月光國際大飯店','新竹市','新竹市東區中央路355巷16號1,3-6樓','886-3-5456363',2000,4800,'金悅大飯店於2005年全新開幕，位於新竹市中心中央路上，新竹三民國中旁，可享有方便的城市探索卻也有著離塵不離城般的寧靜，擁有60間精緻客房、商務中心、健身房、腳踏車等貼心的設施等您來體驗。','全年無休','飯店',5,null,'啟用');
Insert into HOTEL (SN,NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values (1,'晶華酒店','臺北市','臺北市中山區中山北路2段39巷3號','886-2-25238000',5000,8000,'台北晶華酒店是國際麗晶酒店集團的旗艦店，也是全台北市最卓越、最受歡迎的國際五星級飯店之一。主要的客層包括國際商旅、觀光客及本地客人，裝潢上強調簡雅大方，服務上則務求精緻細膩，期能提供顧客最高品質的住宿、餐飲享受，成為全台精緻生活的標竿。飯店內共有八間中西美食以及餐廳、提供消費者品味中、西、日式佳餚的極致享受；位於二十樓的沐蘭SPA則擁有世界級的頂級芳香療程；而頂樓溫水游泳池、健身房、以及地下一、二樓的麗晶精品名店街…等休閒設施，更可營造完美的渡假享受！台北晶華酒店卓越的服務與設施,在國際獎項中獲獎連連，更連續兩年獲得Conde Naste Traveler讀者票選為亞洲最佳50大飯店之列，且為臺灣區的第一名。亦是許多世界級政商名流與影視巨星蒞臨台北時的首選下榻飯店。飯店擁有538間客房，間間採光良好、平均坪數居業界之冠，每房皆備有快速的便利的ADSL以及無線接撥和寬頻上網系統，房客可隨時輕鬆悠遊網路世界。除此之外，客房內還貼心的提供「枕頭選單」，共有羽毛枕、空氣枕、羊毛枕、記憶枕...等八款軟硬和材質不同的選擇。結合高科技材質、擁有感溫、塑型、釋壓、舒眠效果的Wellspring臥舒麗床墊，更為房客營造出最舒適的睡眠環境。本飯店位居台北市的中心地帶，緊鄰台北火車站與捷運淡水線中山站4號出口，並鄰近南西/中山百貨商圈，飯店門口也設有機場接駁與各線公車停駁站，連接全台北市各觀光與知名據點。無論是遊覽、購物或商務洽公,皆享最快速方便的交通服務。','全年無休','飯店',5.8,null,'啟用');
Insert into HOTEL (SN,NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values (2,'錦棧商旅','臺北市','臺北市中山區林森北路413號2樓、7樓、7樓之14及錦州街46號7樓、48號7樓','886-2-77012121',3000,4500,'錦棧商旅位於繁榮的中山商圈，坐落於林森北路及錦州街口，緊鄰中山國小捷運站，交通機能四通八達。客房融合現代化輕工業風設計，溫馨簡潔的獨特42間客房設計風格，融合多項貼心新穎設備，全館無線網際網路WIFI，餐廳、健身房、商務中心、資訊服務、書報閱讀區、洗衣中心、健身房、自助調理區、無障礙客房設施…一應俱全。錦棧商旅，秉持著穩健、創新的服務熱忱，提供您便捷、舒適、樂活的住宿休息環境，實為大台北地區，獨特及不可多得的全新精品旅店。','全年無休','飯店',4.2,null,'啟用');
Insert into HOTEL (SN,NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values (3,'清新溫泉飯店','臺中市','臺中市烏日區溫泉路2號','886-4-23829888',2500,4000,'現在，您會發現，美人湯離您如此之近！這裡有中台灣最近的溫泉，白天可以在山林環抱中享用美食，觀看行雲如水，時時清風拂面。晚上仰望滿天星斗，俯瞰台中市萬家燈火、華麗燦爛的夜景。清新溫泉飯店隸屬於台灣數位光訊科技集團旗下之休閒產業，本著政府「觀光黃金十年」政策，深耕於中台灣，並遵循著提供賓客【清新、活力、自然】住宿及用餐舒適體驗的使命，持續於飯店內投入更多的用心及心力，並也陸續獲得國家及地方政府的肯定，於民國101年3月取得交通部觀光局所頒發溫泉標章、12月獲頒台中市政府觀光旅遊局【節能減碳旅館】特優獎，而今年3月更獲得中華民國交通部觀光局所頒發【五星級觀光飯店】榮耀。這裡便利交通，距離高速公路與台中高鐵15分鐘車程另並提供定點定時接送服務。無論商務出差、旅遊度假，均是最佳的選擇。','全年無休','飯店',3.8,null,'啟用');
Insert into HOTEL (SN,NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values (4,'花田民宿','臺中市','臺中市新社區興中街17-6號','886-4-25823666',2500,3500,'花田幸福的傳承花田由花田爸爸媽媽開始。因為厭倦城市的喧鬧聲 他們離開了原來的地方。在新社這片土地灌蓋了自己的幸福花田。如今，花田爸爸將一手打造的幸福花園傳承給愛兒，希望這份用心能一直一直持續下去………花田兒子把自己的幸福故事 灌入在花田這片土地上 希望踏入花田的你們能感受到這份感動花田兒的幸福故事:“讓你有回家的感覺”帶著遠從馬來西亞嫁到臺灣的太太回家接管爸爸的幸福花田兩個年輕人用心澆水讓花田裏的小花小草能持續的燦爛；用心微笑讓踏入花田的客人能感受到舒服與自在 他們用坦誠經營自己的異國戀 相同的也用那份坦誠經營花田 堅持不讓客人失望 兩個不曾見面的陌生人因為一條網路線的連接而創造了一段異國戀 這就是花田爸爸所謂的……緣分他們用坦誠與信任經營這段異國戀。因為距離讓故事變得更值得珍惜不一樣的開始讓兩個人找到幸福原來只需要放手一試原來只需要耐心溝通就能聽見對方原來只需要慢慢灌溉總有一天會發芽如今花田兒子與來自馬來西亞的媳婦 手牽手持續爸爸媽媽的幸福 用心澆水讓花園裏的小花能持續的燦爛用心微笑讓踏入花田的你們能感受到我們的幸福','全年無休','民宿',4.4,null,'啟用');
Insert into HOTEL (SN,NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values (5,'為楓渡假別館','臺南市','臺南市南區灣裡路62巷2號1-2樓','886-6-2628800',3000,5000,'在為楓 ~ 沿著黃金海岸海潮小徑，愜意漫步林蔭，幻想千百種愛情的模樣。在為楓 ~ 感受幸福情意氛圍縈繞，品味海洋氣息，享受片刻間靜謐的天堂。','全年無休','民宿',3.2,null,'啟用');
Insert into HOTEL (SN,NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values (6,'榮興金鬱金香酒店','臺南市','臺南市中西區民族路二段128號1至9樓','886-6-2208366',2500,3500,'赤崁樓建於1653，從西拉雅-赤崁社、荷蘭-普羅民遮城、鄭成功-東都明京承天府，台灣閩南人稱之為赤崁樓或紅毛樓。榮興RS HOTEL 2013起造，時隔360年，距離360公尺，質樸文藝風華、古老歐洲美學再現；360度蒂芬尼玻璃穹頂大堂、皇家禮賓廳、庫肯霍夫餐酒館、葛洛莉魔法空間、頂級英式套房，當達文西遇上J.K.羅琳……。Tainan Travel Key，我們以台南旅遊必遊景點為期許。','全年無休','飯店',4.5,null,'啟用');
Insert into HOTEL (SN,NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values (7,'香草藝術旅店','基隆市','基隆市信義區義三路6號1-5樓','886-2-24254688-91',1500,3000,'Herb Art Hotel 香草藝術旅店為基隆市第一家以藝術為主題商務旅館，提供藝文活動與資訊為主軸，並以貼心服務為 主要訴求，希望旅客享受高優質的服務。旅館坐落在基隆田寮河畔交通便利，距離廟口夜市步行大約3-5分鐘，離基 隆火車站步行約10分鐘，是您住宿基隆絕佳選擇。近年來，藝術與文化創意在台灣發展迅速，衍然已經成為與國際交流共通的語言。Herb Art Hotel 創意理念是以音樂 、繪畫、設計為基礎，並結合時尚爵士樂團Herb Jazz Band(賀伯爵士樂團)與諸多音樂藝術家們創作理念，藉由飯店 作為文化展演空間舉辦文藝活動讓飯店不只侷限於住宿，希望能將更多藝術生命力導入飯店激發出更多文化力量， 也期望與您一起激發出另一種驚奇感受！我們以原先過去欣海大飯店重新規劃裝潢，提供時尚、浪漫、藝術的空間創意、舒適嶄新的羽絨寢具、齊全便利的 設備，再加上現代化旅館管理系統，相信能讓您在基隆旅遊住宿期間，感受最貼心的服務。','全年無休','飯店',3.7,null,'啟用');
Insert into HOTEL (SN,NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values (8,'柯達大飯店','基隆市','基隆市中正區基隆市中正區義一路7號9號1-8樓','886-2-24230111',2500,5000,'新都心旅憩 City Life Traveling Mind 距離中外馳名基隆廟口徒步只需5分鐘路程的柯達大飯店(基隆店)，以四季豐富多變的特色美饌著稱，巧妙融合地方特色食材，自成飲食新文化獨有一派在地的濃烈人情味，提供數十年如一日的溫情雙手，隨時為您提供服務，是您體驗海洋都市商旅的不二選擇。精緻裝潢的客房設施，提供舒適、寧靜的空間，義大利進口衛浴、高級天鵝羽毛寢具讓您完全的放鬆並感受頂級的休憩體驗。充實的客房設施亦滿足洽公人士的商務需求。距離高速公路交流道僅約3分鐘車程，基隆火車站、客運總站亦為步行的距離內，便捷的交通網路讓您無論是商務或旅遊都非常的輕鬆。附近濱海公路、中正公園、基隆廟口、碧砂漁港、海險天門、九份及野柳都是您不可錯過的精采景點，更豐富了您的旅遊回憶。','全年無休','飯店',3.7,null,'啟用');
--------------------------------------------------------
--  DDL for Index HOTEL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HOTEL_PK" ON "HOTEL" ("SN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table HOTEL
--------------------------------------------------------

  ALTER TABLE "HOTEL" MODIFY ("SN" NOT NULL ENABLE);
  ALTER TABLE "HOTEL" ADD CONSTRAINT "HOTEL_PK" PRIMARY KEY ("SN")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;


--------------------------------------------------------
--  已建立檔案 - 星期五-十一月-13-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table H_ORDER_LIST
--------------------------------------------------------

  CREATE TABLE "H_ORDER_LIST" 
   (	"SN_ORDER" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"ORDER_ID" NUMBER, 
	"ORDER_HOTEL_ID" NUMBER, 
	"DOUBLE_ROOM" NUMBER, 
	"QUADRUPLE_ROOM" NUMBER, 
	"CHECK_IN" DATE, 
	"CHECK_OUT" DATE, 
	"H_PRICE" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
REM INSERTING into H_ORDER_LIST
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index H_ORDER_LIST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "H_ORDER_LIST_PK" ON "H_ORDER_LIST" ("SN_ORDER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table H_ORDER_LIST
--------------------------------------------------------

  ALTER TABLE "H_ORDER_LIST" MODIFY ("SN_ORDER" NOT NULL ENABLE);
  ALTER TABLE "H_ORDER_LIST" ADD CONSTRAINT "H_ORDER_LIST_PK" PRIMARY KEY ("SN_ORDER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table H_ORDER_LIST
--------------------------------------------------------

  ALTER TABLE "H_ORDER_LIST" ADD CONSTRAINT "H_ORDER_LIST_ORDER_TABLE_ORDER_ID_FK" FOREIGN KEY ("ORDER_ID")
	  REFERENCES "ORDER_TABLE" ("ORDER_ID") ENABLE;
  ALTER TABLE "H_ORDER_LIST" ADD CONSTRAINT "H_ORDER_LIST_HOTEL_SN_FK" FOREIGN KEY ("ORDER_HOTEL_ID")
	  REFERENCES "HOTEL" ("SN") ENABLE;
  ALTER TABLE "H_ORDER_LIST" ADD CONSTRAINT "H_ORDER_LIST_HOTEL_DOUBLE_ROOM_FK" FOREIGN KEY ("DOUBLE_ROOM")
	  REFERENCES "HOTEL" ("SN") ENABLE;
  ALTER TABLE "H_ORDER_LIST" ADD CONSTRAINT "H_ORDER_LIST_HOTEL_QUADRUPLE_ROOM_FK" FOREIGN KEY ("QUADRUPLE_ROOM")
	  REFERENCES "HOTEL" ("SN") ENABLE;
