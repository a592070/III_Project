<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<title>Title</title>

<c:import url="/WEB-INF/admin/fragment/ref.jsp" />
<style>
* {
            margin: 0;
            padding: 0;
        }

        .div-1 {
            margin-left: 50px;
            padding-bottom: 20px;
        }

        label {
            width: 120px;
            float: left;
            padding-right: 20px;
            /* margin-left: 50px; */
            text-align: right;
        }
        .div-btn {
        	width:400px;
        	padding-left: 150px;
			text-align: center;
		}
		
		h2 {
         text-align: center;
        }

.sp_search-1 {
	float: left;
}

.box {
	display: flex;
}

.search {
	padding-right: 30px;
}

input {
	height: 40px;
}

.sp_search {
	padding: 10px;
	float: left;
}

select {
	float: left;
}

#inputState.form-control {
	width: 200px;
	padding-left: 20px;
}

h2 {
	padding-top: 30px;
	padding-bottom: 30px;
}

.content-wrapper {
	padding-left: 50px;
	padding-top: 50px;
}
td{
	text-color: black
}

.div-btn{
	width:400px;
	text-align: center;
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


<div class="wrapper">
	<FORM id="formL" name="formL" action="<%=pageContext.getServletContext().getContextPath()%>/Restaurant_HPServlet" method="POST">
	
        <div class="container">
            <h2>修改${r_hp.name}菜色介紹資訊</h2>
            <div class="">
                <div class="div-1">
                    <label for="r-name">適合聚餐類型</label> 
                    <textarea name="serviceinfo" id="" cols="40" rows="5" placeholder="${r_hp.serviceinfo}"></textarea>
                </div>

                <div class="div-1">
                    <label for="r-date">料理種類</label> 
                    <textarea name="type" id="" cols="40" rows="5" placeholder="${r_hp.type}"></textarea>
                </div>

            </div>
        </div>
        
        <input type="hidden" id="finalDecision" name="finalDecision" value=""> 
        	<!-- 隱藏資訊 -->
        	<Input type='hidden' name='rBean' value='${r_hp}'>
        	<Input type='hidden' name='roBean' value='${roBean}'>
        	
        <div class="div-btn">
       		<input type="button" class="btn btn-primary" name="confirm" value="confrim" onclick="confirmL()"> 
			<input type="button" class="btn btn-secondary" name="CancelBtn" value="cancel" onclick="cancelL()">
        </div>
        
	</FORM>
	
	<script type="text/javascript">
function confirmL(){
	if (confirm("確定送出修改 ? ") ) {
		console.log(document.forms["formL"]);
		console.log(document.forms["formL"].finalDecision.value);
		document.forms["formL"].finalDecision.value = "confirmT";
		console.log(document.forms["formL"].finalDecision.value);
		document.forms["formL"].action="<%=application.getContextPath()%>/Restaurant_HPServlet";
		document.forms["formL"].method="POST";
		document.forms["formL"].submit();
		return;
	} else {
		return;
	}
}
function cancelL(){
	if (confirm("確定取消修改 ? ") ) {
		console.log(document.forms["formL"]);
		console.log(document.forms["formL"].finalDecision.value);
		document.forms["formL"].finalDecision.value = "cancel";
		console.log(document.forms["formL"].finalDecision.value);
		document.forms["formL"].action="<%=application.getContextPath()%>/Restaurant_HPServlet";
		document.forms["formL"].method="POST";
		document.forms["formL"].submit();
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