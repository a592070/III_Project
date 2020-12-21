<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FUN x TAIWAN</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .T_OrderDiv{
            padding: 15px;
        }

        .snCol{
            display: none;
        }
    </style>
</head>
<body>
<%-- 	<jsp:include page="/fragment/header.jsp" /> --%>
    <div id="T_Order"></div>



    <script>
        $(document).ready(function(){
            $.ajax({

                     type:"POST",                    //指定http參數傳輸格式為POST

                     url: "ShowHistricalT_OrderServlet",        //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy

                     dataType: "json",               //目標url處理完後回傳的值之type，此列為一個JSON Object

                     success : function(response){
                    	 
                         console.log(response["check"]);
                         if(response["check"] === "rederict"){
//                         	 console.log("112233445566");
                             window.location="../rambo0021/login.jsp"
                         }
                        // console.log(response[0].length);
                        // console.log(response.length);
                        // console.log(response[1].length)
                        // console.log(response[1][1]["order_id"])
                        var data=["<thead><tr><th>訂單序號</th>"+
                                             "<th>下訂日期</th>"+
                                             "<th>車次號</th>"+
                                             "<th>起點站</th>"+
                                             "<th>到達站</th>"+
                                             "<th>出發日期</th>"+
                                             "<th>出發時間</th>"+
                                             "<th>票價</th>"+
                                             "<th>訂購張數</th></tr></thead>"];
                        for(let i=0; i<response.length; i++){
                            var div = $('<div></div>').addClass('T_OrderDiv');
                            var table = $('<table></table>').addClass('T_OrderTable table table-striped table-sm');
                            for(let j=0; j<response[i].length; j++){
                                let startPoint = response[i][j]["t_Order_Lists"][0]["startPoint"];
                                
                                
                                var date = new Date(response[i][j]["order_date"]);
                                Y = date.getFullYear() + '-';
                                M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
                                D = date.getDate() + ' ';
                                h = date.getHours() + ':';
                                m = date.getMinutes() + ':';
                                s = date.getSeconds();
                                //console.log(Y+M+D+'<br/>'+h+m+s);
                                TMP = Y+M+D+h+m+s;
                                console.log(TMP)

                                var date2 = new Date(response[i][j]["t_Order_Lists"][0]["deparatureDate"]);
                                Y2 = date.getFullYear() + '-';
                                M2 = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
                                D2 = date.getDate() + ' ';
                                h2 = date.getHours() + ':';
                                m2 = date.getMinutes() + ':';
                                s2 = date.getSeconds();
                                //console.log(Y2+M2+D2+'<br/>'+h2+m2+s2);
                                TMP2 = Y2+M2+D2+h2+m2+s2;
                                console.log(TMP2)

                                data.push(
                                    $("<tr></tr>").append(
                                        $("<td></td>").append(response[i][j]["order_id"]),
                                        // $("<td></td>").append(response[i][j]["order_date"]),
                                        $("<td></td>").append(TMP),
                                        //$("<td></td>").append(response[i][j]["user"]["userName"])
                                        // $("<td></td>").append(response[i][j]["t_Order_Lists"][0]["t_sn_order"])
                                        // $("<td></td>").append(response[i][j]["t_Order_Lists"][0]["orderType"]) //可抓到orderType
                                        $("<td></td>").append(response[i][j]["t_Order_Lists"][0]["highSpeedRail"]["idHSR"]),
                                        $("<td></td>").append(response[i][j]["t_Order_Lists"][0]["startPoint"]),
                                        $("<td></td>").append(response[i][j]["t_Order_Lists"][0]["destination"]),
                                        // $("<td></td>").append(response[i][j]["t_Order_Lists"][0]["deparatureDate"]),
                                        $("<td></td>").append(TMP2),
                                        $("<td></td>").append(response[i][j]["t_Order_Lists"][0]["highSpeedRail"][startPoint]),
                                        $("<td></td>").append(response[i][j]["t_Order_Lists"][0]["ticketPrice"]),
                                        $("<td></td>").append(response[i][j]["t_Order_Lists"][0]["nums_days"]),
                                        $("<td></td>").append('<input type="button" class="cancelTicket close" value="取消訂單">'),
                                        $("<td></td>").append(response[i][j]["t_Order_Lists"][0]["t_sn_order"]).addClass('snCol')

                                    )
                                )
                            }
                            $("#T_Order").append(div);
                            $(".T_OrderDiv").eq(i).append(table);
                            $(".T_OrderTable").eq(i).append(data);
                            data=["<thead><tr><th>訂單序號</th>"+
                                             "<th>下訂日期</th>"+
                                             "<th>車次號</th>"+
                                             "<th>起點站</th>"+
                                             "<th>到達站</th>"+
                                             "<th>出發日期</th>"+
                                             "<th>出發時間</th>"+
                                             "<th>票價</th>"+
                                             "<th>訂購張數</th></tr></thead>"];
                        }
                        //console.log($(".T_Order"));

                     },

                     //Ajax失敗後要執行的function，此例為印出錯誤訊息

                     error:function(xhr, ajaxOptions, thrownError){

                         console.log(xhr.status+"\n"+thrownError);
                     }

                 });
        })




        $("#T_Order").on("click", ".cancelTicket", function(){
                // var index = $(".cancelTicket").index(this);
                //console.log("index= " + index);
                console.log($(this).parent().parent().children("td.snCol").text())

                    $.ajax({
                        
                     type:"POST",                    //指定http參數傳輸格式為POST

                     url: "../cancelT_Order_ListServlet",        //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy

                     data: "t_sn_order=" + $(this).parent().parent().children("td.snCol").text(), //要傳給目標的data為id=formId的Form其序列化(serialize)為的值，之

                                                     //內含有name的物件value

                     dataType: "json",               //目標url處理完後回傳的值之type，此列為一個JSON Object

                     //Ajax成功後執行的function，response為回傳的值

                     //此範列回傳的JSON Object的內容格式如右所示: {userName:XXX,uswerInterest:[y1,y2,y3,...]}

                     success : (response) => {

                        // console.log($(this).parent().parent().children("td.snCol").text())

                        if(response["check"]==="success"){
                            if($(this).parent().parent().siblings("tr").length===0){
                                // $(this).parent().parent().siblings().remove();
                                $(this).parent().parent().siblings().remove();
                                $(this).parent().parent().remove();
                            }else{
                                $(this).parent().parent().remove();
                            }
                            alert("取消成功");
                        }else{
                            alert("刪除失敗")
                        }


                     },

                     //Ajax失敗後要執行的function，此例為印出錯誤訊息

                     error:function(xhr, ajaxOptions, thrownError){

                         console.log(xhr.status+"\n"+thrownError);
                     }

                 });


                // console.log($(this).parent().parent().children("td.snCol").text());

                // console.log($(this).parent().parent().siblings("tr").length===0)

                // if($(this).parent().parent().siblings("tr").length===0){
                //     $(this).parent().parent().siblings().remove();
                //     $(this).parent().parent().remove();
                // }else{
                //     $(this).parent().parent().remove();
                // }

            })
    </script>
</body>
</html>