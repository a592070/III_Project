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
            <form class="form-inline" action="hotelselect" method="GET">
                <div class="form-group mb-2">
                  <h5>輸入關鍵字:</h5>
                </div>
                <div class="form-group mx-sm-3 mb-2">
                  <label for="inputKeyword" class="sr-only">keyword</label>
                  <input type="text" class="form-control"  name="keyword" placeholder="Search..">
                </div>
                <div class="form-group col-md-2">
                    <label for="inputState">地區:</label>
                    <select id="inputState" class="form-control"  name="regionkeywd" onChange="this.form.submit()">
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
                    <label for="inputState">類型:</label>
                    <select id="inputState" class="form-control" name="typekeywd">
                      <option value="">請選擇..</option>
                      <option value="飯店">飯店</option>
                      <option value="民宿">民宿</option>
                      <option value="汽車旅館">汽車旅館</option>
                    </select>
                  </div>      
                <button type="submit" class="btn btn-primary mb-2" value="search" name="search">搜尋</button>
              </form>
            </div>
            <h2>飯店列表</h2>
  <!--------------------------------------------以上為搜尋列----------------------------------------------------------->  
  <!--------------------------------------------以下為飯店內容--------------------------------------------------------->
        <br>
        <table class="table">
            <thead>
            <tr>
<!--             	<th>圖片</th> -->
                <th>名稱</th>
                <th>地區</th>
                <th>地址</th>
                <th>住宿類型</th>                                            
                <th>店家狀態</th>
                <td>狀態</td>
                <th>修改</th>
                <th>刪除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="hotels" items="${hoteldata}">
            <tr>
<!--             	<td></td> -->
                <td>${hotels.NAME}</td>
                <td>${hotels.REGION}</td>
                <td>${hotels.ADDRESS}</td>
                <td>${hotels.TYPE}</td>
                <td>${hotels.STATUS}</td>
<%--                 <td><button type="button" class="btn btn-primary mb-2"  data-toggle="modal" data-target="#exampleModal" onclick="clickstatus('${hotels.SN}','${hotels.STATUS}')">變更狀態</button></td> --%>
     <%-- 開關(綠色) --%>          <td><label class="switch switch-text switch-success switch-pill form-control-label">
               			<c:set var="status1" value="啟用"/>
               								<c:choose>
               								  <c:when test="${hotels.STATUS eq status1}">
												<input type="checkbox" name="status" class="switch-input form-check-input" data-toggle="modal" data-target="#exampleModal" onclick="clickstatus('${hotels.SN}','${hotels.STATUS}')" checked >
												<span class="switch-label" data-on="啟用" data-off="禁用"></span>
												<span class="switch-handle"></span>
											  </c:when>
											  <c:otherwise>
												<input type="checkbox" name="status" class="switch-input form-check-input" data-toggle="modal" data-target="#exampleModal" onclick="clickstatus('${hotels.SN}','${hotels.STATUS}')"  >
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
        
        <script type="text/javascript"> 
		function clickstatus(id,status){
// 			document.location.href="${pageContext.servletContext.contextPath}/hotelstatus?upId="+id+"&upStatus="+status;
// 			consloe.log(id);
// 			consloe.log(status);
			$("#statusId").val(id);
			$("#hstatus").val(status);
		}
		
		function clickdetail(id){

			document.location.href="${pageContext.servletContext.contextPath}/admin/hoteldetail?detailsn="+id;

		}

		function clickdelete(id,name){

			$("#deleteId").val(id);
		}
		
		function statuscancel(){

			document.location.href="${pageContext.servletContext.contextPath}/hotelindex";

		}

		function statuscancel(){
			document.location.href="${pageContext.servletContext.contextPath}/admin/hotelindex";
		}

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
 <!-----------------------------------------------修改狀態---------------------------------------------------------------------->     
       <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
         <div class="modal-dialog modal-dialog-centered" role="document">
           <div class="modal-content">
             <div class="modal-header">
               <h5 class="modal-title" id="exampleModalCenterTitle">修改狀態</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                 <span aria-hidden="true">&times;</span>
               </button>
             </div>
             <div class="modal-body">
                <form action="hotelstatus" method="POST">
                  <table>
                    <div class="form-group">
                      <label for="recipient-name" class="col-form-label"></label>
                      <input type="hidden" id = "statusId" value="" name="upId">
                      <input type="hidden" id = "hstatus" value="" name="upStatus">
                      <h4>是否確認修改狀態?</h4>
                      <p></p>
                    </div>
               		 <div class="modal-footer">
                 	 <button type="submit" class="btn btn-primary">確認</button>
                  	<button type="submit" class="btn btn-secondary" data-dismiss="modal" onclick="statuscancel()">取消</button>
               		 </div>
                  </form> 
                  </table>
             </div>
           </div>
         </div>
       </div>
	<!-----------------------------------------------修改狀態----------------------------------------------------------------------> 
		</div>
	</div>

</body>
</html>
