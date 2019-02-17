<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜单</title>
<style>
body {
	margin: 0px;
}

.bar {
	background-image: url(images/topbar.png);
	background-size: 25% 60px;
	background-repeat: repeat-x;
}

.shadow {
	-moz-box-shadow: 2px 2px 5px #666666;
	-webkit-box-shadow: 2px 2px 5px #666666;
	box-shadow: 2px 2px 5px #666666;
}

.menu {
	margin: 5px 5px 5px 5px;
}

.box {
	width: 50px;
	margin-right: 20px;
	float: right;
}

.user {
	width: 380px;
	margin-left: 20px;
	float: left;
}

.usericon {
	width: 50px;
	float: left;
}

#usermsg {
	width: 300px;
	margin-left: 20px;
	float: left;
}

#username {
	color: #EAE00A;
	font-size: 25px;
	-webkit-text-stroke-width: 2px;
	-webkit-text-stroke-color: #666666;
	font-weight: bold;
}

#usermessage {
	background: #39ACE2;
	box-shadow: -2px -2px -2px #666666;
	border-radius: 10px 10px 10px 10px;
}

#exp {
	color: #67E7F8;
}

#money {
	color: #F0F4A1;
}

#score {
	color: #DC8794;
}
</style>
</head>
<body class="bar">
	<div class="user">
		<c:if test="${sessionScope.curUser== '' || sessionScope.curUser== null}">
			<div class="usericon">
				<img class="menu shadow" src="<%=basePath%>images/farmer.png" width="50px">
			</div>
			<div id="usermsg">
				<div id="username">未知用户</div>
				<div id="usermessage">
					&nbsp;<span id="exp">经验： 0</span>
					&nbsp;<span id="money">金币： 0</span>
					&nbsp;<span id="score">积分： 0</span>
				</div>
			</div>
		</c:if>
		<c:if test="${sessionScope.curUser!= ''&& sessionScope.curUser!= null}">
			<div class="usericon">
				<c:if test="${sessionScope.curUser.headimg!= '' || sessionScope.curUser.headimg!= null}">
					<img class="menu shadow" src="${sessionScope.curUser.headimg}" width="50px">
				</c:if>
				<c:if test="${sessionScope.curUser.headimg=='' || sessionScope.curUser.headimg==null}">
					<img class="menu shadow" src="<%=basePath%>images/farmer.png" width="50px">
				</c:if>
			</div>
			<div id="usermsg">
				<div id="username">${sessionScope.curUser.username}</div>
				<div id="usermessage">
					&nbsp;<span id="exp">经验：${sessionScope.curUser.exp}</span>
					&nbsp;<span id="money">金币： ${sessionScope.curUser.money}</span>
					&nbsp;<span id="score">积分： ${sessionScope.curUser.score}</span>
				</div>
			</div>
		</c:if>
	</div>
	<div align="right" width="100%">
		<a href="land/grid" target="workspace">
			<img class="menu shadow" src="images/lands.png" width="50px">
		</a> 
		<a href="user/select" target="workspace">
			<img class="menu shadow" src="images/selectUser.png" width="50px">
		</a> 
		<a href="shop/grid" target="workspace">
			<img class="menu shadow" src="images/shop.png" width="50px">
		</a>
		<a href="user/grid" target="workspace">
			<img class="menu shadow" src="images/users.png" width="50px">
		</a>
		<a href="seed/grid" target="workspace">
			<img class="menu shadow" src="images/seedManager.png" width="50px">
		</a>
	</div>
</body>
</html>