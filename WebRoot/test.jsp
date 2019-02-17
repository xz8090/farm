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
       	<script type="text/javascript" src="<%=basePath%>ext/easyui/jquery.min.js"></script>
    	<script type="text/javascript" src="<%=basePath%>ext/easyui/jquery.easyui.min.js"></script>
    	<script type="text/javascript" src="<%=basePath%>ext/easyui/plugins/jquery.edatagrid.js"></script>
    	<script type="text/javascript" src="<%=basePath%>ext/easyui/locale/easyui-lang-zh_CN.js"></script><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>上传图片</title>
    </head>
    <body>
    <script>
    Date.prototype.format = function (format) {
        var args = {
            "M+": this.getMonth() + 1,
            "d+": this.getDate(),
            "h+": this.getHours(),
            "m+": this.getMinutes(),
            "s+": this.getSeconds(),
            "q+": Math.floor((this.getMonth() + 3) / 3),
            "S": this.getMilliseconds()
        };
        if (/(y+)/.test(format))
            format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var i in args) {
            var n = args[i];
            if (new RegExp("(" + i + ")").test(format))
                format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? n : ("00" + n).substr(("" + n).length));
        }
        return format;
    };
    var oldTime = (new Date()).getTime();
    alert(oldTime);
    alert(new Date(oldTime+600000).format("yyyy-MM-dd hh:mm:ss"));
    </script>
    <form action="file/saveHeadImg" method="post" enctype="multipart/form-data">  
    选择文件:<input type="file" name="filePathName">  
    <input type="submit" value="提交">   
</form> 
    </body>
</html>