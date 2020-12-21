<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>FUN x TAIWAN</title>
			<c:import url="/WEB-INF/admin/fragment/ref.jsp" />
			<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
			<style>
				th,
				td {
					text-align: center;
				}

				.username {
					width: 270px;
				}
			</style>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
		</head>

		<body class="sidebar-fixed sidebar-dark header-light header-fixed" id="body">
			<div class="mobile-sticky-body-overlay"></div>

			<div class="wrapper">
				<c:import url="/WEB-INF/admin/fragment/sidebar.jsp" />
				<div class="page-wrapper">
					<c:import url="/WEB-INF/admin/fragment/header.jsp" />
					<div class="content-wrapper">
						<div class="content">
							<div class="row">
								<div class="col-12">
									<div class="box">
										<div style="width: 800px;">
											<h2>會員統計</h2>
											<canvas id="chart1" width="100" height="50"></canvas>
										</div>
										<div style="width: 800px;">
											<h2>當月註冊人數</h2>
											<canvas id="chart2" width="100" height="50"></canvas>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<script>
				$(document).ready(function () {
					$.ajax({
						type: "GET",
						url: "${pageContext.servletContext.contextPath}/admin/chart",
						dataType: "json",
						success: (response) => {
							chart(response)
						}

					})

					$.ajax({
						type: "GET",
						url: "${pageContext.servletContext.contextPath}/admin/chart2",
						dataType: "json",
						success: (response) => {
							chart2(response)
						}

					})

				})
				function chart(response) {
					var name1 = response[0].iName
					var name2 = response[1].iName
					var name3 = response[2].iName
					var name4 = response[3].iName
					var name5 = response[4].iName
					
					var sum = response[0].count+response[1].count+response[2].count+response[3].count+response[4].count
			        
					 
					var num1 = response[0].count
					var num2 = response[1].count
					var num3 = response[2].count
					var num4 = response[3].count
					var num5 = response[4].count

				

					var ctx = document.getElementById("chart1"),
						chart1 = new Chart(ctx, {

							type: "pie", // 圖表類型
							data: {
								labels: [name1, name2, name3, name4, name5], // 標題
								datasets: [{
									label: "會員人數", // 標籤
									data: [num1, num2, num3, num4, num5], // 資料
									backgroundColor: [ // 背景色
										"#000093",
										"#AE8F00",
										"#00A600",
										"#EA0000",
										"#9F4D95",
									],
									borderWidth: 1 // 外框寬度
								}]
							}
						});
				}


				function chart2(response) {
					var month1 = response[0].monthString
					var month2 = response[1].monthString
					var month3 = response[2].monthString

					var num1 = response[0].count
					var num2 = response[1].count
					var num3 = response[2].count


					var ctx = document.getElementById("chart2"),
						chart2 = new Chart(ctx, {

							type: "bar", // 圖表類型
							data: {
								labels: [month1, month2, month3], // 標題
								datasets: [{
									label: "註冊人數", // 標籤
									data: [num1, num2, num3], // 資料
									backgroundColor: [ // 背景色
										"#000093",
										"#AE8F00",
										"#00A600",

									],
									borderWidth: 1 // 外框寬度
								}]
							}
						});
				}


			</script>
		</body>

		</html>