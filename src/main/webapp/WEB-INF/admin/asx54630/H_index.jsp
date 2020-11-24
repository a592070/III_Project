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
<script src='//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js'></script>
<link href='//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css' rel='stylesheet'></link>

</head>


<body class="sidebar-fixed sidebar-dark header-light header-fixed"
	id="body">
	<div class="mobile-sticky-body-overlay"></div>

	<div class="wrapper">
		<c:import url="/WEB-INF/admin/fragment/sidebar.jsp" />
		<div class="page-wrapper">
			<c:import url="/WEB-INF/admin/fragment/header.jsp" />
 <%-- -- <div class="content-wrapper"></div>  -------------------------------以下為個人內容-------------------------- --%>
<!-- 		<div class="container"> -->
        
        <div class="mx-auto my-3" style="width: 1100px">
            <form class="form-inline"  id="form">
                <div class="form-group mb-2">
                  <h5>輸入關鍵字:</h5>
                </div>
                <div class="form-group mx-sm-3 mb-2">
                  <label for="inputKeyword" class="sr-only">keyword</label>
                  <input type="text" class="form-control"  name="keyword" id="keyword" placeholder="Search..">
                  <Input type='hidden' name='order' value='DESC'>
                </div>
                <div class="form-group col-md-2">
                    <label for="regionkeywd">地區:</label>
                    <select class="form-control"  name="regionkeywd" id="regionkeywd" >
                        <option value="">請選擇..</option>
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
                  </div>
                  <div class="form-group col-md-3">
                    <label for="typekeywd">類型:</label>
                    <select class="form-control" name="typekeywd" id="typekeywd">
                      <option value="">請選擇..</option>
                      <option value="飯店">飯店</option>
                      <option value="民宿">民宿</option>
                      <option value="汽車旅館">汽車旅館</option>
                    </select>
                  </div>      
                <button type="button" class="btn btn-primary mb-2" id="search" name="search">搜尋</button>
              </form>
            </div>
            <h2>飯店列表</h2>
  <!--------------------------------------------以上為搜尋列----------------------------------------------------------->  
  <!--------------------------------------------以下為飯店內容--------------------------------------------------------->
        <br>
        <table class="table" id="table">
            <thead>
            <tr>
                <th><div>
						<form id="statuss" name="statuss"
							action="<%=application.getContextPath()%>/admin/hotelSort">
							<button>
								<svg width="2em" height="1em" viewBox="0 0 16 16"
									class="bi bi-arrow-down-up" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
							<path fill-rule="evenodd"
										d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z" />
						</svg>
							</button> 
							<Input type='hidden' name='orderfiled' value='SN'> 
							<Input type='hidden' name='keyword' value='${keyword}'>
							<Input type='hidden' name='regionkeywd' value='${regionkeywd}'>
							<Input type='hidden' name='typekeywd' value='${typekeywd}'> 
							<Input type='hidden' name='order' value='${order}'>ID
						</form>
					</div></th>
                <th>名稱</th>
                <th>地區</th>
                <th>地址</th>
                <th>住宿類型</th>                                            
                <th><div>
						<form id="statuss" name="statuss"
							action="<%=application.getContextPath()%>/admin/hotelSort">
							<button>
								<svg width="2em" height="1em" viewBox="0 0 16 16"
									class="bi bi-arrow-down-up" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
							<path fill-rule="evenodd"
										d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z" />
						</svg>
							</button> 
							<Input type='hidden' name='orderfiled' value='STATUS'> 
							<Input type='hidden' name='keyword' value='${keyword}'>
							<Input type='hidden' name='regionkeywd' value='${regionkeywd}'>
							<Input type='hidden' name='typekeywd' value='${typekeywd}'> 
							<Input type='hidden' name='order' value='${order}'>狀態
						</form>
					</div></th>
				<th>修改</th>
                <th>刪除</th>
            </tr>
            </thead>
            <tbody id="tbody">
            <c:forEach var="hotels" items="${hoteldata}">
            <tr>
				<td id="SN">${hotels.SN}</td>
                <td>${hotels.NAME}</td>
                <td>${hotels.REGION}</td>
                <td>${hotels.ADDRESS}</td>
                <td>${hotels.TYPE}</td>
<%-- 開關(綠色) --%><td id="STATUS"><label class="switch switch-text switch-success switch-pill form-control-label">
                	<c:choose>
                	  <c:when test="${hotels.STATUS eq '啟用'}">
	      				<input type="checkbox" name="status" class="switch-input form-check-input" id="checkbox" value="啟用" checked >
	      				<span class="switch-label" data-on="啟用" data-off="禁用"></span>
	      				<span class="switch-handle"></span>
	      			  </c:when>
	      			  <c:otherwise>
	      				<input type="checkbox" name="status" class="switch-input form-check-input"  id="checkbox" value="禁用" >
	      				<span class="switch-label" data-on="啟用" data-off="禁用"></span>
	      				<span class="switch-handle"></span>
	      			  </c:otherwise>
	      			</c:choose>
	      			</label></td> <%-- 開關(綠色) --%> 
                <td><button type="button" class="btn btn-warning mb-2"  onclick="clickdetail('${hotels.SN}')">修改</button></td>
               <td><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModalCenter" onclick="clickdelete('${hotels.SN}')">刪除</button></td>
            </tr>
            </c:forEach> 

         </tbody>
        </table>
        
