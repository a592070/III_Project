--------------------------------------------------------
--  已建立檔案 - 星期一-十一月-23-2020   
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
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('蔚藍海岸休閒SPA汽車旅館','基隆市','基隆市安樂區武隆街67號','886-2-24332366',2800,4200,'蔚藍海岸休閒SPA汽車旅館『蔚藍海岸』這個名稱取自於法國最浪漫迷人的渡假勝地之名，是所有旅人最嚮往的美麗國度。有著藍天碧海、白牆、藍窗、紅瓦、鐘樓、陽光的地中海風情的建築外觀。著重休閒與情境空間的主題式旅館，館內規劃二十餘種不同主題風格的頂級套房及為商務人仕打造的專屬商務套房，是基隆地區的豪華旅館，更是台灣北海岸最浪漫的愛情城堡，讓每一位賓客享受到最豪華、最有格調的星級旅館。 本旅館座落於基隆基金三路上鄰近大武崙工業區旁，是基隆與萬里、金山之間的必經之路，當您瀏覽外木山海邊、情人湖公園、大武崙砲台、翡翠灣、野柳等旅遊景點時及享受鄰近物美價廉的生猛海鮮之餘，『蔚藍海岸休閒SPA汽車旅館』便是您最佳的休憩所在。讓您隨時沉醉在不同的異國風情，將一切煩瑣置身事外。本著服務至上、處處貼心的態度期待您來『擁抱蔚藍、縱情海岸』。','全年無休','汽車旅館',4,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('三重江月行館','新北市','新北市三重區重新路5段598號','886-2-85110998',3000,5000,'耗資三億五千萬的三重江月行館，鄰近新莊、三重、板橋、台北市，位處交通要道，距離中山高五股新莊、三重或二高中和、板橋交流道亦僅需10-15分鐘車程，距先嗇宮捷運站亦僅需五分鐘路程，為大台北地區新成立最新穎的時尚旅店。三重江月行館提供視聽影音、朋友聚會、Spa水療、並提供高質感的硬體設備與相關備品，無論是商務住宿或者短暫休憩，我們意旨提供給每一位客人"享受歡樂 享受愛"，在您如魚得水的生活中，找到一片"悠游自在 荒漫自得"的遊樂園放肆享樂。人生是一場華麗旅行，您會愛上三重江月行館，與愛上更好的自己。Fun and stay with your love，愛您所愛 悠游自在，三重江月行館，我們期盼與您見面。','全年無休','飯店',4.1,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('望幽谷民宿','新北市','新北市瑞芳區汽車路108之3號','886-2-24966296',1500,2000,'坐看幽幽山城，享受無邊的天際與青翠山色，望幽谷民宿依著九份溪，坐落在翠綠的山腰，慢步十分鐘，即可悠遊熱鬧的山城步道，收藏滿滿的流金歲月。庭院可以遠眺九份山城與基隆山，不管白天的熱鬧景象還是晚上的夜景，山城美境盡收眼底。    望幽谷是九份的傳統石屋改建，我們將老舊的石牆重新堆砌修復，一石一瓦都有的親切手感，從小在九份長大的濃濃情感，全心投入民宿的建造與經營，我們每個套房都設有供休息的小桌椅，空間在內人的精心佈置下，相信訪客都能感受到我們的用心。    歡迎訪客到望幽谷民宿休憩，如果下午入住，可以從頌德公園開始逛遊九份老街，挑個好茶館或特色咖啡廳，悠哉悠哉的度過輕鬆的懷舊時光；晚間可以在我們的庭院觀星賞夜景，安枕舒眠後享用我們為您準備的早餐、用完餐後朝氣滿滿，可以走一趟金瓜石參觀黃金園區，或者到基隆山健健腳、東北角濱海遊蹤，都是不錯選擇。    望幽谷民宿有三間不同風格的獨立套房:日式榻榻米風的竹風套房、藍色寬闊海洋風的藍影套房以及粉色甜美浪漫風的漫屋套房，每間套房內皆有獨立衛浴並貼心的附上免費小餐點-糖果、餅乾、泡麵、水及飲料，不僅可解嘴饞更不用擔心半夜肚子餓!!住宿費用-平日房價(周日~周四)NT$1500，假日房價(周五、周六、連續假期)NT$2000，加床費用另計，每加一人為NT$300，每房型以多加兩人為限。','全年無休','民宿',3.6,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('歐悅精品汽車旅館','新北市','臺南市南區灣裡路62巷2號1-2樓','886-2-26086611',1500,3000,'林口館於2010年落成，別名「歐悅音樂館」，全館38種風格套房， 以各類不同音樂風格為題，以打造「一日豪宅生活體驗」作為發想起點，挑戰集團創辦10年來的最大課題，全館以親水模設計搭配面積廣闊之水景綠意，搭配設計團隊巧妙的空間規劃與環保建材的使用，完全破除了制式格局與封閉空間的囹圄，在這裡，您可以無拘束的盡情享用專屬的泳池、遊樂設施、頂級SPA以及KTV歡唱設備，體驗50坪到300坪的奢華富麗。','全年無休','汽車旅館',4.4,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('約客頂級汽車旅館','桃園市','桃園市桃園區泰山街58號1-4樓','886-3-3386969',1500,3000,'跨世代 Top Motel 頂級汽車旅館誕生絕對隱密，引進高規格7層隔音設備、高科技聲控燈光影音連結， 每房配備專屬獨立Wi-Fi、27吋電腦螢幕、4核心電競級電腦、光纖專線上網服務斥資五億， 佔地1,400坪，33間頂級精品套房，4間豪華俱樂部、呈現20種設計家風格，跨世代頂級設計的大躍進，樹立頂級精品旅館的新典範。呈現集精緻、富麗、豪華、尊榮於一堂的頂級豪宅精品旅館，結合高科技聲光器材、更採用軍方7層隔音規格設備，為情侶歡聚、名流下榻、派對舞會的最佳首選。座擁桃園區精華黃金地點集娛樂、休閒、夜生活齊聚的核心地帶，鄰近大眾運輸系統中山高及北二高與縱貫公路；3分鐘車程到桃園火車站，30分鐘車程至桃園國際機場與高鐵站。','全年無休','汽車旅館',4.6,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('享樂文旅飯店桃園館','桃園市','桃園市桃園區復興路95號','886-3-3375988',2100,3200,'位於桃園客運總站正對面，桃園火車站步行距離３分鐘，三家百貨公司近在咫尺，是購物逛街好地點，還有知名「興仁夜市」占地七千坪，吃喝玩樂滿足您 。桃園，台灣的國門，北上首都台北、南下台中、阿里山、墾丁，甚至到台灣後花園的花蓮、台東，這兒就是您的起點；舒適的客房，簡單精緻，帶有小清新文創風格，體會獨家的台灣人情味，除了賓至如歸，我們還想讓您享樂桃園，看見台灣，就從這裡開始。享樂桃園館獲准穆斯林認證飯店 享樂桃園館獲准AED安心場所認證飯店 享樂桃園館獲准環保旅店認證飯店','全年無休','飯店',3.9,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('繪葉41町民宿','新竹縣','新竹縣峨眉鄉七星村17鄰藤坪26-8號','886-3-5800105',1700,2600,'民宿的日子是真實的生活經驗分享。我們在山與山間依偎著日光勞動，在月光裡靜數星月螢火，在每個季節守護迷路原為看花開的心意，在花褪蒂落與花草香氣間甜嘗小農及自栽的豐收感……，這些都是我們希望與旅人所分享，屬於家園再真切不過的生活滋味。繪葉41町，邀請旅人走進宛如明信片小鎮的山居歲月裡，一起好好生活。新竹縣合法民宿061號、好客民宿00987號	','全年無休','民宿',3.2,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('蘭天民宿','宜蘭縣','宜蘭縣宜蘭市進士路3-36號','886-3-9311260',1700,4800,'『蘭天民宿』坐落在宜蘭旅遊中心點，交通便捷，是您旅遊宜蘭最好的住所。蘭天主人在年輕時為生活離鄉背井前往都市，大半輩子都疲於工作，為了離開都市的喧鬧紛擾，在２００７年回來故鄉築夢，實現嚮往已久的田野生活。湛藍的天空，徐徐的微風，恬靜的田野，一切都是那麼自然。『蘭天民宿』邀您一同體驗鄉村之美，另還有免費提供種菜園地，讓您體驗農村樂趣。','全年無休','民宿',3.4,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('日月光國際大飯店','新竹市','新竹市東區中央路355巷16號1,3-6樓','886-3-5456363',2000,4800,'金悅大飯店於2005年全新開幕，位於新竹市中心中央路上，新竹三民國中旁，可享有方便的城市探索卻也有著離塵不離城般的寧靜，擁有60間精緻客房、商務中心、健身房、腳踏車等貼心的設施等您來體驗。','全年無休','飯店',5,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('和田家','宜蘭縣','宜蘭縣冬山鄉武淵村武罕三路29號','886-989-655121',2500,3000,'一、簡介：親切溫馨，營造家的感覺。二、餐飲：特色宜蘭風味餐，早餐採中式的自製早餐。三、經營特色：1.為歐式簡約建築風格，客房採不同主題(可愛風、公主房、峇里島飾品裝飾)。2.可遠眺山景及水田景觀，冬山河森林公園，可賞鳥、賞蛙、賞螢及獨角仙。3.提供腳踏車，可至冬山河自行車道騎乘。 4.可體驗採果或手工香皂 DIY。','全年無休','民宿',5,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('松河璞旅','臺北市','臺北市松山區松河街112號1樓至8樓','886-2-25281567',3000,3000,null,'全年無休','飯店',1.6,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('寶玉民宿','連江縣','連江縣東引鄉中柳村125號','886-836-76627',1700,4800,null,'全年無休','民宿',3.6,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('新港天地民宿','花蓮縣','花蓮縣花蓮市國威里新港街79號','886-988-291277',3000,3500,'位於花蓮縣的民宿','全年無休','民宿',1.7,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('風箏小木屋','宜蘭縣','宜蘭縣冬山鄉武淵村14鄰富堵五路91號','886-3-9591794',2600,5000,'位於宜蘭縣的民宿','全年無休','民宿',2.9,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('別府旅館 (水紗蓮汽車旅館)','臺北市','臺北市北投區中山路1-2號','886-2-28915121',3000,4800,'位於臺北市的旅館','全年無休','汽車旅館',2.1,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('忘憂﹝如意﹞館','臺東縣','臺東縣太麻里鄉大王村太峰路145號','886-89-782489',2600,4000,'「忘憂館景觀旅店」在南迴線最美麗的一角，坐擁大片海景與山景，用藍色畫出藍天，白色點綴海與天，打造出屬於地中海的一片天地，以希臘地中海風格細心打造的地中海渡假Villa，藍色圓頂與白牆映照著海洋，拱型窗框堆疊出濃濃的地中海風情。露臺上斜倚著藤椅，感受海風溫柔的吹拂著，就這樣慵懶地過一下午。夜晚有滿滿星空，伴您進入沉靜夢鄉。來到這裡您只需全身放輕鬆，放慢您的腳步，閉上眼睛聆聽大自然的音樂，感受海風徐徐吹來，忘卻所有的煩惱和憂愁，彷彿置身於地中海，享受片刻的寧靜和悠閒。「忘憂館景觀旅店」位於台東太麻里地區，鄰近台9線，不論旅人欲深入探訪太麻里各大私房景點，享受金崙溫泉的山林美泉、欣賞隨風搖曳的金黃色忘憂草(金針花)；或是欲沿著景色壯麗、山海佳景交疊的南迴公路南下/北上，前往台東各大景點探訪，皆十分便利。「忘憂館景觀旅店」提供雙人、四人及家庭浪漫套房，大小適中的房型空間，運用明亮的室內燈光結合高雅的裝潢設計，融入戶外的自然採光和秀麗景緻，展現寧靜的清新雅緻氣息，讓到訪的旅人們皆能暫時忘記塵世煩憂，如走入世外桃源般輕鬆自如～','全年無休','飯店',2.9,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('中南海酒店','臺中市','臺中市北屯區敦化路一段481號、485號','886-4-35009888',1700,5000,'位於臺中市的旅館','全年無休','飯店',1,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('景鴻汽車旅館','桃園市','桃園市大園區菓林里三民路二段609之1號至609之18號','886-3-3935588',1500,4000,'本公司自成立以來，「創新、求變、多元」的企業文化，努力深耕台灣市場，追求企業永續經營及成長，成為最卓越的旅館領導品牌，將朝多元化的經營模式邁進。以提供最便利的服務為宗旨，並善盡良好社會責任。TY MOTEL 的市場擁有與其他旅館不同化之處。時時引進各種新式設備，不斷連結消費者體驗的產品策略，亦是 TY MOTEL 和其他產品的區隔，更是能持續引領業界，以及保持領導品牌地位與未來的核心競爭能力主要原因。','全年無休','汽車旅館',3,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('星苑庭園民宿','宜蘭縣','宜蘭縣羅東鎮新群里10鄰新群五路83號','886-953-359159',2600,3000,'在幽靜的蘭陽平原裡,座落著一棟主人用心打造的民宿,眺望遠處,美景盡收眼底,民宿裡,處處填滿驚喜與歡笑,歡迎你來這裡,享受無拘無束的自在,累了,還有精緻的客房,室內明亮寬敞,挑高設計風格與眾不同,貼心的怖置更溫暖了旅人的心,滿室芬芳令人流連忘返.擁抱著欣喜的心情,展開步伐,甩開煩腦,一起創造新的旅程.','全年無休','民宿',3.8,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('覓海二館民宿','澎湖縣','澎湖縣馬公市石泉里5鄰石泉590號','886-922-780005',2600,3500,null,'全年無休','民宿',2.9,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('漁家樂民宿','花蓮縣','花蓮縣花蓮市國光里三民街102號','886-3-8320646',2500,3000,'位於市中心花蓮市市公所旁，生活機能便利，附近有炸彈蔥油餅街與時光二手書店，以及可登山健行的美崙山，路程只要五分鐘就可到達美崙山路口，可看見整個花蓮市與海邊，晚上可逛著名的南濱夜市與自強夜市，可代客安排夜間抓蝦、釣魚、坐船夜釣，以及二天一夜套裝行程。4月-5月間鯉魚潭是賞鳥、賞螢、賞蝶及觀察植物的生態之旅，8月-9月是富里六十石山金針花季，7月-8月是花蓮原住民豐年祭，10月是花蓮國際石雕藝術節，11月是太魯閣峽谷馬拉松與峽谷音樂會。花蓮餐飲特色有三國一餐廳、月盧、櫻田野養生館、花本家〈賀川〉、立川魚池以及順富裕小吃、公正包子、鵝肉先生、來成排骨、大陸麵店、第一家烤肉店、蔣家花蓮式棺材板等都是好吃的美食。本人喜歡釣魚活動，在花蓮經營釣具業已經有二十年以上，這是父親在花蓮經營的店所傳承下來，已經有四十年了，由我接手，我愛好釣魚，常常與朋友去溪邊或海邊磯釣、灘釣、船釣，去享受大自然新鮮空氣與大海吹來涼爽的海風。花蓮是個好山好水美麗的地方。','全年無休','民宿',4.9,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('合益文旅民宿','臺東縣','臺東縣臺東市東峰街25號','886-937-600823',3000,3500,'位於臺東縣的民宿','全年無休','民宿',1.7,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('中旅酒店','臺中市','臺中市中區建國路173號','886-4-22262777',2600,3000,'無論您是因為出差或度假而造訪台中市，福爾摩沙旅館聯盟 - 中旅酒店，都會是您的最佳住宿選擇。 距離市區繁華地段僅有2.7 km的路程，這間4星級飯店的位置非常優越，方便外遊。 飯店位置優越讓遊人前往市區內的熱門景點變得方便快捷。 同時福爾摩沙旅館聯盟-中旅酒店，提供多種多樣的設施，令您在台中市期間的旅程更豐富。 入住飯店期間，客人可享受所有房型皆附免費WiFi, 24小時保全, 便利商店, 每日客房清潔, 傳真機。  共有近百間房間可供客人選擇，全部都給人以安靜典雅的感覺。 除此之外，飯店各種娛樂設施一定會讓您在留宿期間享受更多樂趣。 不管您來台中市是出差還是旅行，福爾摩沙旅館聯盟-中旅酒店，都能讓您在留宿期間擁有一段難忘的回憶。','全年無休','飯店',3.9,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('益大大飯店','高雄市','高雄市三民區九如二路172號','886-7-3116181',3000,5000,'位於高雄市的旅館','全年無休','飯店',1.6,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('南投大飯店','南投縣','南投縣南投市三和一路6號','886-49-2229161',1500,4800,'南投縣是台灣中央山脈唯一不靠海的縣份，有玉山國家公園、日月潭、溫泉、瀑布，風景如畫，環境優美，空氣清新，民情樸實，鄉土氣息濃厚的好地方，當然也是旅遊的勝地。因此，本著愛國愛鄉愛家，以及訓練自己來服務人群的理念，興建了南投大飯店，期望開發南投地區的觀光事業，增進地方繁榮。','全年無休','飯店',4.9,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('櫻花民宿','臺東縣','臺東縣臺東市博愛路55號','886-978-851859',3000,3000,'位於臺東縣的民宿','全年無休','民宿',1.8,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('日安艸木公寓民宿','臺東縣','臺東縣臺東市文山路38巷7號','886-912-052923',1700,3500,'位於臺東縣的民宿','全年無休','民宿',1.5,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('慢活民宿','澎湖縣','澎湖縣馬公市西衛里14鄰西衛223之2號','886-913-529293',2600,3500,'位於澎湖縣的民宿','全年無休','民宿',2.9,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('日光青境民宿','南投縣','南投縣仁愛鄉大同村壽亭巷31號','886-49-2802000',1700,4000,'位於南投縣的民宿','全年無休','民宿',1,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('和平大旅社','花蓮縣','花蓮縣玉里鎮中城里29鄰和平路51號','886-3-8883146',2100,3000,'位於花蓮縣的旅館','全年無休','飯店',4,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('素敵園休閒渡假民宿','花蓮縣','花蓮縣玉里鎮長良里10鄰155-6號','886-3-8801153',1700,4000,'位於花蓮縣的民宿','全年無休','民宿',1,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('富帝大飯店','臺中市','臺中市南區南屯路1段279號','886-4-23726855',2600,5000,'提供您體貼入微、處處關懷的貼心服務， 享受溫馨舒適、居家般悠遊愜意；是本店經營之一貫宗旨，亦是我們對您不變的承諾。以客為尊的富帝，為了給您溫馨如家，更勝於家的柔性感受；本飯店半數之套房改裝鋪設進口巴西實木地板，另半數之套房鋪設高級原木地板。走進富帝，必能感受虔虔富帝心，濃濃富帝情。富帝大飯店設有實地木板、蒸汽浴、烤箱等設備；歡迎蒞臨！舊雨新知，大家告訴大家。','全年無休','飯店',2.5,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('依庭民宿','花蓮縣','花蓮縣吉安鄉仁和村南海三街200巷10號','886-912-519665',3000,5000,'位於花蓮縣的民宿','全年無休','民宿',1.9,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('花蓮幸福時光民宿','花蓮縣','花蓮縣吉安鄉東昌村15鄰東里十五街41之1號','886-921-864021',3000,4000,'位於花蓮縣的民宿','全年無休','民宿',1.8,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('晶璽商旅','臺北市','臺北市信義區信義路四段468號3-13樓','886-2-23459777',2600,4800,'位於臺北市的旅館','全年無休','飯店',3.5,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('天扉旅棧民宿','花蓮縣','花蓮縣吉安鄉北昌村北昌一街47號','886-936-170966',2500,3000,'位於花蓮縣的民宿','全年無休','民宿',4.9,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('托斯卡尼民宿','臺東縣','臺東縣臺東市興安路一段169號','886-978-003121',1500,4000,'忙碌匆匆過每一天車水馬龍的城市適合全家大小親子同樂一同享受悠閒的旅程愜意的空間伴著可愛圖像氛圍為疲憊身心尋找桃花源托斯卡尼歡迎您的到來!在這稍微放鬆，一同渡過美好假期。','全年無休','民宿',2.2,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('晶華酒店','臺北市','臺北市中山區中山北路2段39巷3號','886-2-25238000',5000,8000,'台北晶華酒店是國際麗晶酒店集團的旗艦店，也是全台北市最卓越、最受歡迎的國際五星級飯店之一。主要的客層包括國際商旅、觀光客及本地客人，裝潢上強調簡雅大方，服務上則務求精緻細膩，期能提供顧客最高品質的住宿、餐飲享受，成為全台精緻生活的標竿。飯店內共有八間中西美食以及餐廳、提供消費者品味中、西、日式佳餚的極致享受；位於二十樓的沐蘭SPA則擁有世界級的頂級芳香療程；而頂樓溫水游泳池、健身房、以及地下一、二樓的麗晶精品名店街…等休閒設施，更可營造完美的渡假享受！台北晶華酒店卓越的服務與設施,在國際獎項中獲獎連連，更連續兩年獲得Conde Naste Traveler讀者票選為亞洲最佳50大飯店之列，且為臺灣區的第一名。亦是許多世界級政商名流與影視巨星蒞臨台北時的首選下榻飯店。飯店擁有538間客房，間間採光良好、平均坪數居業界之冠，每房皆備有快速的便利的ADSL以及無線接撥和寬頻上網系統，房客可隨時輕鬆悠遊網路世界。除此之外，客房內還貼心的提供「枕頭選單」，共有羽毛枕、空氣枕、羊毛枕、記憶枕...等八款軟硬和材質不同的選擇。結合高科技材質、擁有感溫、塑型、釋壓、舒眠效果的Wellspring臥舒麗床墊，更為房客營造出最舒適的睡眠環境。本飯店位居台北市的中心地帶，緊鄰台北火車站與捷運淡水線中山站4號出口，並鄰近南西/中山百貨商圈，飯店門口也設有機場接駁與各線公車停駁站，連接全台北市各觀光與知名據點。無論是遊覽、購物或商務洽公,皆享最快速方便的交通服務。','全年無休','飯店',5.8,null,'禁用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('錦棧商旅','臺北市','臺北市中山區林森北路413號2樓、7樓、7樓之14及錦州街46號7樓、48號7樓','886-2-77012121',3000,4500,'錦棧商旅位於繁榮的中山商圈，坐落於林森北路及錦州街口，緊鄰中山國小捷運站，交通機能四通八達。客房融合現代化輕工業風設計，溫馨簡潔的獨特42間客房設計風格，融合多項貼心新穎設備，全館無線網際網路WIFI，餐廳、健身房、商務中心、資訊服務、書報閱讀區、洗衣中心、健身房、自助調理區、無障礙客房設施…一應俱全。錦棧商旅，秉持著穩健、創新的服務熱忱，提供您便捷、舒適、樂活的住宿休息環境，實為大台北地區，獨特及不可多得的全新精品旅店。','全年無休','飯店',4.2,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('清新溫泉飯店','臺中市','臺中市烏日區溫泉路2號','886-4-23829888',2500,4000,'現在，您會發現，美人湯離您如此之近！這裡有中台灣最近的溫泉，白天可以在山林環抱中享用美食，觀看行雲如水，時時清風拂面。晚上仰望滿天星斗，俯瞰台中市萬家燈火、華麗燦爛的夜景。清新溫泉飯店隸屬於台灣數位光訊科技集團旗下之休閒產業，本著政府「觀光黃金十年」政策，深耕於中台灣，並遵循著提供賓客【清新、活力、自然】住宿及用餐舒適體驗的使命，持續於飯店內投入更多的用心及心力，並也陸續獲得國家及地方政府的肯定，於民國101年3月取得交通部觀光局所頒發溫泉標章、12月獲頒台中市政府觀光旅遊局【節能減碳旅館】特優獎，而今年3月更獲得中華民國交通部觀光局所頒發【五星級觀光飯店】榮耀。這裡便利交通，距離高速公路與台中高鐵15分鐘車程另並提供定點定時接送服務。無論商務出差、旅遊度假，均是最佳的選擇。','全年無休','飯店',3.8,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('花田民宿','臺中市','臺中市新社區興中街17-6號','886-4-25823666',2500,3500,'花田幸福的傳承花田由花田爸爸媽媽開始。因為厭倦城市的喧鬧聲 他們離開了原來的地方。在新社這片土地灌蓋了自己的幸福花田。如今，花田爸爸將一手打造的幸福花園傳承給愛兒，希望這份用心能一直一直持續下去………花田兒子把自己的幸福故事 灌入在花田這片土地上 希望踏入花田的你們能感受到這份感動花田兒的幸福故事:“讓你有回家的感覺”帶著遠從馬來西亞嫁到臺灣的太太回家接管爸爸的幸福花田兩個年輕人用心澆水讓花田裏的小花小草能持續的燦爛；用心微笑讓踏入花田的客人能感受到舒服與自在 他們用坦誠經營自己的異國戀 相同的也用那份坦誠經營花田 堅持不讓客人失望 兩個不曾見面的陌生人因為一條網路線的連接而創造了一段異國戀 這就是花田爸爸所謂的……緣分他們用坦誠與信任經營這段異國戀。因為距離讓故事變得更值得珍惜不一樣的開始讓兩個人找到幸福原來只需要放手一試原來只需要耐心溝通就能聽見對方原來只需要慢慢灌溉總有一天會發芽如今花田兒子與來自馬來西亞的媳婦 手牽手持續爸爸媽媽的幸福 用心澆水讓花園裏的小花能持續的燦爛用心微笑讓踏入花田的你們能感受到我們的幸福','全年無休','民宿',4.4,null,'禁用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('為楓渡假別館','臺南市','臺南市南區灣裡路62巷2號1-2樓','886-6-2628800',3000,5000,'在為楓 ~ 沿著黃金海岸海潮小徑，愜意漫步林蔭，幻想千百種愛情的模樣。在為楓 ~ 感受幸福情意氛圍縈繞，品味海洋氣息，享受片刻間靜謐的天堂。','全年無休','民宿',3.2,null,'禁用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('榮興金鬱金香酒店','臺南市','臺南市中西區民族路二段128號1至9樓','886-6-2208366',2500,3500,'赤崁樓建於1653，從西拉雅-赤崁社、荷蘭-普羅民遮城、鄭成功-東都明京承天府，台灣閩南人稱之為赤崁樓或紅毛樓。榮興RS HOTEL 2013起造，時隔360年，距離360公尺，質樸文藝風華、古老歐洲美學再現；360度蒂芬尼玻璃穹頂大堂、皇家禮賓廳、庫肯霍夫餐酒館、葛洛莉魔法空間、頂級英式套房，當達文西遇上J.K.羅琳……。Tainan Travel Key，我們以台南旅遊必遊景點為期許。','全年無休','飯店',4.5,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('香草藝術旅店','基隆市','基隆市信義區義三路6號1-5樓','886-2-24254688-91',1500,3000,'Herb Art Hotel 香草藝術旅店為基隆市第一家以藝術為主題商務旅館，提供藝文活動與資訊為主軸，並以貼心服務為 主要訴求，希望旅客享受高優質的服務。旅館坐落在基隆田寮河畔交通便利，距離廟口夜市步行大約3-5分鐘，離基 隆火車站步行約10分鐘，是您住宿基隆絕佳選擇。近年來，藝術與文化創意在台灣發展迅速，衍然已經成為與國際交流共通的語言。Herb Art Hotel 創意理念是以音樂 、繪畫、設計為基礎，並結合時尚爵士樂團Herb Jazz Band(賀伯爵士樂團)與諸多音樂藝術家們創作理念，藉由飯店 作為文化展演空間舉辦文藝活動讓飯店不只侷限於住宿，希望能將更多藝術生命力導入飯店激發出更多文化力量， 也期望與您一起激發出另一種驚奇感受！我們以原先過去欣海大飯店重新規劃裝潢，提供時尚、浪漫、藝術的空間創意、舒適嶄新的羽絨寢具、齊全便利的 設備，再加上現代化旅館管理系統，相信能讓您在基隆旅遊住宿期間，感受最貼心的服務。','全年無休','飯店',3.7,null,'啟用');
Insert into HOTEL (NAME,REGION,ADDRESS,TEL,DOUBLE_ROOM,QUADRUPLE_ROOM,DESCRIPTION,OPENTIME,TYPE,RATING,ACCOUNT,STATUS) values ('柯達大飯店','基隆市','基隆市中正區基隆市中正區義一路7號9號1-8樓','886-2-24230111',2500,5000,'新都心旅憩 City Life Traveling Mind 距離中外馳名基隆廟口徒步只需5分鐘路程的柯達大飯店(基隆店)，以四季豐富多變的特色美饌著稱，巧妙融合地方特色食材，自成飲食新文化獨有一派在地的濃烈人情味，提供數十年如一日的溫情雙手，隨時為您提供服務，是您體驗海洋都市商旅的不二選擇。精緻裝潢的客房設施，提供舒適、寧靜的空間，義大利進口衛浴、高級天鵝羽毛寢具讓您完全的放鬆並感受頂級的休憩體驗。充實的客房設施亦滿足洽公人士的商務需求。距離高速公路交流道僅約3分鐘車程，基隆火車站、客運總站亦為步行的距離內，便捷的交通網路讓您無論是商務或旅遊都非常的輕鬆。附近濱海公路、中正公園、基隆廟口、碧砂漁港、海險天門、九份及野柳都是您不可錯過的精采景點，更豐富了您的旅遊回憶。','全年無休','飯店',3.7,null,'啟用');
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
--  DDL for View H_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "H_VIEW" ("SN", "NAME", "REGION", "ADDRESS", "TYPE", "STATUS") AS 
  SELECT 
    SN, NAME, REGION, ADDRESS, TYPE, STATUS
FROM 
    Hotel
;
