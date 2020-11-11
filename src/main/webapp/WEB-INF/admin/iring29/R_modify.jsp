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
								<h2 class="title">${RBean.name}</h2>
								<div class="top"></div>

				<FORM  id="modifyR" name="modifyR" method="POST" enctype="multipart/form-data">
								<p class="modify-img">
									<label for="r-name">請選擇欲修改圖片上傳</label> 
									<input type="file" id="pic" name="pic">
										<Input type='hidden' name='r_sn' value='${RBean.r_sn}'>
									<!-- 					<button type="submit" class="btn btn-light">修改</button> -->
								</p>
								<div class="div_img">
									<img id="preview_Rpic"
										src="<%=application.getContextPath()%>/ShowPic">
								</div>

								<script>
									$("#pic").change(function() {
										readURL(this);
										console.log("in modify pic")
									});
									function readURL(input) {
										console.log("in modify 2")
										console.log(input.files && input.files[0])
										if (input.files && input.files[0]) {
											var reader = new FileReader();
											reader.onload = function(e) {
												$("preview_Rpic").attr('src',e.target.result);
											}
											reader.readAsDataURL(input.files[0]);
										}
									}
								</script>

								<div>
									<h4 class="res_data">餐廳地點</h4>
								</div>

								<div>
									<h4 class="res_result">地區</h4>
									<p class="p_result">
										<textarea name="region" id="region" cols="80" rows="5">${RBean.region}</textarea>
									</p>
								</div>

								<div>
									<h4 class="res_result">地址</h4>
									<p class="p_result">
										<textarea name="address" id="address" cols="80" rows="5">${RBean.address}</textarea>
									</p>
								</div>
								<div>
									<h4 class="res_result">交通方式</h4>
									<p class="p_result">
										<textarea name="transportation" id="transportation" cols="80"
											rows="5">${RBean.transportation}</textarea>
									</p>
								</div>

								<div>
									<h4 class="res_data">菜色介紹</h4>
								</div>
								<div>
									<h4 class="res_result">適合聚餐類型</h4>
									<p class="p_result">
										<textarea name="serviceinfo" id="serviceinfo" cols="80"
											rows="5">${RBean.serviceinfo}</textarea>
									</p>
								</div>
								<div>
									<h4 class="res_result">料理種類</h4>
									<p class="p_result">
										<textarea name="type" id="type" cols="80" rows="5">${RBean.type}</textarea>
									</p>
								</div>


								<div>
									<h4 class="res_data">餐廳資訊</h4>
								</div>
								<div>
									<h4 class="res_result">營業時間</h4>
									<p class="p_result">
										<textarea name="opentime" id="opentime" cols="80" rows="5">${RBean.opentime}</textarea>
									</p>
								</div>
								<div>
									<h4 class="res_result">餐廳描述</h4>
									<p class="p_result">
										<textarea name="description" id="description" cols="80"
											rows="5">${RBean.description}</textarea>
									</p>
								</div>
								</FORM>
								

								<div>
									<h4 class="res_data">狀態</h4>
								</div>
								
									<form id="statuss" name="statuss">
								<div>
									<p class="p_result">
										<c:if test="${RBean.status == 'N'}">停用&nbsp;
											<button class="btn btn-success" onclick="statusR()">啟用</button>
										</c:if>
										<c:if test="${RBean.status == 'Y'}">啟用&nbsp;
											<button class="btn btn-secondary" onclick="statusR()">停用</button>
										</c:if>
											<Input type='hidden' name='status' value='${r.status}'>
											<Input type='hidden' name='r_sn' value='${r.r_sn}'>
									</p>
								</div>
									</form>


							</div>

						

					</div>

					<div class="modify_div">
						<button class="btn btn-warning" name="confirm" value="confrim"
							onclick="confrimModify()">確認修改</button>

					</div>
				

					<script type="text/javascript"> 
					 function confrimModify(){ 
						 if (confirm("確定送出修改 ? ") ) { 
								document.forms["modifyR"].action="<%=application.getContextPath()%>/ModifyRestaurant";
								document.forms["modifyR"].method = "POST";
								document.forms["modifyR"].submit();
								
								return;
							} else {
								return;
							}
						}

					 function statusR(){
							if (confirm("確定修改店家狀態 ? ") ) {
								console.log("in modify");
								document.forms["statuss"].action="<%=application.getContextPath()%>/ModifyStatus";
								document.forms["statuss"].method="POST";
								document.forms["statuss"].submit();
							}else{
								return null;
								}
							 
						}
						
					</script>


				</div>
			</div>
		</div>
	</div>


</body>
</html>
