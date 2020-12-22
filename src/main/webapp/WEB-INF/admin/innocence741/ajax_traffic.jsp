<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>FUN x TAIWAN</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<c:import url="/WEB-INF/admin/fragment/azaz4498_ref/preview_ref.jsp" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href='//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css' rel='stylesheet'></link>
<style>
  .modal-dialog {
    max-width: 800px;
    margin: 1.75rem auto;
  }
</style>
  </head>
  <body>
	<c:import url="/WEB-INF/admin/fragment/nav.jsp" />
  <script>
    $(".nav-shop__circle").html('${cartnum}');
//     console.log($(".nav-shop__circle").val());
    console.log("nu = " + ${cartnum});
// 	   console.log("num");
    </script>

    
    <div class="hero-wrap js-fullheight" style="background-image: url('https://i.imgur.com/qBul5jw.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">Fun x 台灣</a></span> </p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">享受台灣交通之便利</h1>
          </div>
        </div>
      </div>
    </div>


    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
        	<div class="col-lg-3 sidebar">
        		<div class="sidebar-wrap bg-light ftco-animate">
        			<h3 class="heading mb-4">訂車票</h3>
        			<form id="formId">
        				<div class="fields">

		              <div class="form-group">
		                <div class="select-wrap one-third">
							<label for="startPoint" class="trainShow">起始站:</label>
						<!-- <div class="icon"><span class="ion-ios-arrow-down"></span></div> -->
                        <select name="startPoint" id="startPoint" class="trainShow form-control">
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
	                  </div>
					  </div>
					  
		              <div class="form-group">
		                <div class="select-wrap one-third">
							<label for="destination" class="trainShow">終點站:</label>
							<!-- <div class="icon"><span class="ion-ios-arrow-down"></span></div> -->
						<select name="destination" id="destination" class="trainShow form-control">
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
	                  </div>
		              </div>

		              <div class="form-group">
						<label for="departureDate" class="trainShow">出發日期:</label>
						<input type="date" id="departureDate" name="departureDate" min="2020-12-25" max="2021-01-08" class="trainShow form-control">
					</div>


		              <div class="form-group">
		                <input type="button" id="trainSubmit" value="查詢" class="btn btn-primary py-3 px-5">
		              </div>
		            </div>
	            </form>
				</div>
				

          </div>
          <div class="col-lg-9">
          	<div class="row">

				<div id="anotherSection" style="width: 800px; height: 650px; margin: 0 auto;">
 
					<!-- 用來顯示Ajax回傳值的fieldset -->
		 
				 <fieldset>
		 
<!-- 					 <legend>查詢結果</legend> -->
		 
					 <div id="ajaxResponse" style="width: 800px; margin: 0 auto;">
						<!-- <table id="ajaxTable" style="margin: 0 auto;" class="table table-striped table-sm">
							<thead><tr><th>列車號</th><th>出發時間</th><th>抵達時間</th><th>票價</th><th>訂票</th></tr></thead>
						</table> -->
					</div>
		 
				 </fieldset>
		 
				</div> 

          	</div>

          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->



    <!-- Modal -->
