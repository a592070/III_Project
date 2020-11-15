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
<title>Create</title>

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
	height: 35px;
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
					action="<%=pageContext.getServletContext().getContextPath()%>/Restaurant"
					method="GET">
					<div class="div-back">
						<button type="submit" class="btn btn-primary">回餐廳列表</button>
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
									<img id="preview_Rpic" src="">
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
									<h4 class="res_result">請輸入餐廳名稱</h4>
									<p class="p_result">
										<textarea name="name" id="name" cols="80" rows="5"></textarea>
									</p>
								</div>

								<div>
									<h4 class="res_data">餐廳地點</h4>
								</div>

								<div>
									<h4 class="res_result">請選擇餐廳地區</h4>
									<p class="p_result">
							<select name="region" id="region" class="form-control">
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
										<textarea name="username" id="username" cols="80" rows="5"></textarea>
									</p>
								</div>

							</FORM>
							
							</div>

					</div>

					<div class="modify_div">
						<button class="btn btn-warning" name="confirm" value="confrim"
							onclick="confrimModify()">確認新增</button>

					</div>

					<script type="text/javascript"> 
					 function confrimModify(){ 
						 if (confirm("確定新增餐聽 ? ") ) { 
								document.forms["modifyR"].action="<%=application.getContextPath()%>/CreateRestaurant";
								document.forms["modifyR"].method = "POST";
								document.forms["modifyR"].submit();
								
								return;
							} else {
								return;
							}
						}

			
						
					</script>


				</div>
			</div>
		</div>
	</div>


</body>
</html>