<!--         <div> -->
<!-- 				<nav aria-label="..."> -->
<!-- 					<ul class="pagination"> -->
						
<!-- 								<li class="page-item"> -->
<!-- 									<button class="page-link" id="page-botton" value="first">第一頁</button> -->
<!-- 								</li> -->
							
							
<!-- 							previous -->
<!-- 								<li class="page-item"> -->
<!-- 									<button class="page-link previous" id="page-botton" value="previous">&laquo;</button> -->
<!-- 								</li> -->
							
							
<!-- 							current page -->
<!-- 								<li class="page-item active"> -->
<!-- 									<button class="page-link" class="sr-only" id="page-btn" name="currentPage" value="">1</button> -->
<!-- 								</li> -->
						
<!-- 							NEXT -->
<!-- 								<li class="page-item"> -->
<!-- 									<button class="page-link next" id="page-botton" value="next">&raquo;</button> -->
<!-- 								</li> -->
							
							
							
<!-- 								<li class="page-item last"> -->
<!-- 									<button class="page-link last" id="page-botton" value="">最末頁</button> -->
<!-- 								</li> -->
							
					
<!-- 					</ul> -->
<!-- 				</nav> -->
<!-- 			</div> -->
        
        
        <script type="text/javascript"> 
		
		$("#table").on('change', '#checkbox', function () {
				var SN = $(this).closest('td').siblings("#SN").text()
				var STATUS =$(this).val();
				$.ajax(
					{
						type: 'POST',
						data: { "upId": SN, "upStatus": STATUS },
						url: '${pageContext.servletContext.contextPath}/admin/hotelstatus',
						dataType: 'text',
						success: function (response) {
							console.log(response)

						}
					}
				)
			
		  })
		
		$("#search").click(function () {
			console.log("搜尋")
			var keyword = $("#keyword").val()
			var regionkeywd = $("#regionkeywd").val()
			var typekeywd = $("#typekeywd").val()
			$("#tbody").children().remove();
			$.ajax(
					{
						type: 'POST',
						data: { "keyword": keyword, "regionkeywd": regionkeywd, "typekeywd" : typekeywd },
						url: '${pageContext.servletContext.contextPath}/admin/hotelselect',
						dataType: 'html',
						success: function (response) {
							$("#tbody").append(response)

						}

					}
				)
		})
		
		$("#regionkeywd").on('change' ,function () {
			console.log("地區搜尋")
			var keyword = $("#keyword").val()
			var regionkeywd = $("#regionkeywd").val()
			var typekeywd = $("#typekeywd").val()
			$("#tbody").children().remove();
			$.ajax(
					{
						type: 'POST',
						data: { "keyword": keyword, "regionkeywd": regionkeywd, "typekeywd" : typekeywd },
						url: '${pageContext.servletContext.contextPath}/admin/hotelselect',
						dataType: 'html',
						success: function (response) {
							$("#tbody").append(response)

						}

					}
				)
		})
		
		$("#typekeywd").on('change' ,function () {
			console.log("類型搜尋")
			var keyword = $("#keyword").val()
			var regionkeywd = $("#regionkeywd").val()
			var typekeywd = $("#typekeywd").val()
			$("#tbody").children().remove();
			$.ajax(
					{
						type: 'POST',
						data: { "keyword": keyword, "regionkeywd": regionkeywd, "typekeywd" : typekeywd },
						url: '${pageContext.servletContext.contextPath}/admin/hotelselect',
						dataType: 'html',
						success: function (response) {
							$("#tbody").append(response)

						}

					}
				)
		})
		
		function clickdetail(id){

			document.location.href="${pageContext.servletContext.contextPath}/admin/hoteldetail?detailsn="+id;

		}

		function clickdelete(id,name){

			$("#deleteId").val(id);
		}

		$(function () {
			$('#table').DataTable({
				 searching: false

				 columnDefs: [{
				      targets: [3],
				       orderable: false,
				        }]		
				 
				 });
			});
		
		</script> 
		
		<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
         <div class="modal-dialog modal-dialog-centered" role="document">
           <div class="modal-content">
             <div class="modal-header">
               <h5 class="modal-title" id="exampleModalCenterTitle">刪除</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                 <span aria-hidden="true">&times;</span>
               </button>
             </div>
             <div class="modal-body">
                <form action="hoteldelete" method="POST">
                  <table>
                    <div class="form-group">
                      <label for="recipient-name" class="col-form-label"></label>
                      <input type="hidden" id = "deleteId" value="" name="deleteId">
                      <h4>是否確認刪除?</h4>
                      <p></p>
                    </div>
               		 <div class="modal-footer">
                 	 <button type="submit" class="btn btn-primary">確認</button>
                  	<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
               		 </div>
                  </form> 
                  </table>
             </div>
           </div>
         </div>
       </div>
 
		</div>
	</div>

</body>
</html>
