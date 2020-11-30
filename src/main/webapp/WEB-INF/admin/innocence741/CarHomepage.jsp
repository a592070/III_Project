<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>Modify</title>

<c:import url="/WEB-INF/admin/fragment/ref.jsp" />
<style>
* {
	padding: 0;
	margin: 0;
}

.box {
	width: 900px;
	margin: 50px auto;
}

.div_img {
	width: 800px;
	height: 530px;
	margin: auto;
	overflow: hidden;
	display: flex;
	padding-bottom: 5px;
}

img {
	width: 100%;
}

.box {
	border: 1px solid gray;
}

.booking, .info, .comment {
	border: 1px solid gray;
}

h2 {
	padding: 20px;
	border-bottom: 1px solid gray;
	color:white;
}
/* div {
            border: 1px solid rgb(212, 212, 212);
        } */
.title {
	text-align: center;
	background-color: #003060;
	
}

.top {
	display: flex;
}

.booking {
	width: 300px;
	padding: 10px 0;
	line-height: 22px;
	text-align: center;
	color: #000000;
	cursor: pointer;
	/* border-bottom: solid 1.5px #f04e2f; */
} 

.info {
	width: 300px;
	padding: 10px 0;
	line-height: 22px;
	text-align: center;
	color: #000000;
	cursor: pointer;
}

 .comment {
	width: 300px;
	padding: 10px 0;
	line-height: 22px;
	text-align: center;
	color: #000000;
	cursor: pointer;
}  

.res_data {
	/*position: relative;*/
	background-color: #eeeeee;
	padding: 10px 30px;
	/* font-size: 15px; */
	/* font-weight: 400; */
	border-top: 1px solid gray;
	/* height:55px; */
}

.res_result {
	padding: 10px 30px;
}

.p_result {
	padding: 10px 30px;
	color:black;
}

.rating {
	float: left;
	padding-right: 20px;
	padding: 10px 30px;
}

.sp_rating {
	padding: 10px 30px;
	line-height: 35px;
}


h3 {
	padding: 10px 30px;
}

.modify-img {
	padding: 5px;
	margin-right: 10px;
	text-align: right;
}

