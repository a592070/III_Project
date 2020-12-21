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
	margin: 20px auto;
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
	color: white;
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
	color: black;
	clear:both;
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

.btn.btn-primary.order {
	padding: 5px;
	margin-left: 30px;
	margin-bottom: 20px;
}

.btn.btn-light {
	color:lightgray;
}


.div-1 {
	padding: 5px;
	margin-left: 10px;
	margin-bottom: 20px;
}

.modal-title {
	margin-left: 10px;
}

p {
	font-size: 16px;
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
.form-control{
	width: 650px;
}

#must_have.res_result{
	padding-right:0;
 	float:left; 
}
#idsp{
	float:left; 
	color:red;
	font-size:13px;
	font-style:italic;
}
.d_flex{
 	display: flex;
 	align-items: center;
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

				<FORM id="RHome" name="RHome"
					action="<%=pageContext.getServletContext().getContextPath()%>/admin/Restaurant"
					method="GET">
					<div class="div-back">
						<button type="submit" class="btn btn-primary">回餐廳列表</button>
						<button type="button" class="btn btn-light" id="putdata" onclick="insertdata()">帶入資料</button>
					</div>
				</FORM>


				<div class="container">
				
				
					<div class="box">
						
						
							<div>
								<h2 class="title"></h2>
								<div class="top"></div>
								
								<FORM  id="modifyR" name="modifyR" method="POST" enctype="multipart/form-data">
								<p class="modify-img">
									<label for="r-name">請選擇封面照圖片上傳</label> 
									<input type="file" id="pic" name="pic">
			<!-- 					<button type="submit" class="btn btn-light">修改</button> -->
								</p>
								<div class="div_img">
									<img id="preview_Rpic" src="<%=application.getContextPath()%>/assets/img/iring29/Restaurant_img.png">
								</div>
								
								<script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>
								<script>
								$("#pic").change(function(){
					                 readURL(this);
					            });
					            function readURL(input){
					                if(input.files && input.files[0]){
					                    var reader = new FileReader();
					                    reader.onload = function (e) {
					                        $("#preview_Rpic").attr('src', e.target.result);
					                    }
					                    reader.readAsDataURL(input.files[0]);
					                }
					            }
								</script>

								<div>
									<h4 class="res_data">餐廳名稱</h4>
								</div>
								<div>
									<div class="d_flex"><h4 class="res_result" id="must_have">請輸入餐廳名稱</h4><span id="idsp">&nbsp;*必填</span></div>
									<p class="p_result">
										<textarea name="name" id="name" cols="80" rows="5" onblur="checkdata()"></textarea>
									</p>
								</div>

								<div>
									<h4 class="res_data">餐廳地點</h4>
								</div>

								<div>
									<div class="d_flex"><h4 class="res_result" id="must_have">請選擇餐廳地區</h4><span id="idsp">&nbsp;*必填</span></div>
									<p class="p_result">
							<select name="region" id="region" class="form-control" onblur="checkdata()">
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
							
									</p>
								</div>

								<div>
									<h4 class="res_result">請輸入餐廳完整地址</h4>
									<p class="p_result">
										<textarea name="address" id="address" cols="80" rows="5"></textarea>
									</p>
								</div>
								<div>
									<h4 class="res_result">請輸入交通方式</h4>
									<p class="p_result">
										<textarea name="transportation" id="transportation" cols="80" rows="5"></textarea>
									</p>
								</div>

								<div>
									<h4 class="res_data">菜色介紹</h4>
								</div>
								<div>
									<h4 class="res_result">請輸入適合聚餐類型</h4>
									<p class="p_result">
										<textarea name="serviceinfo" id="serviceinfo" cols="80" rows="5" 
										placeholder="例如：朋友聚餐、家庭聚餐..."></textarea>
									</p>
								</div>
								<div>
									<h4 class="res_result">請輸入料理種類</h4>
									<p class="p_result">
										<textarea name="type" id="type" cols="80" rows="5"
										placeholder="例如：西式料理、中式料理..."></textarea>
									</p>
								</div>


								<div>
									<h4 class="res_data">餐廳資訊</h4>
								</div>
								<div>
									<h4 class="res_result">請輸入營業時間</h4>
									<p class="p_result">
										<textarea name="opentime" id="opentime" cols="80" rows="5"></textarea>
									</p>
								</div>
								<div>
									<h4 class="res_result">請輸入餐廳描述</h4>
									<p class="p_result">
										<textarea name="description" id="description" cols="80" rows="5"></textarea>
									</p>
								</div>
								
								

								<div>
									<h4 class="res_data">餐廳使用者帳號</h4>
								</div>
								
								<div>
									<p class="p_result">
										<span id="checkid"></span><br>
										<textarea name="username" id="userName" cols="80" rows="5" onblur="ajaxusr()"></textarea>
									</p>
								</div>

							</FORM>
							
							</div>

					</div>

<!-- 					<div class="modify_div"> -->
<!-- 						<button class="btn btn-warning" id="confirm" name="confirm" value="confrim" -->
<!-- 							onclick="confrimModify()" disabled="">確認新增</button> -->
<!-- 					</div> -->
										<div class="modify_div">
											<!-- Button trigger modal -->
											<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#createR"  id="confirm" name="confirm" value="confrim"  disabled="">
											  新增餐廳
											</button>
										</div>

											<!-- Modal -->
											<div class="modal fade" id="createR" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
 											 <div class="modal-dialog modal-dialog-centered" role="document">
  											  <div class="modal-content">
 											     <div class="modal-header">
 											       <h5 class="modal-title" id="exampleModalLabel">新增提醒</h5>
 											       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
  											        <span aria-hidden="true">&times;</span>											
  											      </button>											
  											    </div>
  											    <div class="modal-body">
  											      是否確認新增餐廳資料？
     											</div>											
 											     <div class="modal-footer">
   											     <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
   											     <button type="button" class="btn btn-primary" onclick="confrimModify()">確認</button>
   											   </div>
  											  </div>
  											</div>
											</div>
					

					<script type="text/javascript"> 
					 function checkdata(){
						 let name = document.getElementById("name").value;
						 let region = document.getElementById("region").value;
						 console.log("name = "+ name)
						 console.log("region = "+ region)
						 if(name != "" && region != ""){
							 	console.log("in")
								document.getElementById("confirm").disabled = false;
							 }
						 }
					 function insertdata(){
						 console.log("in data")
 						 document.getElementById("name").value = "麥當當";
 						 document.getElementById("region")[4].selected = "selected";
 						 document.getElementById("address").value = "桃園市桃園區中正路50號";
 						 document.getElementById("transportation").value = "";
 						 document.getElementById("serviceinfo").value = "浪漫約會, 商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐, 生日慶祝";
 						 document.getElementById("type").value = "西式料理";
 						 document.getElementById("opentime").value = "全年無休";
 						 document.getElementById("description").value = "經典、歷史悠久的速食連鎖店，以漢堡、薯條與奶昔聞名";
 						 document.getElementById("confirm").disabled = false;
						 }
					 
					 function confrimModify(){ 
								document.forms["modifyR"].action="<%=application.getContextPath()%>/admin/CreateRestaurant";
								document.forms["modifyR"].method = "POST";
								document.forms["modifyR"].submit();
						}

					</script>
					
					
		<script>
        function ajaxusr() {
            let username = document.getElementById("userName").value;
              $.ajax(
                    {
                        type: 'POST',
                        data: { "userName": username },
                        url: '${pageContext.servletContext.contextPath}/admin/checkUser',
                        dataType: 'json',
                        success:function(response){
                            checkusr(response);                   
                        }
                    }
                )
            
        }function checkusr(response){
            console.log(response)
            let username = document.getElementById("userName").value;
            let sp = document.getElementById("checkid");
            if (username == "") {
            	console.log("userName = "+document.getElementById("userName").value)
            	document.getElementById("userName").value="";
                sp.innerHTML = "請注意，帳號沒有填寫喔"
                sp.style.color = "red";
                sp.style.fontSize = "13px";
                sp.style.fontStyle = "italic";
                document.getElementById("confirm").disabled = false;
            }else if(!response){
                sp.innerHTML = "帳號不存在，請重新輸入"
                sp.style.color = "red";
                sp.style.fontSize = "13px";
                sp.style.fontStyle = "italic";
                document.getElementById("confirm").disabled = true;

            }else{
                console.log("response = "+response)
            	console.log(document.getElementById("userName").value);
            	sp.innerHTML = "";
            	document.getElementById("confirm").disabled = false;
                }

        }
        </script>
		
				</div>
			</div>
		</div>
	</div>


</body>
</html>
