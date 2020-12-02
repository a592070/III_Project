<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2020/10/29
  Time: 上午 09:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Restaurant</title>

<c:import url="/WEB-INF/admin/fragment/ref.jsp" />
<style>
.sp_search-1 {
	float: left;
}

.box {
	display: flex;
}

.search {
	padding-right: 30px;
}

input {
	height: 40px;
}

.sp_search {
	padding: 10px;
	float: left;
}

select {
	float: left;
}

#inputState.form-control {
	width: 200px;
	padding-left: 20px;
}

h2 {
	padding-top: 30px;
	padding-bottom: 30px;
}

.content-wrapper {
	padding-left: 50px;
	padding-top: 50px;
}
td{
	color: black;
}

.carRentalCompanyDiv{
    padding: 15px;
}
</style>

</head>


<body class="sidebar-fixed sidebar-dark header-light header-fixed"
	id="body">
	<div class="mobile-sticky-body-overlay"></div>

	<div class="wrapper">
		<c:import url="/WEB-INF/admin/fragment/sidebar.jsp" />
		<div class="page-wrapper">
			<c:import url="/WEB-INF/admin/fragment/header.jsp" />
			<div class="content-wrapper">
				<div class="box">
					<div class="search" class="form-group col-md-2">
  					<form action="<%=application.getContextPath()%>/regionSearch" method="POST">
						<span class="sp_search">車行地區</span> 
						<select name="region_name" id="inputState" class="form-control">
							<option value="">請選擇地區</option>
							<option value="基隆">基隆</option>
							<option value="新北">新北</option>
							<option value="台北">台北</option>
							<option value="桃園">桃園</option>
							<option value="新竹">新竹</option>
							<option value="苗栗">苗栗</option>
							<option value="台中">台中</option>
							<option value="彰化">彰化</option>
							<option value="南投">南投</option>
							<option value="雲林">雲林</option>
							<option value="嘉義">嘉義</option>
							<option value="台南">台南</option>
							<option value="高雄">高雄</option>
							<option value="屏東">屏東</option>
							<option value="宜蘭">宜蘭</option>
							<option value="花蓮">花蓮</option>
							<option value="台東">台東</option>
							<option value="澎湖">澎湖</option>
							<option value="金門">金門</option>
							<option value="連江">連江</option>
						</select>
						<button type="submit" class="btn btn-primary">Search</button>
						</form>   
					</div> 
 					<div class="search">
 						<form action="<%=application.getContextPath()%>/nameSearch" method="POST"> 
 						<span class="sp_search">車行名稱</span>  
						<input type="text" name="restaurant_name" placeholder="請輸入關鍵字"/>  
 						<button type="submit" class="btn btn-primary">Search</button>  
 						</form>  
					</div> 

 					<div class="search">
 					    <form action="<%=application.getContextPath()%>/usernameSearch" method="POST" > 
 						    <span class="sp_search">會員帳號</span> 
 						    <input type="text" name="username" placeholder="請輸入會員帳號" /> 
 						    <button type="submit" class="btn btn-primary">Search</button> 
                        </form> 
                    </div>

                     <div class="search">
                        <form action="CreateCarRentalCompany.controller" method="GET" > 
                            <button type="submit" class="btn btn-primary">增加租車行</button> 
                        </form> 
                    </div>

			    </div>
				<h2>租車公司列表</h2>
                <div id="carRentalCompany">
                    <table id="carRentalCompanyTable" class="table table-striped table-sm"></table>
                </div>




		    </div>


	    </div>
    </div>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" style="display:none" id="modal">
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
<div class="modal-dialog modal-dialog-centered" role="document">
 <div class="modal-content">
<div class="modal-header">
  <h5 class="modal-title" id="exampleModalLongTitle">刪除車行</h5>
  <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="close">
 <span aria-hidden="true">&times;</span>
  </button>
</div>
<div class="modal-body" id="modal-body">
  
</div>
<div class="modal-footer">
  <button type="button" class="btn btn-secondary" data-dismiss="modal" >取消</button>
  <button type="button" class="btn btn-primary" id="confirm">確認</button>
</div>
 </div>
