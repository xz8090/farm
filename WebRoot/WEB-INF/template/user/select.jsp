<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/easyui/themes/green/easyui.css?t=34355">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/farm/farm.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/farm/imgPosition.css?t=0901">
    <script type="text/javascript" src="<%=basePath%>ext/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/easyui/plugins/jquery.edatagrid.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/farm/helper.js?346t"></script> 
    <script type="text/javascript" src="<%=basePath%>ext/farm/imgPosition.js"></script>   
</head>
<body>
<div style="width: 100%; height: 800px;">
<div id="positionDialog" title="用户选择" class="easyui-dialog" style="width:450px;padding:10px 10px" iconCls='icon-man' closed="false" buttons="#positionDialogButtons">
 	<form id="formSub" method="POST">  
    	当前用户：<input id="nowUser" name="nowUser" class="easyui-combobox" style="width:100%" data-options="prompt:'选择用户',
    		valueField:'id',
       		textField:'username',
            url:'<%=basePath%>/user/getAllUser',
            formatter: formatItem,
            onSelect:successSelect
    	">
	</form>  
	<div id="positionDialogButtons" style="height:60px;">
		<div style="width:70%;color:white;position:relative;float:left;text-align:left;"><span>请在下拉框选择用户昵称,并点击"确认"按钮设定当前用户信息</span></div>
	    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="confirm()">确认</a>
	</div>
</div>
</div>
<script>
	var user={};
	function formatItem(row){
		var s = '<img src="<%=basePath%>'+row.headimg+'" width="40px"/>'
		+'<span style="font-weight:bold;position:relative;top:-15px;">' + row.username + ' |</span>'
		+'<span style="position:relative;top:-15px;"> 经验：' + row.exp + ' |</span>'
		+'<span style="position:relative;top:-15px;"> 金币：' + row.money + ' |</span>'
		+'<span style="position:relative;top:-15px;"> 积分：' + row.score + ' </span>'
		;
		return s;
	}
	function successSelect(row){
		console.info(row);
		user=row;
	}
	function confirm(){
		$.ajax({
	        url: "<%=basePath%>user/setCurUser",
	        type: 'POST',
	        data: JSON.stringify(user),
	        contentType:"application/json",
            success: function (result) {
                console.info(result);
                $.messager.show({
	                 title: "消息",
	                 msg: result.msg
	            });
                parent.window.frames[0].window.location.reload();
                
            }
        });
	}
	$(document).ready(function () {
    	var indexFrame=$("#mainFrame",parent.window.document);
    	var foot=$("#foot",parent.window.document);
    	indexFrame.attr("rows","60,*,50");
    	foot.attr("src","tools.jsp");
	});
</script>
</body>
</html>