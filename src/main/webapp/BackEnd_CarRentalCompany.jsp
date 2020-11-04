<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .carRentalCompanyDiv{
            padding: 15px;
        }

        .snCol{
            display: none;
        }
    </style>
</head>
<body>

    <div id="carRentalCompany"></div>



    <script>
        $(document).ready(function(){
            $.ajax({

                     type:"POST",                    //指定http參數傳輸格式為POST

                     url: "carrentalcompany.controller",        //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy

                     dataType: "json",               //目標url處理完後回傳的值之type，此列為一個JSON Object

                     success : function(response){
                        // console.log(response.length)
                        // console.log(response[0]["name_company"])
                        for(let i=0; i<response.length; i++){
                            var div = $('<div></div>').addClass('carRentalCompanyDiv');
                            var form = $('<form></form>').addClass('carRentalCompanyForm').attr("enctype","multipart/form-data").attr("name","myform").attr("method","POST");        

                            data = [];
                            data.push(
                                $("<table></table>").append(
                                    $("<tr></tr>").append(
                                        $("<td></td>").append(
                                            $("<input>").attr("value",response[i]["sn_rentalcompany"]).attr("name","sn_rentalcompany").attr("readonly","true").attr("size",6)
                                       ),
                                       $("<td></td>").append(
                                           $("<input>").attr("value",response[i]["name_company"]).attr("name","name_company")
                                       ),
                                       $("<td></td>").append(
                                           $("<input>").attr("value",response[i]["address"]).attr("name","address")
                                       ),
                                       $("<td></td>").append(
                                           $("<input>").attr("value",response[i]["description"]).attr("name","description")
                                        ),
                                        $("<td></td>").append(
                                            $("<input>").attr("value",response[i]["oprnHours"]).attr("name","oprnHours")
                                        ),
                                        $("<td></td>").append(
                                            $("<input>").attr("value",response[i]["tel"]).attr("name","tel").attr("size",17)
                                        ),
                                        $("<td></td>").append(
                                            $("<input>").attr("value",response[i]["compantAccount"]).attr("name","compantAccount").attr("readonly","true")
                                        ),
                                        $("<td></td>").append(
                                            $("<input>").attr("value",response[i]["pic_rentalcompany"]).attr("type","file").attr("name","pic_rentalcompany")
                                        ),
                                        $("<td></td>").append(
                                            $("<input>").attr("value",response[i]["accessible_carrentalcompany"]).attr("name","accessible_carrentalcompany").attr("size",2)
                                        ),
                                        $("<td></td>").append(
                                            $("<input>").attr("value","修改").attr("type","button").addClass('updateData')
                                        )
                                    )
                                )
                            );
                            $("#carRentalCompany").append(div);
                            $(".carRentalCompanyDiv").eq(i).append(form);
                            $(".carRentalCompanyForm").eq(i).append(data);

                        }
                        //------------------------correct method-----------------------------
                        // var form1 = $('form');
                        // var formData = new FormData(form1[0]);
                        // // var form1 = document.querySelectorAll('form');
                        // // var formData = new FormData(form1[0]);
                        // console.log(formData.get('sn_rentalcompany'));
                        // console.log(formData.get('name_company'));


                        //------------------------correct method-----------------------------
                        // var form1 = $('form')[0];
                        // var formData = new FormData(form1);
                        // // var form1 = document.querySelectorAll('form');
                        // // var formData = new FormData(form1[0]);
                        // console.log(formData.get('sn_rentalcompany'));
                        // console.log(formData.get('name_company'));

                        //------------------------correct method-----------------------------
                        var form1 = $(".updateData").eq(1).parents('form');
                        var formData = new FormData(form1[0]);
                        console.log(formData.get('sn_rentalcompany'));
                        console.log(formData.get('name_company'));
                        if(formData.get('pic_rentalcompany').size != 0)
                            console.log(formData.get('pic_rentalcompany'));

                     },

                     //Ajax失敗後要執行的function，此例為印出錯誤訊息

                     error:function(xhr, ajaxOptions, thrownError){

                         console.log(xhr.status+"\n"+thrownError);
                     }

                 });




        })


        $("#carRentalCompany").on("click", ".updateData", function(){
            var form1 = $(this).parents('form');
            var formData = new FormData(form1[0]);
            console.log("why")

                    $.ajax({
                        
                     type:"POST",                    //指定http參數傳輸格式為POST
                     url: "update.carrentalcompany.controller",        //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
                     data: formData, //要傳給目標的data為id=formId的Form其序列化(serialize)為的值，之
                     processData : false, 
                     contentType : false,
                     dataType: "json",               //目標url處理完後回傳的值之type，此列為一個JSON Object

                     success : (response) => {
                        console.log("haha");
                        // console.log(response["check"]);
                        //  if(response["check"] === "rederict"){
                        //     window.location="../rambo0021/login.jsp"
                        //  }

                        // console.log($(this).parent().parent().children("td.snCol").text())

                        // if(response["check"]==="success"){
                        //     if($(this).parent().parent().siblings("tr").length===0){
                        //         // $(this).parent().parent().siblings().remove();
                        //         $(this).parent().parent().siblings().remove();
                        //         $(this).parent().parent().remove();
                        //     }else{
                        //         $(this).parent().parent().remove();
                        //     }
                        //     alert("取消成功");
                        // }else{
                        //     alert("刪除失敗")
                        // }


                     },

                     //Ajax失敗後要執行的function，此例為印出錯誤訊息

                     error:function(xhr, ajaxOptions, thrownError){

                         console.log(xhr.status+"\n"+thrownError);
                     }

                 });

            })


    </script>
</body>
</html>