<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String wsBasePath = "ws://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">  
    <title>Java API for WebSocket Demo</title>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>ext/easyui/themes/green/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/easyui/themes/color.css">
    <script type="text/javascript" src="<%=basePath%>ext/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/easyui/plugins/jquery.edatagrid.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/farm/helper.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/farm/sockjs.js"></script>
</head>  
<body>  

	<div id="talks" class="easyui-panel" title="聊天记录" style="width:500px;height:600px;padding:10px;"></div>
	<script type="text/javascript">
		var websocket = null; 
	    function initWebSocket(){	    	     
		    if ('WebSocket' in window) {  
		        //Websocket的连接  
		        websocket = new WebSocket("<%=wsBasePath%>farm/user");//WebSocket对应的地址  
		    }  
		    else if ('MozWebSocket' in window) {  
		        //Websocket的连接  
		        websocket = new MozWebSocket("<%=wsBasePath%>farm/user");//SockJS对应的地址  
		    }  
		    else {  
		        //SockJS的连接  
		        websocket = new SockJS("<%=wsBasePath%>farm/user");//SockJS对应的地址    
		    }  
		    websocket.onopen = onOpen;  
		    websocket.onmessage = onMessage;  
		    websocket.onerror = onError;  
		    websocket.onclose = onClose;
	    }
	  
	    function onOpen(evt) {  
	        console.log("连接打开：",evt);  
	    }  
	  
	    function onMessage(evt) {
	    	$("#talks").append("<p>消息："+evt.data+"</p>");
	    	
	    }  
	    function onError(evt) {  
	    	console.log("出现错误：",evt);
	    }  
	    function onClose(evt) {  
	    	console.log("连接关闭：",evt);
	    }  
	  
	    window.close = function () {  
	        websocket.onclose();  
	    } 
	    
	   	initWebSocket();	 
		 
	    

	</script>
</body>  
</html>  