<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>我的农场</title>
    <style>
        body {
            margin: 0px;           
        }
    </style>
</head>
<frameset rows="60,*,50" border="0" id="mainFrame">
	<frame src="menu.jsp" scrolling="no">
	<frame name="workspace" src="welcome.jsp" scrolling="no">
	<frame src="tools.jsp" scrolling="no" id="foot"> 		
</frameset>
</html>