</div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>
    <script>
        $(document).ready(function(){
            $.ajax({

                     type:"POST",                    

                     url: "carrentalcompany.controller",  

                     dataType: "json", 

                     success : function(response){
                        // console.log(response.length)
                        // console.log(response[0]["name_company"])
                        for(let i=0; i<response.length; i++){
                            var div = $('<div></div>').addClass('carRentalCompanyDiv');
                            var form = $('<form></form>').addClass('carRentalCompanyForm').attr("enctype","multipart/form-data").attr("name","myform").attr("method","POST");        

                            data = [];
                            data.push(
                            
                                $("<tr></tr>").append(
                                    $("<td></td>").text(response[i]["sn_rentalcompany"]).attr("name","sn_rentalcompany").addClass('sn_rentalcompany')
                                   ,
                                   $("<td></td>").text(response[i]["name_company"]).attr("name","name_company")
                                   ,
                                   $("<td></td>").text(response[i]["address"]).attr("name","address")
                                   ,
                                    // $("<td></td>").append(
                                    //     $("<input>").attr("value",response[i]["compantAccount"]).attr("name","compantAccount").attr("readonly","true")
                                    // ),
                                    $("<td></td>").append(
                                        $("<label>").addClass('switch switch-text switch-success switch-pill form-control-label').append(
                                            $("<input>").attr("type","checkbox").addClass('switch-input form-check-input').attr("checked","checked"),
                                            $("<span>").addClass('switch-label').attr("data-on","啟用").attr("data-off","禁用"),
                                            $("<span>").addClass('switch-handle')
                                        )
                                    ),
                                    $("<td></td>").append(
                                        $("<input>").attr("value","修改").attr("type","button").addClass('updateData btn btn-warning')
                                    ),
                                    $("<td></td>").append(
                                        $("<input>").attr("value","刪除").attr("type","button").addClass('dropData btn btn-danger')
                                    )
                                )
                                
                            );
                            $("#carRentalCompanyTable").append(data);
                            // $(".carRentalCompanyDiv").eq(i).append(form);
                            // $(".carRentalCompanyForm").eq(i).append(data);

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
                        // var form1 = $(".updateData").eq(1).parents('form');
                        // var formData = new FormData(form1[0]);
                        // console.log(formData.get('sn_rentalcompany'));
                        // console.log(formData.get('name_company'));
                        // if(formData.get('pic_rentalcompany').size != 0)
                        //     console.log(formData.get('pic_rentalcompany'));

                     },

                     //Ajax失敗後要執行的function，此例為印出錯誤訊息

                     error:function(xhr, ajaxOptions, thrownError){

                         console.log(xhr.status+"\n"+thrownError);
                     }

                 });




        })


        $("#carRentalCompany").on("click", ".updateData", function(){
            var td1 = $(this).parents('td').siblings('.sn_rentalcompany').text();
            console.log(td1)
            // var formData = new FormData(form1[0]);
            strCookies = td1;
            Cookies.set('CRC', strCookies);
            window.location="\THomepageindex.controller";

        })

        $("#carRentalCompany").on("click", ".dropData", function(){
            // var form1 = $(this).parents('form');
            var td1 = $(this).parents('td').siblings('.sn_rentalcompany').text();
            console.log(td1)
            // var formData = new FormData(form1[0]);
            $("#modal").click();
			$("#confirm").click(function(){

            $.ajax({
        
                type:"POST",   
                url: "delCarRentalCompany",        
                data: "sn_rentalcompany="+td1,
                // processData : false, 
                // contentType : false,
                dataType: "json",   

                success : (response) => {
                    console.log("haha")
                    console.log(response["check"]);
                        if(response["check"] === "rederict"){

                        }

                    if(response["check"]==="success"){
                        var table1 = $(this).parents('table').remove();
                        window.location="\Tindex.controller";
                        alert("取消成功");
                    }else{
                        alert("刪除失敗")
                    }

                    $("#close").click();

                },

                error:function(xhr, ajaxOptions, thrownError){

                    console.log(xhr.status+"\n"+thrownError);
                    $("#close").click();

                }

            });

            });
        })


    </script>

</body>
</html>
