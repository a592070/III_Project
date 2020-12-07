<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 
<html>
 
    <head>
 
        <title>Traffic</title>
 
        <meta charset="UTF-8">
 
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <!-- 樣式跑掉，將下面4行加入引入頁面 -->
	   <script src="${pageContext.servletContext.contextPath}/static/jquery-3.5.1.js"></script>
	   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            .trainShow{
                border: deeppink solid 1px;
                /* display:none; */
            }
            .trainHide{
                border: deeppink solid 1px;
                display:none;
            }
            .tmp{
                border: deeppink solid 1px;
                display:none;
            }
        </style>
 

 
    </head>
 
    <body>
    <jsp:include page="/fragment/header.jsp" />
        
 
        <div style="width: 800px; height: 100px; margin: 0 auto;">
 
        <form id="formId">
 

            <br>
            
            <label for="startPoint" class="trainShow">起始站:</label>
            <select name="startPoint" id="startPoint" class="trainShow">
                <option value="Nangang" selected>南港站</option>
                <option value="Taipei">台北站</option>
                <option value="Banqiao">板橋站</option>
                <option value="Taoyuan">桃園站</option>
                <option value="Hsinchu">新竹站</option>
                <option value="Miaoli">苗栗站</option>
                <option value="Taichung">台中站</option>
                <option value="Changhua">彰化站</option>
                <option value="Yunlin">雲林站</option>
                <option value="Chiayi">嘉義站</option>
                <option value="Tainan">台南站</option>
                <option value="Zuoying">左營站</option>
            </select>
            <label for="destination" class="trainShow">終點站:</label>
            <select name="destination" id="destination" class="trainShow">
                <option value="Nangang">南港站</option>
                <option value="Taipei">台北站</option>
                <option value="Banqiao">板橋站</option>
                <option value="Taoyuan">桃園站</option>
                <option value="Hsinchu">新竹站</option>
                <option value="Miaoli">苗栗站</option>
                <option value="Taichung">台中站</option>
                <option value="Changhua">彰化站</option>
                <option value="Yunlin">雲林站</option>
                <option value="Chiayi">嘉義站</option>
                <option value="Tainan">台南站</option>
                <option value="Zuoying" selected>左營站</option>
            </select>
            <label for="departureDate" class="trainShow">出發日期:</label>
            <input type="date" id="departureDate" name="departureDate" min="2020-04-01" max="2020-04-30" class="trainShow">
            <label for="departureTime" class="trainShow">出發時間:</label>
            <input type="time" id="departureTime" name="departureTime" class="trainShow">
            
            <!-- <br>
            <label for="rentalStarPoint" class="trainHide">租借地:</label>
            <select name="rentalStarPoint" id="rentalStarPoint" class="trainHide">
                <option value="KeelungCity">基隆市</option>
                <option value="TaipeiCity">台北市</option>
                <option value="NewTaipeiCity">新北市</option>
                <option value="TaoyuanCity">桃園市</option>
                <option value="HsinchuCounty">新竹縣</option>
                <option value="HsinchuCity">新竹市</option>
                <option value="MiaoliCounty">苗栗縣</option>
                <option value="TaichungCity">台中市</option>
                <option value="ChanghuaCounty">彰化縣</option>
                <option value="NantouCounty">南投縣</option>
                <option value="YunlinCounty">雲林縣</option>
                <option value="ChiayiCounty" selected>嘉義縣</option>
                <option value="ChiayiCity">嘉義市</option>
                <option value="TainanCity">台南市</option>
                <option value="KaohsiungCity">高雄市</option>
                <option value="PingtungCounty">屏東縣</option>
                <option value="YilanCounty">宜蘭縣</option>
                <option value="HualienCounty">花蓮縣</option>
                <option value="TaitungCounty">台東縣</option>
                <option value="PenghuCounty">澎湖縣</option>
                <option value="KinmenCounty">金門縣</option>
                <option value="LienchiangCounty">連江縣</option>
            </select> -->
            
            
            
            <input type="button" id="trainSubmit" value="查詢">
                       
 
        </form>
    </div>
        <div id="anotherSection" style="width: 800px; height: 100px; margin: 0 auto;">
 
            <!-- 用來顯示Ajax回傳值的fieldset -->
 
         <fieldset>
 
             <legend>查詢結果</legend>
 
             <div id="ajaxResponse" style="width: 800px; margin: 0 auto;">
                <table id="ajaxTable" style="margin: 0 auto;">

                </table>
            </div>
 
         </fieldset>
 
        </div> 
     <!-- 加載Ajax -->
 
     
     <script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>

 
     <!-- Ajax的測試Script -->

      <script>
          Cookies.set('HSR', 'bar')

          //在網頁加載後，對id=doAjaxBtn的Button設定click的function
          function chooseType(){
             if(document.querySelector("#transportation").value == "rentalCar"){
                 var changeTrainClass = document.querySelectorAll(".trainShow");
                 for(var i=0; i<changeTrainClass.length; i++){
                     changeTrainClass[i].className = "tmp";
                 }
                 var changeTrainClass = document.querySelectorAll(".trainHide");
                 for(var i=0; i<changeTrainClass.length; i++){
                     changeTrainClass[i].className = "trainShow";
                 }
                 var changeTrainClass = document.querySelectorAll(".tmp");
                 for(var i=0; i<changeTrainClass.length; i++){
                     changeTrainClass[i].className = "trainHide";
                 }
             }else if(document.querySelector("#transportation").value == "train"){
                 var changeTrainClass = document.querySelectorAll(".trainHide");
                 for(var i=0; i<changeTrainClass.length; i++){
                     changeTrainClass[i].className = "tmp";
                 }
                 var changeTrainClass = document.querySelectorAll(".trainShow");
                 for(var i=0; i<changeTrainClass.length; i++){
                     changeTrainClass[i].className = "trainHide";
                 }
                 var changeTrainClass = document.querySelectorAll(".tmp");
                 for(var i=0; i<changeTrainClass.length; i++){
                     changeTrainClass[i].className = "trainShow";
                 }
             }
         }
         let startPoint;
         let destination;
         $(document).ready(function(){

            $("#trainSubmit").click(function(){
             //console.log($("#formId").serialize());
              startPoint = $("#startPoint").val().toLowerCase();
              destination = $("#destination").val().toLowerCase();

            //  console.log($("#startPoint").val().toLowerCase())
                $.ajax({

                     type:"POST",                    //指定http參數傳輸格式為POST

                     url: "../HsrServlet",        //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy

                     data: $("#formId").serialize(), //要傳給目標的data為id=formId的Form其序列化(serialize)為的值，之

                                                     //內含有name的物件value

                     dataType: "json",               //目標url處理完後回傳的值之type，此列為一個JSON Object

                     //Ajax成功後執行的function，response為回傳的值

                     //此範列回傳的JSON Object的內容格式如右所示: {userName:XXX,uswerInterest:[y1,y2,y3,...]}

                     success : function(response){

                         //在id=ajaxResponse的fieldset中顯示Ajax的回傳值
                        // console.log(response.length);
                        //console.log($("#startPoint").val())
                        console.log(response[0].length);
                        let tableData = "<thead><tr><th>列車號</th><th>出發時間</th><th>抵達時間</th><th>票價</th><th>訂票</th></tr></thead>";
                        for(let i = 0; i < response[0].length; i++){
                            tableData += "<tr>";
                            tableData += "<td>" + response[0][i]["idHSR"] + "</td>" + "<td>" + response[0][i][startPoint] + "</td>" + "<td>" + response[0][i][destination] + "</td>" + "<td>" + response[1]["price"] + "</td>" + "<td>" + '<input type="button" class="orderTicket" value="點我訂票">' + "</td>";
                            tableData += "</tr>";
                        }
                        //console.log(tableData);
                        $("#ajaxTable").html(tableData);
                        
                        var table = document.getElementById('ajaxTable');
                        console.log(table.rows[0].cells[0].innerHTML);



                     },

                     //Ajax失敗後要執行的function，此例為印出錯誤訊息

                     error:function(xhr, ajaxOptions, thrownError){

                         console.log(xhr.status+"\n"+thrownError);
                     }

                 });
            
            });



         });  
            $("#ajaxTable").on("click", ".orderTicket", function(){
                var index = $(".orderTicket").index(this);
                console.log(index);
                var table = document.getElementById('ajaxTable');
               //console.log(table.rows[index+1].cells[0].innerHTML);
                //console.log($("#destination").val().toLowerCase())
                strCookies = table.rows[index+1].cells[0].innerHTML+","+startPoint+","+destination+","+$("#departureDate").val();
                Cookies.set('HSR', strCookies)
                window.location="\orderHSRticket.jsp";
                //console.log(startPoint)
            })

     </script>
 
    </body>  
 
</html>