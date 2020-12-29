# III_Project

## 期末專題

- 注意事項
  - 禁止直接對master主分支push
  - 依照分配給個人的dev_username (ex.dev_a592070)進行push
  - 再對master進行merge
  - 有衝突必須馬上解決
  - 解決衝突後必須測試，測試有問題，立刻po上群
  
---

## 專案配置

### 結構

```
src
|-main
|	|-java
|	|	|-global	//公用配置(IndexController起始頁面、filter、listener...)
|	|	|-utils		//工具類
|	|	|-個人package
|	|		|-xxx.java
|	|
|	|-resources
|	|	|-springmvc.servlet.xml		//主要spring配置文件
|	|	|-sqlBeans.xml			//ORM相關配置
|	|	|-個人Beans.xml		      //個人spring配置文件(import進入springmvc.servlet.xml)
|	|	|
|	|	|-hibernate.cfg.xml		//hibernate配置文件，datasource:C3P0
|	|	|-log4j.properties		//log4j配置文件
|	|
|	|-webapp
|		|-WEB-INF
|			|-web.xml
|			|-admin
|				|-index.jsp		//首頁
|				|-fragment		//navbar
|				|	|-header.jsp
|				|	|-sidebar.jsp
|				|	|-ref.jsp
|				|-個人頁面
|					|-xxx.jsp
|-test	//Junit
-pom.xml
```
- **個人Beans配置請設定在 xxxBeans.xml (只有基本id(urlpattern), class, scope...等基本屬性，不配置field、constructor)**
- 重要配置設定在springmvc.servlet.xml裡面

---

## 分工

- 謝詠嘉：主頁面，套裝行程，客制化行程，關鍵字搜尋，評價系統，推薦系統
- 高之軒：登入 註冊 會員資料維護 店家資料填寫 查詢會員訂單
- 陳宇河：論壇->旅遊心得分享、廠商寫手業配置入、套裝行程使用回饋、二手旅遊商品刊登、會員已發佈文章查詢
- 黃柏澔：飯店->查詢飯店/旅館/民宿 資訊、提供訂房、飯店業者資料維護
- 鍾佳伶：餐廳->查詢飯餐廳 資訊、提供訂餐廳、餐廳業者資料維護、餐廳評價/留言
- 王柏翔：交通->查詢租車行/高鐵/台鐵 資訊、提供訂台/高鐵票、租車服務、租車行業者資料維護
![avatar](https://i.imgur.com/gZ3hYgi_d.webp?maxwidth=728&fidelity=grand)


## 分支名稱對應
- dev_a592070 詠嘉
- dev_iring29 佳伶
- dev_azaz4498 宇河
- dev_innocence741 柏翔
- dev_rambo0021 之軒
- dev_asx54630 柏澔


## git指令
```
# name、email 改成自己的
git config --global user.name "user"
git config --global user.email "user@gmail.com"
```

```
或是在(舉例路徑) C:\Users\Student\
下的.gitconfig
直接右鍵編輯加入
[user]
	name = user
	email = user@gmail.com
```
**跟上面的指令是同樣效果**


## 建立專案步驟
- 先在Eclipse下創建WEB專案
- 將MASTER主分支clone到任意資料夾
- 複製內容到專案裡
- 導入lib依賴
- 測試

## github上傳步驟
- commit
- pull from master
- push to dev_xxx
- pull merge request from dev_xxx to master
- 解決衝突
- merge

## QA
- a592070 https://hackmd.io/@dDJmilUhRLq-s4ljZ9qvWw/SyJPutDSP


## daily report 
- 第三次
https://docs.google.com/spreadsheets/d/1RvMbWgQkpJ-2rP8BFTdLKKVvNaT41qPTu8sAaTGMPyA/edit#gid=0
## web concept
https://docs.google.com/presentation/d/1bpWz1AS-grcitMZ5UtEGaHH5Zuwsy8VLRYjBXPJAsJI/edit?usp=sharing

## 參考指令大全
https://gitee.com/all-about-git
