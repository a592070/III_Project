<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FUN x TAIWAN</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <c:import url="/WEB-INF/admin/fragment/user_ref.jsp" />
<style>
* {
	margin: 0;
	padding: 0;
}

body{
	margin:0px;
	padding:0px;
	background:#fff url('https://www.taquerialascumbres.com/static/media/background2.3fec4658.jpg') center center fixed no-repeat;
	background-size: cover;　
}    

.div_box {
	margin: 50px auto;
	padding-top: 100px;
	padding-bottom: 250px;
	width: 500px;
	/* height: 400px; */
	/* border: 1px solid black; */
}

.div_search {
	width: 500px auto;
	background-color: white;
 	border-radius: 10px; 
}

.search {
	/* width: 500px; */
	text-align: center;
	border-bottom: dashed 1px #c1c0c1;
	cursor: pointer;
	padding: 25px;
}

.search_date {
	/* width: 500px; */
	text-align: center;
	border-bottom: dashed 1px #c1c0c1;
	cursor: pointer;
	padding: 25px;
}

.sp_search {
	width: 100px;
	float: left;
	padding-top: 10px;
	margin-left: 50px;
	text-align: right;
	color:black;
	font-size: 15px;
}
.sp_search-1{
	width: 100px;
	float: left;
	padding-top: 10px;
	margin-left: 50px;
	margin-right: 28px;
	text-align: right;
	color:black;
	font-size: 15px;
}
#inputState.form-control{
	width: 250px;
	padding-left: 20px;
}
input {
	width: 250px;
	line-height: 35px;
}

button {
	padding: 5px;
	margin-left: 10px;
	width:100px;
}    
.form-control{
	width: 250px;
}
</style>
</head>
<body>

    <c:import url="/WEB-INF/admin/fragment/nav.jsp" />
    <script>
    $(".nav-shop__circle").html(${cartnum});
    console.log("cart num = " + ${cartnum}) 
    </script>
	<FORM
		ACTION="<%=pageContext.getServletContext().getContextPath()%>/SearchRestaurant"
		method="post">
		<div class="div_box">
			<div class="div_search">
				<div class="search" class="form-group col-md-2">
					<span class="sp_search-1" >餐廳地區搜尋</span>
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
				</div>
				<div class="search">
					<span class="sp_search-1">餐廳名稱搜尋</span> <input type="text"
						name="restaurant_name" placeholder="請輸入關鍵字" class="form-control">
				</div>
				<div class="search_date">
					<span class="sp_search-1">日期</span> 
					<input type="date" name="book_date" id="theDate" min="" class="form-control">
					<script>
						var date = new Date();

						var day = date.getDate();
						var month = date.getMonth() + 1;
						var year = date.getFullYear();

						if (month < 10)
							month = "0" + month;
						if (day < 10)
							day = "0" + day;

						var today = year + "-" + month + "-" + day;
						console.log(typeof(today));
						document.getElementById("theDate").value = today;
						document.getElementById("theDate").min = today;
						
					</script>
				</div>
				<div class="search"  class="form-group col-md-2">
					<span class="sp_search-1">人數</span>
					<select name="person_number" id="inputState" class="form-control">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
					</select>
				</div>
				<div class="search">
					<button name="QUERY" type="SUBMIT" value="QUERY" class="btn btn-success">找餐廳</button>
				</div>
			</div>

		</div>
	</FORM>

</body>
	 <c:import url="/WEB-INF/admin/fragment/footer.jsp" />
</html>