.modify {
	padding: 5px;
	margin-right: 10px;
	text-align: right;
	float: right;
}
.btn.btn-primary.order{
	padding: 5px;
	margin-left:30px;
	margin-bottom: 20px;
}
.btn.btn-light{
	height:35px;
}
.div-1{
	padding: 5px;
	margin-left:10px;
	margin-bottom: 20px;
}
.modal-title{
	margin-left:10px;
}
p{
	font-size:16px;
}
pre {
    border-left: 0;
    padding: 0; 
    background: rgba(0, 0, 0, 0);
    border-radius: 0;
}
.div-back {
	margin-left: 150px;
	margin-top: 20px;
}
.modify_div {
	width: 1000px;
	text-align: center;
	margin-bottom: 50px;
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
				
				<div class="container">
					<FORM id="RHome" name="RHome" action="Tindex.controller" method="GET">		 
						<div class="div-back">
							<button type="submit" class="btn btn-primary">回租車列表</button>
						</div>
					</FORM>
		<div class="box">

			
			<div>
                <FORM method="POST" enctype="multipart/form-data" >
                    <input type="text" id="sn_rentalcompany" name="sn_rentalcompany" readonly>
                    車行名稱<input type="text" id="name_company" name="name_company" >
                    <div class="top"> </div> 
                    <p class="modify-img">
                        <label for="r-name">請選擇欲修改圖片上傳</label> 
                        <input type="file" id="pic_rentalcompany" name="pic_rentalcompany" >
                    </p>
                    <div class="div_img">                               
                        <img id="preview_pic_rentalcompany"  src="ShowCarRentalCompanyPic">
                    </div>
				
				
				
					<div>
						<h4 class="res_result">車行地址</h4>
						<p class="p_result"><textarea name="address" id="address" cols="80" rows="5"></textarea></p>
					</div>
<!-- ||||||||||||||| -->

					<div>
						<h4 class="res_result">車行簡介</h4>
						<p class="p_result"><textarea name="description" id="description" cols="80" rows="5"></textarea></p>
                    </div>                    
<!-- ||||||||||||||| -->

					<div>
						<h4 class="res_result">營業時間</h4>
						<p class="p_result"><textarea name="oprnHours" id="oprnHours" cols="80" rows="5"></textarea></p>
					</div>
<!-- ||||||||||||||| -->

					<div>
						<h4 class="res_result">聯絡電話</h4>
						<p class="p_result"><textarea name="tel" id="tel" cols="80" rows="5"></textarea></p>
                    </div>
<!-- ||||||||||||||| -->

					<div>
						<h4 class="res_result">公司帳號</h4>
						<p class="p_result"><textarea name="compantAccount" id="compantAccount" cols="80" rows="5"></textarea></p>
					</div>
<!-- ||||||||||||||| -->
                    
                    <div>
                        <!-- <h4 class="res_result">帳號狀態</h4> -->
                        <p class="p_result"><textarea name="accessible_carrentalcompany" id="accessible_carrentalcompany" cols="80" rows="5" style="display: none;"></textarea></p>
                    </div>
					

                    
				 </FORM> 


				
			</div>

		</div>
		<div class="modify_div">
			<input value="確認修改" type="button" class="updateData btn btn-warning" id="updateData">
		</div>

				 



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
  <h5 class="modal-title" id="exampleModalLongTitle">確認修改</h5>
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
        
        let sn_rentalcompany = Cookies.get("CRC");


        $(document).ready(function(){
            $.ajax({

                     type:"POST",  

                     url: "carrentalcompanyHomepage.controller", 
                     data: "sn_rentalcompany="+sn_rentalcompany,
                     dataType: "json", 

                     success : function(response){
                        // $("#sn_rentalcompany").attr("value",response[0]["sn_rentalcompany"])
                        // $("#name_company").attr("value",response[0]["name_company"])
                        // $("#address").attr("value",response[0]["address"])
                        // $("#description").attr("value",response[0]["description"])
                        // $("#oprnHours").attr("value",response[0]["oprnHours"])
                        // $("#tel").attr("value",response[0]["tel"])
                        // $("#compantAccount>").attr("value",response[0]["compantAccount"])
                        // $("#accessible_carrentalcompany").attr("value",response[0]["accessible_carrentalcompany"])

                        $("#sn_rentalcompany")[0].value=(response[0]["sn_rentalcompany"])
                        $("#name_company")[0].value=(response[0]["name_company"])
                        $("#address")[0].value=(response[0]["address"])
                        $("#description")[0].value=(response[0]["description"])
                        $("#oprnHours")[0].value=(response[0]["oprnHours"])
                        $("#tel")[0].value=(response[0]["tel"])
                        if(response[0]["compantAccount"]!=null)
                            $("#compantAccount")[0].value=(response[0]["compantAccount"])
                        $("#accessible_carrentalcompany")[0].value=(response[0]["accessible_carrentalcompany"])
                     },


                     error:function(xhr, ajaxOptions, thrownError){

                         console.log(xhr.status+"\n"+thrownError);
                     }

                 });




        })


        $("#updateData").click(function(event){
            var form1 = $(this).parents('form');
            var formData = new FormData(form1[0]);
			$("#modal").click();
			$("#confirm").click(function(){
				console.log("why")

				$.ajax({
						
					type:"POST",
					url: "update.carrentalcompany.controller",
					data: formData, 
					processData : false, 
					contentType : false,
					dataType: "json",

					success : (response) => {
						console.log("haha");
						alert("修改成功");
						$("#close").click();
					},

					error:function(xhr, ajaxOptions, thrownError){

						console.log(xhr.status+"\n"+thrownError);
						$("#close").click();

					}

				});
			});

        })


            $("#pic_rentalcompany").change(function(){

                 readURL(this);

            });



            function readURL(input){

                if(input.files && input.files[0]){

                    var reader = new FileReader();

                    reader.onload = function (e) {

                        $("#preview_pic_rentalcompany").attr('src', e.target.result);

                    }

                    reader.readAsDataURL(input.files[0]);

                }

            }

	


    </script>
</body>
</html>