<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" style="width:1000px">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">確認購票</h5>
        <button type="button" class="btn btn-secondary" id="abc">帶入資料</button>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div style="width: 1800px; height: 100px; margin: 0 auto;">
          <form id="orderHSRticket">
              車次號:<input type="text" id="idHSR">
              <br>
              <label for="startPoint2" class="trainShow">起始站:</label>
              <select name="startPoint2" id="startPoint2" class="trainShow">
                  <option value="nangang" selected>南港站</option>
                  <option value="taipei">台北站</option>
                  <option value="banqiao">板橋站</option>
                  <option value="taoyuan">桃園站</option>
                  <option value="hsinchu">新竹站</option>
                  <option value="miaoli">苗栗站</option>
                  <option value="taichung">台中站</option>
                  <option value="changhua">彰化站</option>
                  <option value="yunlin">雲林站</option>
                  <option value="chiayi">嘉義站</option>
                  <option value="tainan">台南站</option>
                  <option value="zuoying">左營站</option>
              </select>
              <label for="destination2" class="trainShow">終點站:</label>
              <select name="destination2" id="destination2" class="trainShow">
                  <option value="nangang">南港站</option>
                  <option value="taipei">台北站</option>
                  <option value="banqiao">板橋站</option>
                  <option value="taoyuan">桃園站</option>
                  <option value="hsinchu">新竹站</option>
                  <option value="miaoli">苗栗站</option>
                  <option value="taichung">台中站</option>
                  <option value="changhua">彰化站</option>
                  <option value="yunlin">雲林站</option>
                  <option value="chiayi">嘉義站</option>
                  <option value="tainan">台南站</option>
                  <option value="zuoying" selected>左營站</option>
              </select>
              <label for="ticketNum" class="trainShow">購票張數:</label>
              <select name="ticketNum" id="ticketNum" class="trainShow">
                  <option value="1" selected>1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
              </select>
              <br>
              <label for="departureDate2" class="trainShow">出發日期:</label>
              <input type="date" id="departureDate2" name="departureDate2" min="2020-04-01" max="2020-04-30" class="trainShow">
      
              <input type="button" id="trainSubmit" value="返回查詢">
          </form>
          </div>

          <div id="anotherSection" style="width: 1800px; height: 150px; margin: 0 auto;">
 
            <!-- 用來顯示Ajax回傳值的fieldset -->
    
         <fieldset>
    
             <legend>確認訂單</legend>
    
             <div id="ajaxResponse" style="width: 700px;">
                <table id="ajaxTable3" class="table table-striped table-sm">
    
                </table>
                <table id="ajaxTable2">
    
                </table>
            </div>
    
         </fieldset>
    
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="ccc">取消</button>
        <button type="button" class="btn btn-primary" id="shoppingCart">加入購物車</button>
      </div>
    </div>
  </div>
</div>
    
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
  <c:import url="/WEB-INF/admin/fragment/footer.jsp"/> 
  <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" />


