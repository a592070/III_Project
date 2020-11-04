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
		<div class="box">
			
			
			<div>
				<h2 class="title">${rBean.name}</h2>
				<div class="top"> </div> 
				<FORM action="<%=application.getContextPath()%>/ModifyImg" method="POST" enctype="multipart/form-data" >
				<p class="modify-img">
					<label for="r-name">請選擇欲修改圖片上傳</label> 
                    <input type="file" id="Rpicture" name="Rpicture" >
					<button type="submit" class="btn btn-light">修改</button>
				</p>
				<div class="div_img">
					<img  src="<%=application.getContextPath()%>/ShowPic">
				</div>
				
				</FORM>
				
				
				<FORM id="formL" name="formL" action="<%=pageContext.getServletContext().getContextPath()%>/ModifyLocation" method="POST">
					<div>
						<p class="modify">
							<button class="btn btn-light" name="confirm" value="confrim" onclick="confirmL()" >修改</button>
						</p>
						<h4 class="res_data">餐廳地點</h4>
					</div>

					<div>
						<h4 class="res_result">地址</h4>
						<p class="p_result"><textarea name="address" id="address" cols="80" rows="5" placeholder="${rBean.address}"></textarea></p>
<%-- 						<p class="p_result">${rBean.address}</p> --%>
					</div>
					<div>
						<h4 class="res_result">交通方式</h4>
						<p class="p_result"><textarea name="transportation" id="transportation" cols="80" rows="5" placeholder="${rBean.transportation}"></textarea></p>
<%-- 						<pre><p class="p_result">${rBean.transportation}</p></pre> --%>
					</div>
					
					<input type="hidden" id="finalDecision" name="finalDecision" value=""> 
        			<input type="hidden" id="r_sn" name="r_sn" value="${rBean.r_sn}"> 
					
				</FORM>

<script type="text/javascript">				
function confirmL(){
	if (confirm("確定送出修改 ? ") ) {
		let address = document.getElementById("address").value;
		let transportation = document.getElementById("transportation").value;
		document.forms["formL"].finalDecision.value = "confirmL";
		console.log(document.forms["formL"].finalDecision.value);
		if(address === ""){
			document.getElementById("address").value = "${rBean.address}";
			}
		if(transportation === ""){
			document.getElementById("transportation").value = "${rBean.transportation}";
			}		
		document.forms["formL"].action="<%=application.getContextPath()%>/ModifyLocation";
		document.forms["formL"].method="POST";
		document.forms["formL"].submit();
		return;
	} else {
		return;
	}
}
</script>				

				<FORM id="formT" name="formT" action="<%=pageContext.getServletContext().getContextPath()%>/ModifyType" method="POST">
					<div>
						<p class="modify">
							<button class="btn btn-light" name="confirm" value="confrim" onclick="confirmT()">修改</button>
						</p>
						<h4 class="res_data">菜色介紹</h4>
					</div>
					<div>
						<h4 class="res_result">適合聚餐類型</h4>
						<p class="p_result"><textarea name="serviceinfo" id="serviceinfo" cols="80" rows="5" placeholder="${rBean.serviceinfo}"></textarea></p>
<%-- 						<p class="p_result">${rBean.serviceinfo}</p> --%>
					</div>
					<div>
						<h4 class="res_result">料理種類</h4>
						<p class="p_result"><textarea name="type" id="type" cols="80" rows="5" placeholder="${rBean.type}"></textarea></p>
<%-- 						<p class="p_result">${rBean.type}</p> --%>
					</div>
					
					<input type="hidden" id="finalDecision" name="finalDecision" value=""> 
        			<input type="hidden" id="r_sn" name="r_sn" value="${rBean.r_sn}"> 
				</FORM>
<script type="text/javascript">
function confirmT(){
	if (confirm("確定送出修改 ? ") ) {
		let serviceinfo = document.getElementById("serviceinfo").value;
		let type = document.getElementById("type").value; 
		document.forms["formT"].finalDecision.value = "confirmT";
		console.log(document.forms["formT"].finalDecision.value);
		if(serviceinfo === ""){
			document.getElementById("serviceinfo").value = "${rBean.serviceinfo}";
			}
		if(type === ""){
			document.getElementById("type").value = "${rBean.type}";
			}
		document.forms["formT"].action="<%=application.getContextPath()%>/ModifyType";
		document.forms["formT"].method="POST";
		document.forms["formT"].submit();
		return;
	} else {
		return;
	}
}
</script>				
				
				 <FORM id="formI" name="formI" action="<%=pageContext.getServletContext().getContextPath()%>/ModifyInfo" method="POST"> 
					<div>
						<p class="modify">
							<button class="btn btn-light" name="confirm" value="confrim" onclick="confirmI()">修改</button>
						</p>
						<h4 class="res_data">餐廳資訊</h4>
					</div>
					<div>
						<h4 class="res_result">營業時間</h4>
						<p class="p_result"><textarea name="opentime" id="opentime" cols="80" rows="5" placeholder="${rBean.opentime}" ></textarea></p>
<%-- 						<pre><p class="p_result">${rBean.opentime}</p></pre> --%>
					</div>
					<div>
						<h4 class="res_result">餐廳描述</h4>
						<p class="p_result"><textarea name="description" id="description" cols="80" rows="5" placeholder="${rBean.description}"></textarea></p>
<%-- 						<p class="p_result">${rBean.description}</p> --%>
					</div>
					
					<input type="hidden" id="finalDecision" name="finalDecision" value=""> 
        			<input type="hidden" id="r_sn" name="r_sn" value="${rBean.r_sn}"> 
					
				 </FORM> 
<script type="text/javascript">
function confirmI(){
	if (confirm("確定送出修改 ? ") ) {
		let opentime = document.getElementById("opentime").value;
		let description = document.getElementById("description").value; 
		console.log(document.forms["formI"]);
		console.log(document.forms["formI"].finalDecision.value);
		document.forms["formI"].finalDecision.value = "confirmI";
		console.log(document.forms["formI"].finalDecision.value);
		if(opentime === ""){
			document.getElementById("opentime").value = "${rBean.opentime}";
			}
		if(description === ""){
			document.getElementById("description").value = "${rBean.description}";
			}
		document.forms["formI"].action="<%=application.getContextPath()%>/ModifyInfo";
		document.forms["formI"].method="POST";
		document.forms["formI"].submit();
		return;
	} else {
		return;
	}
}
</script>				 

				
			</div>

		</div>

		<FORM id="RHome" name="RHome" action="<%=pageContext.getServletContext().getContextPath()%>/Restaurant" method="GET">		 
		<div class="div-btn">
			<button type="submit" class="btn btn-primary">回餐廳首頁</button>
        </div>
        </FORM>
				 



				</div>
			</div>
 		</div>
	</div>


</body>
</html>
