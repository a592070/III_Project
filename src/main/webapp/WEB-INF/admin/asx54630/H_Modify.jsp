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
<title>Hotel</title>

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
			<form action="hotelindex" method="GET">
					<div class="div-back">
						<button type="submit" class="btn btn-primary">回旅館列表</button>
					</div>
				</form>
			<div class="container">
				
					<div class="box">

							<div>
								<h2 class="title">${hoteldetail.NAME}</h2>
								<div class="top"></div>

								<FORM  id="modifyH" name="modifyH" method="POST" enctype="multipart/form-data">
								<input type="hidden" value="${hoteldetail.SN}" name="upId" id="dataId">
								<!-- <p class="modify-img">
									<label for="r-name">請選擇欲修改圖片上傳</label> 
									<input type="file" id="pic" name="pic">
									<Input type='hidden' name='r_sn' value=''>
			<!-- 					<button type="submit" class="btn btn-light">修改</button> -->
								</p>-->
								<div class="div_img">
<%-- 									<img id="preview_Rpic" src="<%=application.getContextPath()%>/ShowPic"> --%>
								</div>
								
<!-- 								<script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script> -->
<!-- 								<script> -->
<!-- 								$("#pic").change(function(){ -->
<!-- 					                 readURL(this); -->
<!-- 					            }); -->
<!-- 					            function readURL(input){ -->
<!-- 					                if(input.files && input.files[0]){ -->
<!-- 					                    var reader = new FileReader(); -->
<!-- 					                    reader.onload = function (e) { -->
<!-- 					                        $("#preview_Rpic").attr('src', e.target.result); -->
<!-- 					                    } -->
<!-- 					                    reader.readAsDataURL(input.files[0]); -->
<!-- 					                } -->
<!-- 					            } -->
<!-- 								</script> -->
								
								<div>
									<h4 class="res_result">名稱</h4>
									<p class="p_result">
										<textarea name="upName" id="dataName" cols="80" rows="5">${hoteldetail.NAME}</textarea>
									</p>
								</div>
								
								<div>
									<h4 class="res_result">地區</h4>
									<p class="p_result">
							<select name="upRegion" id="upRegion" class="form-control">
								 <option value="">請選擇地區</option>
                                 <option value="基隆市">基隆市</option>
                                 <option value="新北市">新北市</option>
                                 <option value="臺北市">臺北市</option>
                                 <option value="桃園市">桃園市</option>
                                 <option value="新竹市">新竹市</option>
                                 <option value="新竹縣">新竹縣</option>
                                 <option value="苗栗縣">苗栗縣</option>
                                 <option value="宜蘭縣">宜蘭縣</option>
                                 <option value="臺中市">臺中市</option>
                                 <option value="彰化縣">彰化縣</option>
                                 <option value="南投縣">南投縣</option>
                                 <option value="雲林縣">雲林縣</option>
                                 <option value="嘉義市">嘉義市</option>
                                 <option value="嘉義縣">嘉義縣</option>
                                 <option value="臺南市">臺南市</option>
                                 <option value="高雄市">高雄市</option>
                                 <option value="屏東縣">屏東縣</option>
                                 <option value="花蓮縣">花蓮縣</option>
                                 <option value="臺東縣">臺東縣</option>
                                 <option value="澎湖縣">澎湖縣</option>
                                 <option value="金門縣">金門縣</option>
                                 <option value="連江縣">連江縣</option>
							</select>
							<script>
							switch ("${hoteldetail.REGION}"){
								case'':
								document.getElementById("upRegion")[0].selected=true;
								break;
								case'基隆市':
								document.getElementById("upRegion")[1].selected=true;
								break;
								case'新北市':
								document.getElementById("upRegion")[2].selected=true;
								break;
								case'臺北市':
								document.getElementById("upRegion")[3].selected=true;
								break;
								case'桃園市':
								document.getElementById("upRegion")[4].selected=true;
								break;
								case'新竹市':
								document.getElementById("upRegion")[5].selected=true;
								break;
								case'新竹縣':
								document.getElementById("upRegion")[6].selected=true;
								break;
								case'苗栗縣':
								document.getElementById("upRegion")[7].selected=true;
								break;
								case'宜蘭縣':
								document.getElementById("upRegion")[8].selected=true;
								break;
								case'臺中市':
								document.getElementById("upRegion")[9].selected=true;
								break;
								case'彰化縣':
								document.getElementById("upRegion")[10].selected=true;
								break;
								case'南投縣':
								document.getElementById("upRegion")[11].selected=true;
								break;
								case'雲林縣':
								document.getElementById("upRegion")[12].selected=true;
								break;
								case'嘉義市':
								document.getElementById("upRegion")[13].selected=true;
								break;
								case'嘉義縣':
								document.getElementById("upRegion")[14].selected=true;
								break;
								case'臺南市':
								document.getElementById("upRegion")[15].selected=true;
								break;
								case'高雄市':
								document.getElementById("upRegion")[16].selected=true;
								break;
								case'屏東縣':
								document.getElementById("upRegion")[17].selected=true;
								break;
								case'花蓮縣':
								document.getElementById("upRegion")[18].selected=true;
								break;
								case'臺東縣':
								document.getElementById("upRegion")[19].selected=true;
								break;
								case'澎湖縣':
								document.getElementById("upRegion")[20].selected=true;
								break;
								case'金門縣':
								document.getElementById("upRegion")[21].selected=true;
								break;
								case'連江縣':
								document.getElementById("upRegion")[22].selected=true;
								break;			
								}
							</script>
									</p>
								</div>

								<div>
									<h4 class="res_result">地址</h4>
									<p class="p_result">
										<textarea name="upAddress" id="dataAddress" cols="80" rows="5">${hoteldetail.ADDRESS}</textarea>
									</p>
								</div>
								<div>
									<h4 class="res_result">電話</h4>
									<p class="p_result">
										<textarea name="upTel" id="dataTel" cols="80"
											rows="5">${hoteldetail.TEL}</textarea>
									</p>
								</div>

								<div>
									<h4 class="res_result">雙人房價格</h4>
									<p class="p_result">
										<textarea name="upDBroom" id="dataDbroom" cols="80"
											rows="5">${hoteldetail.DOUBLE_ROOM}</textarea>
									</p>
								</div>
								<div>
									<h4 class="res_result">四人房價格</h4>
									<p class="p_result">
										<textarea name="upQDroom" id="dataQdroom" cols="80" rows="5">${hoteldetail.QUADRUPLE_ROOM}</textarea>
									</p>
								</div>
								<div>
									<h4 class="res_result">介紹</h4>
									<p class="p_result">
										<textarea name="upDescription" id="dataDescription" cols="80" rows="5">${hoteldetail.DESCRIPTION}</textarea>
									</p>
								</div>	
								<div>
									<h4 class="res_result">營業時間</h4>
									<p class="p_result">
										<textarea name="upOpentime" id="dataOpentime" cols="80" rows="5">${hoteldetail.OPENTIME}</textarea>
									</p>
								</div>
								<div>
									<h4 class="res_result">住宿類型</h4>
									<p class="p_result">
										<textarea name="upType" id="dataType" cols="80"
											rows="5">${hoteldetail.TYPE}</textarea>
									</p>
								</div>
									
								</FORM>
							</div>

					</div>

					<div class="modify_div">
						<button class="btn btn-warning" name="confirm" value="confrim"
						onclick="confrimModify()">確認修改</button>

					</div>
	
				<script type="text/javascript"> 
					 function confrimModify(){ 
						 if (confirm("確定送出修改 ? ") ) { 
								document.forms["modifyH"].action="<%=application.getContextPath()%>/admin/hotelupdate";
								document.forms["modifyH"].method = "POST";
								document.forms["modifyH"].submit();
								
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
