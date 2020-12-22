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
						<button type="button" class="btn btn-light" id="putdata" onclick="insertdata()">帶入資料</button>
					</div>
				</form>
			<div class="container">
				
					<div class="box">

							<div>
								<h2 class="title">新增店家</h2>
								<div class="top"></div>

								<FORM  id="createH" name="createH" method="POST" enctype="multipart/form-data">
								<input type="hidden" value="" name="upId" id="dataId">
 								<p class="modify-img">
									<label for="r-name">請選擇欲修改圖片上傳</label>
 									<input type="file" id="uppic" name="uppic">									
<!--  								<button type="submit" class="btn btn-light">修改</button>  -->
								</p>
								<div class="div_img">
									<img id="preview_Hpic" src="<%=application.getContextPath()%>/assets/nopic.jpg" src="<%=application.getContextPath()%>/hotelPic">
								</div>
								
								<script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>
								<script>
 								$("#uppic").change(function(){
					                 readURL(this);
 					            }); 
 					            function readURL(input){
 					                if(input.files && input.files[0]){ 
 					                    var reader = new FileReader(); 
 					                    reader.onload = function (e) { 
 					                        $("#preview_Hpic").attr('src', e.target.result);
 					                    }
					                    reader.readAsDataURL(input.files[0]); 
 					                } 
 					            } 
								</script>
								
								<div>
									<h4 class="res_result">名稱</h4>
									<p class="p_result">
										<textarea name="upName" id="dataName" cols="80" rows="5"></textarea>
									</p>
								</div>
								
								<div>
									<h4 class="res_result">地區</h4>
									<p class="p_result">
							<select name="upRegion" id="upRegion" class="form-control">
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
									</p>
								</div>

								<div>
									<h4 class="res_result">地址</h4>
									<p class="p_result">
										<textarea name="upAddress" id="dataAddress" cols="80" rows="5"></textarea>
									</p>
								</div>
								<div>
									<h4 class="res_result">電話</h4>
									<p class="p_result">
										<textarea name="upTel" id="dataTel" cols="80"
											rows="5"></textarea>
									</p>
								</div>

								<div>
									<h4 class="res_result">雙人房價格</h4>
									<p class="p_result">
										<textarea name="upDBroom" id="dataDbroom" cols="80"
											rows="5"></textarea>
									</p>
								</div>
								<div>
									<h4 class="res_result">四人房價格</h4>
									<p class="p_result">
										<textarea name="upQDroom" id="dataQdroom" cols="80" rows="5"></textarea>
									</p>
								</div>
								<div>
									<h4 class="res_result">介紹</h4>
									<p class="p_result">
										<textarea name="upDescription" id="dataDescription" cols="80" rows="5"></textarea>
									</p>
								</div>	
								<div>
									<h4 class="res_result">營業時間</h4>
									<p class="p_result">
										<textarea name="upOpentime" id="dataOpentime" cols="80" rows="5"></textarea>
									</p>
								</div>
								<div>
									<h4 class="res_result">住宿類型</h4>
									<p class="p_result">
									<select name="upType" id="upType" class="form-control">
                      					<option value="飯店">飯店</option>
                       					<option value="民宿">民宿</option>
                      			 		<option value="汽車旅館">汽車旅館</option>
									</select>
								</div>
									
								</FORM>
							</div>

					</div>

					<div class="modify_div">
						<button class="btn btn-warning" name="confirm" value="confrim"
						data-toggle="modal" data-target="#exampleModalCenter">確認新增</button>
					</div>
					</div>
					<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        		 	 <div class="modal-dialog modal-dialog-centered" role="document">
         		  	  <div class="modal-content">
           		 	   <div class="modal-header">
             			 <h5 class="modal-title" id="exampleModalCenterTitle">新增提醒</h5>
               			  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               		       <span aria-hidden="true">&times;</span>
              		      </button>
             			</div>
            		  <div class="modal-body">
                      	<h4>是否確認新增住宿資料?</h4>
                      </div>
               		 <div class="modal-footer">
                 	 <button type="submit" class="btn btn-primary" onclick="confrimCreate()">確認</button>
                  	<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
               		 </div>
                  </form> 
             </div>
           </div>
         </div>
       </div>
	
				<script type="text/javascript"> 
				 function insertdata(){
					 console.log("in data")
						 document.getElementById("dataName").value = "我家大飯店";
						 document.getElementById("upRegion")[3].selected = "selected";
						 document.getElementById("dataAddress").value = "桃園市桃園區民生路800號";
						 document.getElementById("dataTel").value = "03-30678";
						 document.getElementById("dataDbroom").value = "2500";
						 document.getElementById("dataQdroom").value = "3000";
						 document.getElementById("dataDescription").value = "歡迎來到我家大飯店! 我們致力於讓客戶有回到家的感覺!";
						 document.getElementById("dataOpentime").value = "全年無休";
						 document.getElementById("upType")[1].selected = "selected";
					 }

				
					 function confrimCreate(){ 
								document.forms["createH"].action="<%=application.getContextPath()%>/admin/hotelcreate";
								document.forms["createH"].method = "POST";
								document.forms["createH"].submit();
								
								return;
						}
					 </script>



				</div>

			</div>
		</div>
	</div>


</body>
</html>
