<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html  lang="zh-Hant-TW">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   <script src="${pageContext.servletContext.contextPath}/static/jquery-3.5.1.js"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%--     <jsp:include page="/fragment/header.jsp" /> --%>
    
    <div style="width: 800px; height: 100px; margin: 0 auto;">
    <form id="orderHSRticket">
        車次號:<input type="text" id="idHSR">
        <br>
        <label for="startPoint" class="trainShow">起始站:</label>
        <select name="startPoint" id="startPoint" class="trainShow">
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
        <label for="destination" class="trainShow">終點站:</label>
        <select name="destination" id="destination" class="trainShow">
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
        <label for="departureDate" class="trainShow">出發日期:</label>
        <input type="date" id="departureDate" name="departureDate" min="2020-04-01" max="2020-04-30" class="trainShow">

        <input type="button" id="trainSubmit" value="返回查詢">
    </form>
    </div>


    <div id="anotherSection" style="width: 800px; height: 100px; margin: 0 auto;">
 
        <!-- 用來顯示Ajax回傳值的fieldset -->

     <fieldset>

         <legend>確認訂單</legend>

         <div id="ajaxResponse" style="width: 800px; margin: 0 auto;">
            <table id="ajaxTable" style="margin: 0 auto;">

            </table>
            <table id="ajaxTable2" style="margin: 0 auto;">

            </table>
        </div>

     </fieldset>

    </div>


    
    <script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>
    <script>
        let infoHSR = Cookies.get("HSR");
        infoHSR = infoHSR.split(",");
        
        $(document).ready(function(){
            $("#idHSR").val(infoHSR[0]);
            $("#startPoint").val(infoHSR[1]);
            $("#destination").val(infoHSR[2]);
            $("#departureDate").val(infoHSR[3]);


            let startPoint;
            let destination;
            let snSchedule;
            // $('#trainSubmit').on('click', function() {
                startPoint = $("#startPoint").val().toLowerCase();
                destination = $("#destination").val().toLowerCase();
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
                            tableData += "<tr>";
                            tableData += "<td>" + response[0][i]["idHSR"] + "</td>" +
                                         "<td>" + response[3]["departureDate"] + "</td>" +
                                         "<td>" + response[4]["startPoint"] + "</td>" + 
                                         "<td>" + response[5]["destination"] + "</td>"+ 
                                         "<td>" + response[0][i][startPoint] + "</td>" + 
                                         "<td>" + response[0][i][destination] + "</td>" + 
                                         "<td>" + response[2]["ticketNum"] + "</td>" + 
                                         "<td>" + response[2]["ticketNum"]*response[1]["price"] + "</td>" +
                                         "<td>" + '<input type="button" class="orderTicket" value="確認購票">' + "</td>";
                            tableData += "</tr>";
                            tableData2 += "<tr>";
                            tableData2 += "<td>" + "" + "</td>" +
                                          "<td>" + "姓名:"+'<input type="text" class="customerName" value="">' + "</td>"+
                                          "<td>" + "" + "</td>" +
                                          "<td>" + "電話:"+'<input type="text" class="customerName" value="">' + "</td>";
                            tableData2 += "</tr>";


                            
                            snSchedule = response[0][i]["snSchedule"];

                        }
                        //console.log(tableData);
                        $("#ajaxTable").html(tableData);
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

            $('#ticketNum').on('change', function() {
                // console.log("123");
                startPoint = $("#startPoint").val().toLowerCase();
                destination = $("#destination").val().toLowerCase();
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
                            tableData += "<tr>";
                            tableData += "<td>" + response[0][i]["idHSR"] + "</td>" +
                                         "<td>" + response[3]["departureDate"] + "</td>" +
                                         "<td>" + response[4]["startPoint"] + "</td>" + 
                                         "<td>" + response[5]["destination"] + "</td>"+ 
                                         "<td>" + response[0][i][startPoint] + "</td>" + 
                                         "<td>" + response[0][i][destination] + "</td>" + 
                                         "<td>" + response[2]["ticketNum"] + "</td>" + 
                                         "<td>" + response[2]["ticketNum"]*response[1]["price"] + "</td>" +
                                         "<td>" + '<input type="button" class="orderTicket" value="確認購票">' + "</td>";
                            tableData += "</tr>";
                            
                            snSchedule = response[0][i]["snSchedule"];

                        }
                        if(response[6]["check"] === "false")
                            tableData = "列車未行駛"
                        //console.log(tableData);
                        $("#ajaxTable").html(tableData);
                        
                        // var table = document.getElementById('ajaxTable');
                        // console.log(table.rows[0].cells[0].innerHTML);



                     },

                     //Ajax失敗後要執行的function，此例為印出錯誤訊息

                     error:function(xhr, ajaxOptions, thrownError){

                         console.log(xhr.status+"\n"+thrownError);
                     }

                 });
            });


            $('#startPoint').on('change', function() {
                // console.log("123");
                startPoint = $("#startPoint").val().toLowerCase();
                destination = $("#destination").val().toLowerCase();
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
                        console.log(response[0].length);
                         let tableData = "<thead><tr><th>列車號</th><th>出發日期</th><th>起程站</th><th>到達站</th><th>出發時間</th><th>到達時間</th><th>購票張數</th><th>總金額</th></tr></thead>";
                        for(let i = 0; i < response[0].length; i++){
                            tableData += "<tr>";
                            tableData += "<td>" + response[0][i]["idHSR"] + "</td>" +
                                         "<td>" + response[3]["departureDate"] + "</td>" +
                                         "<td>" + response[4]["startPoint"] + "</td>" + 
                                         "<td>" + response[5]["destination"] + "</td>"+ 
                                         "<td>" + response[0][i][startPoint] + "</td>" + 
                                         "<td>" + response[0][i][destination] + "</td>" + 
                                         "<td>" + response[2]["ticketNum"] + "</td>" + 
                                         "<td>" + response[2]["ticketNum"]*response[1]["price"] + "</td>" +
                                         "<td>" + '<input type="button" class="orderTicket" value="確認購票">' + "</td>";
                            tableData += "</tr>";
                            
                            snSchedule = response[0][i]["snSchedule"];

                        }
                        //console.log(tableData);
                        if(response[6]["check"] === "false")
                            tableData = "列車未行駛"
                        $("#ajaxTable").html(tableData);
                        
                        // var table = document.getElementById('ajaxTable');
                        // console.log(table.rows[0].cells[0].innerHTML);



                     },

                     //Ajax失敗後要執行的function，此例為印出錯誤訊息

                     error:function(xhr, ajaxOptions, thrownError){

                         console.log(xhr.status+"\n"+thrownError);
                     }

                 });
            });



            $('#destination').on('change', function() {
                // console.log("123");
                startPoint = $("#startPoint").val().toLowerCase();
                destination = $("#destination").val().toLowerCase();
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
                        console.log(response[0].length);
                         let tableData = "<thead><tr><th>列車號</th><th>出發日期</th><th>起程站</th><th>到達站</th><th>出發時間</th><th>到達時間</th><th>購票張數</th><th>總金額</th></tr></thead>";
                        for(let i = 0; i < response[0].length; i++){
                            tableData += "<tr>";
                            tableData += "<td>" + response[0][i]["idHSR"] + "</td>" +
                                         "<td>" + response[3]["departureDate"] + "</td>" +
                                         "<td>" + response[4]["startPoint"] + "</td>" + 
                                         "<td>" + response[5]["destination"] + "</td>"+ 
                                         "<td>" + response[0][i][startPoint] + "</td>" + 
                                         "<td>" + response[0][i][destination] + "</td>" + 
                                         "<td>" + response[2]["ticketNum"] + "</td>" + 
                                         "<td>" + response[2]["ticketNum"]*response[1]["price"] + "</td>" +
                                         "<td>" + '<input type="button" class="orderTicket" value="確認購票">' + "</td>";
                            tableData += "</tr>";
                            
                            snSchedule = response[0][i]["snSchedule"];

                        }
                        //console.log(tableData);
                        if(response[6]["check"] === "false")
                            tableData = "列車未行駛"
                        $("#ajaxTable").html(tableData);
                        
                        // var table = document.getElementById('ajaxTable');
                        // console.log(table.rows[0].cells[0].innerHTML);



                     },

                     //Ajax失敗後要執行的function，此例為印出錯誤訊息

                     error:function(xhr, ajaxOptions, thrownError){

                         console.log(xhr.status+"\n"+thrownError);
                     }

                 });
            });



            $('#departureDate').on('change', function() {
                // console.log("123");
                startPoint = $("#startPoint").val().toLowerCase();
                destination = $("#destination").val().toLowerCase();
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
                        console.log(response[0].length);
                         let tableData = "<thead><tr><th>列車號</th><th>出發日期</th><th>起程站</th><th>到達站</th><th>出發時間</th><th>到達時間</th><th>購票張數</th><th>總金額</th></tr></thead>";
                        for(let i = 0; i < response[0].length; i++){
                            tableData += "<tr>";
                            tableData += "<td>" + response[0][i]["idHSR"] + "</td>" +
                                         "<td>" + response[3]["departureDate"] + "</td>" +
                                         "<td>" + response[4]["startPoint"] + "</td>" + 
                                         "<td>" + response[5]["destination"] + "</td>"+ 
                                         "<td>" + response[0][i][startPoint] + "</td>" + 
                                         "<td>" + response[0][i][destination] + "</td>" + 
                                         "<td>" + response[2]["ticketNum"] + "</td>" + 
                                         "<td>" + response[2]["ticketNum"]*response[1]["price"] + "</td>" +
                                         "<td>" + '<input type="button" class="orderTicket" value="確認購票">' + "</td>";
                            tableData += "</tr>";
                            
                            snSchedule = response[0][i]["snSchedule"];

                        }
                        //console.log(tableData);
                        if(response[6]["check"] === "false")
                            tableData = "列車未行駛"
                        $("#ajaxTable").html(tableData);
                        
                        // var table = document.getElementById('ajaxTable');
                        // console.log(table.rows[0].cells[0].innerHTML);



                     },

                     //Ajax失敗後要執行的function，此例為印出錯誤訊息

                     error:function(xhr, ajaxOptions, thrownError){

                         console.log(xhr.status+"\n"+thrownError);
                     }

                 });
            });




            $("#ajaxTable").on("click", ".orderTicket", function(){
                var index = $(".orderTicket").index(this);
                $(".orderTicket").attr("disabled",true);
                //console.log(index);
                var table = document.getElementById('ajaxTable');
                var table2 = document.getElementById('ajaxTable2');

                var startPoint = table.rows[1].cells[2].innerHTML;
                var destination = table.rows[1].cells[3].innerHTML;
                var nums_days = table.rows[1].cells[6].innerHTML;
                var departureDate = table.rows[1].cells[1].innerHTML;
                var customerName = table2.rows[1].cells[1].children[0].value;
                var customerPhone = table2.rows[1].cells[3].children[0].value;
                // console.log(customerName);
                //console.log(table.rows[1].cells[8].children[0].value);
                $.ajax({

                     type:"POST",                    //指定http參數傳輸格式為POST

                     url: "../T_OrderServlet",        //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy

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
                         if(response["check"] === "fail"){
                            window.location="\orderFailPage.html";
                         }else if(response["check"] === "success"){
                             window.location="\orderSuccessPage.html";
                         }

                     },

                     //Ajax失敗後要執行的function，此例為印出錯誤訊息

                     error:function(xhr, ajaxOptions, thrownError){

                         console.log(xhr.status+"\n"+thrownError);
                     }

                 });
            })
        })
        

    </script>
</body>
</html>