<!--   <script src="js/jquery.min.js"></script> -->
<!--   <script src="js/jquery-migrate-3.0.1.min.js"></script> -->
<!--   <script src="js/popper.min.js"></script> -->
<!--   <script src="js/bootstrap.min.js"></script> -->
<!--   <script src="js/jquery.easing.1.3.js"></script> -->
<!--   <script src="js/jquery.waypoints.min.js"></script> -->
<!--   <script src="js/jquery.stellar.min.js"></script> -->
<!--   <script src="js/owl.carousel.min.js"></script> -->
<!--   <script src="js/jquery.magnific-popup.min.js"></script> -->
<!--   <script src="js/aos.js"></script> -->
<!--   <script src="js/jquery.animateNumber.min.js"></script> -->
<!--   <script src="js/bootstrap-datepicker.js"></script> -->
<!--   <script src="js/jquery.timepicker.min.js"></script> -->
<!--   <script src="js/scrollax.min.js"></script> -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<!--   <script src="js/google-map.js"></script> -->
<!--   <script src="js/main.js"></script> -->
  <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" />


        <script src='//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js'></script>

  
  <script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>
   
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
         let snSchedule;
         $(document).ready(function(){

            $("#trainSubmit").click(function(){
             //console.log($("#formId").serialize());
              startPoint = $("#startPoint").val().toLowerCase();
              destination = $("#destination").val().toLowerCase();

            //  console.log($("#startPoint").val().toLowerCase())
                $.ajax({

                     type:"POST",                    //指定http參數傳輸格式為POST

                     url: "HsrServlet",        //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy

                     data: $("#formId").serialize(), //要傳給目標的data為id=formId的Form其序列化(serialize)為的值，之

                                                     //內含有name的物件value

                     dataType: "json",               //目標url處理完後回傳的值之type，此列為一個JSON Object

                     //Ajax成功後執行的function，response為回傳的值

                     //此範列回傳的JSON Object的內容格式如右所示: {userName:XXX,uswerInterest:[y1,y2,y3,...]}

                     success : function(response){
                       $("#ajaxResponse").empty();
                        var ajaxTable1 = $('<table></table>').attr('id','ajaxTable');
                        $("#ajaxResponse").append(ajaxTable1);
                         //在id=ajaxResponse的fieldset中顯示Ajax的回傳值
                        // console.log(response.length);
                        //console.log($("#startPoint").val())
                        console.log(response[0].length);
                        let tableData = "<thead><tr><th>列車號</th><th>出發時間</th><th>抵達時間</th><th>票價</th><th>訂票</th></tr></thead>";
                        for(let i = 0; i < response[0].length; i++){
                            tableData += "<tr>";
                            tableData += "<td>" + response[0][i]["idHSR"] + "</td>" + "<td>" + response[0][i][startPoint] + "</td>" + "<td>" + response[0][i][destination] + "</td>" + "<td>" + response[1]["price"] + "</td>" + "<td>" + '<input type="button" class="orderTicket btn btn-primary" value="點我訂票" data-toggle="modal" data-target="#exampleModalLong">' + "</td>";
                            tableData += "</tr>";
                        }
                        //console.log(tableData);
                        $("#ajaxTable").html(tableData);
                        
                        var table = document.getElementById('ajaxTable');
                        console.log(table.rows[0].cells[0].innerHTML);


                        $('#ajaxTable').DataTable({
                          language: {
                            "lengthMenu": "顯示 _MENU_ 筆資料",
                            "sProcessing": "處理中...",
                            "sZeroRecords": "没有匹配结果",
                            "sInfo": "目前有 _MAX_ 筆資料",
                            "sInfoEmpty": "目前共有 0 筆紀錄",
                            "sInfoFiltered": " ",
                            "sInfoPostFix": "",
                            "sSearch": "尋找:",
                            "sUrl": "",
                            "sEmptyTable": "尚未有資料紀錄存在",
                            "sLoadingRecords": "載入資料中...",
                            "sInfoThousands": ",",
                            "oPaginate": {
                                "sFirst": "首頁",
                                "sPrevious": "上一頁",
                                "sNext": "下一頁",
                                "sLast": "末頁"
                            },
                            "order": [[0, "desc"]],
                            "oAria": {
                                "sSortAscending": ": 以升序排列此列",
                                "sSortDescending": ": 以降序排列此列"
                            }
                          }
                        });
                     },

                     //Ajax失敗後要執行的function，此例為印出錯誤訊息

                     error:function(xhr, ajaxOptions, thrownError){

                         console.log(xhr.status+"\n"+thrownError);
                     }

                 });
                
            });



         });  
            $("#ajaxResponse").on("click", ".orderTicket", function(){
                var index = $(".orderTicket").index(this);
                console.log(index);
                var table = document.getElementById('ajaxTable');
               //console.log(table.rows[index+1].cells[0].innerHTML);
                //console.log($("#destination").val().toLowerCase())
                strCookies = table.rows[index+1].cells[0].innerHTML+","+startPoint+","+destination+","+$("#departureDate").val();
                Cookies.set('HSR', strCookies)
                // window.location="\orderHSRticket.controller";
                //console.log(startPoint)



                let infoHSR = Cookies.get("HSR");
                infoHSR = infoHSR.split(",");
                console.log("infoHSR[1]="+infoHSR[1])
                $("#idHSR").val(infoHSR[0]);
                $("#startPoint2").val(infoHSR[1]);
                $("#destination2").val(infoHSR[2]);
                $("#departureDate2").val(infoHSR[3]);

//                 let snSchedule;
                // $('#trainSubmit').on('click', function() {
                startPoint = $("#startPoint2").val().toLowerCase();
                destination = $("#destination2").val().toLowerCase();
                $.ajax({

                     type:"POST",                    //指定http參數傳輸格式為POST

                     url: "../orderHSRticketSrevlet",        //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy

                     data: $("#orderHSRticket").serialize()+"&idHSR="+$("#idHSR").val(), //要傳給目標的data為id=formId的Form其序列化(serialize)為的值，之

                                                     //內含有name的物件value

                     dataType: "json",               //目標url處理完後回傳的值之type，此列為一個JSON Object

                     success : function(response){
                    	 console.log(response["check"]);
                         if(response["check"] === "rederict"){
//                         	 console.log("112233445566");
                             window.location="../rambo0021/login.jsp"
                         }
                        //  console.log("123123")
                         //在id=ajaxResponse的fieldset中顯示Ajax的回傳值
                        // console.log(response.length);
                        //console.log($("#startPoint").val())
                        console.log(response[0].length);
                         let tableData = "<thead><tr><th>列車號</th><th>出發日期</th><th>起程站</th><th>到達站</th><th>出發時間</th><th>到達時間</th><th>購票張數</th><th>總金額</th></tr></thead>";
                         let tableData2 = "<thead><tr><th>請填寫訂購人資訊</th></tr></thead>";
                        for(let i = 0; i < response[0].length; i++){
                          let a = response[4]["startPoint"];
                          let b = response[5]["destination"];
                          if(a==="nangang")
                            a="南港站";
                          else if(a==="taipei")
                            a="台北站";
                          else if(a==="banqiao")
                            a="板橋站";
                          else if(a==="taoyuan")
                            a="桃園站";
                          else if(a==="hsinchu")
                            a="新竹站";
                          else if(a==="miaoli")
                            a="苗栗站";
                          else if(a==="taichung")
                            a="台中站";
                          else if(a==="changhua")
                            a="彰化站";
                          else if(a==="yunlin")
                            a="雲林站";
                          else if(a==="chiayi")
                            a="嘉義站";
                          else if(a==="tainan")
                            a="台南站";
                          else if(a==="zuoying")
                            a="左營站";


                          if(b==="nangang")
                            b="南港站";
                          else if(b==="taipei")
                            b="台北站";
                          else if(b==="banqiao")
                            b="板橋站";
                          else if(b==="taoyuan")
                            b="桃園站";
                          else if(b==="hsinchu")
                            b="新竹站";
                          else if(b==="miaoli")
                            b="苗栗站";
                          else if(b==="taichung")
                            b="台中站";
                          else if(b==="changhua")
                            b="彰化站";
                          else if(b==="yunlin")
                            b="雲林站";
                          else if(b==="chiayi")
                            b="嘉義站";
                          else if(b==="tainan")
                            b="台南站";
                          else if(b==="zuoying")
                            b="左營站";


                            tableData += "<tr>";
                            tableData += "<td>" + response[0][i]["idHSR"] + "</td>" +
                                         "<td>" + response[3]["departureDate"] + "</td>" +
                                         "<td>" + a + "</td>" + 
                                         "<td>" + b + "</td>"+ 
                                         "<td>" + response[0][i][startPoint] + "</td>" + 
                                         "<td>" + response[0][i][destination] + "</td>" + 
                                         "<td>" + response[2]["ticketNum"] + "</td>" + 
                                         "<td>" + response[2]["ticketNum"]*response[1]["price"] + "</td>" +
                                         "<td>" + '<input type="button" class="orderTicket btn btn-primary" value="確認購票">' + "</td>";
                            tableData += "</tr>";
                            tableData2 += "<tr>";
                            tableData2 += "<td>" + "" + "</td>" +
                                          "<td>" + "姓名:"+'<input type="text" class="customerName" value="" id="haha1">' + "</td>"+
                                          "<td>" + "" + "</td>" +
                                          "<td>" + "電話:"+'<input type="text" class="customerName" value="" id="haha2">' + "</td>";
                            tableData2 += "</tr>";


                            
                            snSchedule = response[0][i]["snSchedule"];

                        }
                        //console.log(tableData);
                        $("#ajaxTable3").html(tableData);
                        $("#ajaxTable2").html(tableData2);

                        // var table = document.getElementById('ajaxTable');
                        // console.log(table.rows[0].cells[0].innerHTML);



                     },

                     //Ajax失敗後要執行的function，此例為印出錯誤訊息

                     error:function(xhr, ajaxOptions, thrownError){

                         console.log(xhr.status+"\n"+thrownError);
                     }

                 });
            // });
            })

            $('#ticketNum').on('change', function() {
                // console.log("123");
                startPoint = $("#startPoint2").val().toLowerCase();
                destination = $("#destination2").val().toLowerCase();
                $.ajax({

                     type:"POST",                    //指定http參數傳輸格式為POST

                     url: "../orderHSRticketSrevlet",        //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy

                     data: $("#orderHSRticket").serialize()+"&idHSR="+$("#idHSR").val(), //要傳給目標的data為id=formId的Form其序列化(serialize)為的值，之

                                                     //內含有name的物件value

                     dataType: "json",               //目標url處理完後回傳的值之type，此列為一個JSON Object

                     success : function(response){
                        //  console.log("123123")
                         //在id=ajaxResponse的fieldset中顯示Ajax的回傳值
                        // console.log(response.length);
                        //console.log($("#startPoint").val())
                        console.log(response[6]["check"]);
                        console.log(response[0].length);
                         let tableData = "<thead><tr><th>列車號</th><th>出發日期</th><th>起程站</th><th>到達站</th><th>出發時間</th><th>到達時間</th><th>購票張數</th><th>總金額</th></tr></thead>";
                        for(let i = 0; i < response[0].length; i++){


                          let a = response[4]["startPoint"];
                          let b = response[5]["destination"];
                          if(a==="nangang")
                            a="南港站";
                          else if(a==="taipei")
                            a="台北站";
                          else if(a==="banqiao")
                            a="板橋站";
                          else if(a==="taoyuan")
                            a="桃園站";
                          else if(a==="hsinchu")
                            a="新竹站";
                          else if(a==="miaoli")
                            a="苗栗站";
                          else if(a==="taichung")
                            a="台中站";
                          else if(a==="changhua")
                            a="彰化站";
                          else if(a==="yunlin")
                            a="雲林站";
                          else if(a==="chiayi")
                            a="嘉義站";
                          else if(a==="tainan")
                            a="台南站";
                          else if(a==="zuoying")
                            a="左營站";


                          if(b==="nangang")
                            b="南港站";
                          else if(b==="taipei")
                            b="台北站";
                          else if(b==="banqiao")
                            b="板橋站";
                          else if(b==="taoyuan")
                            b="桃園站";
                          else if(b==="hsinchu")
                            b="新竹站";
                          else if(b==="miaoli")
                            b="苗栗站";
                          else if(b==="taichung")
                            b="台中站";
                          else if(b==="changhua")
                            b="彰化站";
                          else if(b==="yunlin")
                            b="雲林站";
                          else if(b==="chiayi")
                            b="嘉義站";
                          else if(b==="tainan")
                            b="台南站";
                          else if(b==="zuoying")
                            b="左營站";

                            tableData += "<tr>";
                            tableData += "<td>" + response[0][i]["idHSR"] + "</td>" +
                                         "<td>" + response[3]["departureDate"] + "</td>" +
                                         "<td>" + a + "</td>" + 
                                         "<td>" + b + "</td>"+ 
                                         "<td>" + response[0][i][startPoint] + "</td>" + 
                                         "<td>" + response[0][i][destination] + "</td>" + 
                                         "<td>" + response[2]["ticketNum"] + "</td>" + 
                                         "<td>" + response[2]["ticketNum"]*response[1]["price"] + "</td>" +
                                         "<td>" + '<input type="button" class="orderTicket btn btn-primary" value="確認購票">' + "</td>";
                            tableData += "</tr>";
                            
                            snSchedule = response[0][i]["snSchedule"];

                        }
                        if(response[6]["check"] === "false")
                            tableData = "列車未行駛"
                        //console.log(tableData);
                        $("#ajaxTable3").html(tableData);
                        
                        // var table = document.getElementById('ajaxTable');
                        // console.log(table.rows[0].cells[0].innerHTML);



                     },

                     //Ajax失敗後要執行的function，此例為印出錯誤訊息

                     error:function(xhr, ajaxOptions, thrownError){

                         console.log(xhr.status+"\n"+thrownError);
                     }

                 });
            });







            $("#ajaxTable3").on("click", ".orderTicket", function(){
                var index = $(".orderTicket").index(this);
                $(".orderTicket").attr("disabled",true);
                //console.log(index);
                var table = document.getElementById('ajaxTable3');
                var table2 = document.getElementById('ajaxTable2');

                console.log("---------snSchedule= " + snSchedule);
                var startPoint = table.rows[1].cells[2].innerHTML;
                var destination = table.rows[1].cells[3].innerHTML;
                var nums_days = table.rows[1].cells[6].innerHTML;
                var departureDate = table.rows[1].cells[1].innerHTML;
                var customerName = table2.rows[1].cells[1].children[0].value;
                var customerPhone = table2.rows[1].cells[3].children[0].value;
                // console.log(customerName);
                //console.log(table.rows[1].cells[8].children[0].value);


              if(destination==="南港站")
                destination="nangang";
              else if(destination==="台北站")
                destination="taipei";
              else if(destination==="板橋站")
                destination="banqiao";
              else if(destination==="桃園站")
                destination="taoyuan";
              else if(destination==="新竹站")
                destination="hsinchu";
              else if(destination==="苗栗站")
                destination="miaoli";
              else if(destination==="台中站")
                destination="taichung";
              else if(destination==="彰化站")
                destination="changhua";
              else if(destination==="雲林站")
                destination="yunlin";
              else if(destination==="嘉義站")
                destination="chiayi";
              else if(destination==="台南站")
                destination="tainan";
              else if(destination==="左營站")
                destination="zuoying";


              if(startPoint==="南港站")
                startPoint="nangang";
              else if(startPoint==="台北站")
                startPoint="taipei";
              else if(startPoint==="板橋站")
                startPoint="banqiao";
              else if(startPoint==="桃園站")
                startPoint="taoyuan";
              else if(startPoint==="新竹站")
                startPoint="hsinchu";
              else if(startPoint==="苗栗站")
                startPoint="miaoli";
              else if(startPoint==="台中站")
                startPoint="taichung";
              else if(startPoint==="彰化站")
                startPoint="changhua";
              else if(startPoint==="雲林站")
                startPoint="yunlin";
              else if(startPoint==="嘉義站")
                startPoint="chiayi";
              else if(startPoint==="台南站")
                startPoint="tainan";
              else if(startPoint==="左營站")
                startPoint="zuoying";


                $.ajax({

                     type:"POST",                    //指定http參數傳輸格式為POST

                     url: "T_OrderServlet",        //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy

                     data: {
                        //  "snSchedule" : '"' + snSchedule +'"' 
                        "snSchedule" :  snSchedule,
                        "startPoint" : startPoint,
                        "destination" : destination,
                        "nums_days" : nums_days,
                        "departureDate" : departureDate,
                        "orderType" : 0,
                        "customerName" : customerName,
                        "customerPhone" : customerPhone
                     }, //要傳給目標的data為id=formId的Form其序列化(serialize)為的值，之

                                                     //內含有name的物件value

                     dataType: "json",               //目標url處理完後回傳的值之type，此列為一個JSON Object

                     success : function(response){

                        //  console.log(response["check"]);
                        //  console.log(response["check"] === "fail")
                        //  if(response["check"] === "fail"){
                            window.location="showT_Order.controller";
                        //  }else if(response["check"] === "success"){
                        //      window.location="\orderSuccessPage.html";
                        //  }

                     },

                     //Ajax失敗後要執行的function，此例為印出錯誤訊息

                     error:function(xhr, ajaxOptions, thrownError){

                         console.log(xhr.status+"\n"+thrownError);
                     }

                 });
            })






            $('#abc').on('click', function() {
              $('#haha1').val("王曉明");
              $('#haha2').val("0915574215");
            })
            

            $('#shoppingCart').on('click', function() {
              


                //console.log(index);
                var table = document.getElementById('ajaxTable3');
                var table2 = document.getElementById('ajaxTable2');

                console.log("---------snSchedule= " + snSchedule);
                var startPoint = table.rows[1].cells[2].innerHTML;
                var destination = table.rows[1].cells[3].innerHTML;
                var nums_days = table.rows[1].cells[6].innerHTML;
                var departureDate = table.rows[1].cells[1].innerHTML;
                var customerName = table2.rows[1].cells[1].children[0].value;
                var customerPhone = table2.rows[1].cells[3].children[0].value;
                // console.log(customerName);
                //console.log(table.rows[1].cells[8].children[0].value);


              if(destination==="南港站")
                destination="nangang";
              else if(destination==="台北站")
                destination="taipei";
              else if(destination==="板橋站")
                destination="banqiao";
              else if(destination==="桃園站")
                destination="taoyuan";
              else if(destination==="新竹站")
                destination="hsinchu";
              else if(destination==="苗栗站")
                destination="miaoli";
              else if(destination==="台中站")
                destination="taichung";
              else if(destination==="彰化站")
                destination="changhua";
              else if(destination==="雲林站")
                destination="yunlin";
              else if(destination==="嘉義站")
                destination="chiayi";
              else if(destination==="台南站")
                destination="tainan";
              else if(destination==="左營站")
                destination="zuoying";


              if(startPoint==="南港站")
                startPoint="nangang";
              else if(startPoint==="台北站")
                startPoint="taipei";
              else if(startPoint==="板橋站")
                startPoint="banqiao";
              else if(startPoint==="桃園站")
                startPoint="taoyuan";
              else if(startPoint==="新竹站")
                startPoint="hsinchu";
              else if(startPoint==="苗栗站")
                startPoint="miaoli";
              else if(startPoint==="台中站")
                startPoint="taichung";
              else if(startPoint==="彰化站")
                startPoint="changhua";
              else if(startPoint==="雲林站")
                startPoint="yunlin";
              else if(startPoint==="嘉義站")
                startPoint="chiayi";
              else if(startPoint==="台南站")
                startPoint="tainan";
              else if(startPoint==="左營站")
                startPoint="zuoying";


                $.ajax({

                     type:"POST",                    //指定http參數傳輸格式為POST

                     url: "T_OrderShoppingCart",        //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy

                     data: {
                        //  "snSchedule" : '"' + snSchedule +'"' 
                        "snSchedule" :  snSchedule,
                        "startPoint" : startPoint,
                        "destination" : destination,
                        "nums_days" : nums_days,
                        "departureDate" : departureDate,
                        "orderType" : 0,
                        "customerName" : customerName,
                        "customerPhone" : customerPhone
                     }, //要傳給目標的data為id=formId的Form其序列化(serialize)為的值，之

                                                     //內含有name的物件value

                     dataType: "json",               //目標url處理完後回傳的值之type，此列為一個JSON Object

                     success : function(response){

                        //  console.log(response["check"]);
                        //  console.log(response["check"] === "fail")
                        //  if(response["check"] === "fail"){
                            // window.location="showT_Order.controller";
                        //  }else if(response["check"] === "success"){
                        //      window.location="\orderSuccessPage.html";
                        //  }

                     },

                     //Ajax失敗後要執行的function，此例為印出錯誤訊息

                     error:function(xhr, ajaxOptions, thrownError){

                         console.log(xhr.status+"\n"+thrownError);
                     }

                 });









                $(".nav-shop__circle").html('${cartnum}'+1);
            //     console.log($(".nav-shop__circle").val());
            // 	   console.log("num");

              $('#ccc').click();
              
            })


     </script>
    



    
  </body>
</html>