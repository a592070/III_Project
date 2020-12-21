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
<title>FUN x TAIWAN</title>

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

.btn.btn-light {
	color:lightgray;
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

						<FORM id="RHome" name="RHome" action="Tindex.controller" method="GET">		 
            <div class="div-btn div-back">
                <button type="submit" class="btn btn-primary">回租車公司首頁</button>
                <button type="button" class="btn btn-light" id="aaa">帶入資料</button>
            </div>
            
        </FORM>
				
				<div class="container">
		<div class="box">
			
			
			<div>
                <FORM method="POST" enctype="multipart/form-data" >
                    請輸入公司名稱:<input type="text" id="name_company" name="name_company" >
                    <div class="top"> </div> 
                    <p class="modify-img">
                        <label for="r-name">請選擇欲修改圖片上傳</label> 
                        <input type="file" id="pic_rentalcompany" name="pic_rentalcompany" >
                    </p>
                    <div class="div_img">                               
                        <img id="preview_pic_rentalcompany"  src="#">
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
                        <h4 class="res_result">帳號狀態</h4>
                        <p class="p_result"><textarea name="accessible_carrentalcompany" id="accessible_carrentalcompany" cols="80" rows="5">1</textarea></p>
                    </div>
                    
                    <input value="確認新增" type="button" class="updateData" id="updateData">
				 </FORM> 
				 

				
			</div>

		</div>

				 



				</div>
			</div>
 		</div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>

    <script>
        

        $(document).ready(function(){

            $("#updateData").click(function(event){
            var form1 = $(this).parents('form');
            var formData = new FormData(form1[0]);
            console.log("why")

                    $.ajax({
                        
                     type:"POST",
                     url: "create.carrentalcompany.controller",
                     data: formData, 
                     processData : false, 
                     contentType : false,
                     dataType: "json",

                     success : (response) => {
                        console.log("haha");
                        alert("修改成功");
                        window.location="\Tindex.controller";
                     },

                     error:function(xhr, ajaxOptions, thrownError){

                         console.log(xhr.status+"\n"+thrownError);
                     }

                 });

            })



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

		$("#aaa").click(function () {
			$("#name_company").val("哈哈租車行");
			$("#address").val("高雄市苓雅區凱旋二路889號");
			$("#description").val("高雄最優質租車行");
			$("#oprnHours").val("全年無休");
			$("#tel").val("07 987 9870");
		})


    </script>
</body>
</html>
