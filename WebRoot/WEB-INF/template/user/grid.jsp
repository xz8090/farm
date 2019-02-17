<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>ext/easyui/themes/green/easyui.css?t=34355">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>ext/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>ext/easyui/themes/color.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>ext/farm/farm.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>ext/farm/imgPosition.css?t=0901">
<script type="text/javascript"
	src="<%=basePath%>ext/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>ext/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>ext/easyui/plugins/jquery.edatagrid.js"></script>
<script type="text/javascript"
	src="<%=basePath%>ext/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="<%=basePath%>ext/farm/helper.js?346t"></script>
<script type="text/javascript"
	src="<%=basePath%>ext/farm/imgPosition.js"></script>
</head>

<body>
	<div style="width: 100%; height: 800px;">
		<div id="w" class="easyui-dialog" noheader=true collapsible=false
			minimizable=false maximizable=false scrolling="no" buttons="#wButtons"
			style="width: 81%; height: 455px; padding: 10px;" >
			<div id="controlBox">
				<span style="color: #fff">用户名:</span> <input id="usernameSearch"
					required="false" panelHeight="auto" class="easyui-searchbox" /> <a
					href="#" class="easyui-linkbutton c1" iconCls="icon-search"
					onclick="doSearch()">查询</a> <a href="#"
					class="easyui-linkbutton c2" iconCls="icon-add"
					onclick="javascript:addRow()">添加</a> <a href="#"
					class="easyui-linkbutton c3" iconCls="icon-remove"
					onclick="javascript:grid.edatagrid('cancelRow')">取消</a> <a href="#"
					class="easyui-linkbutton c5" iconCls="icon-cancel"
					onclick="javascript:grid.edatagrid('destroyRow')">删除</a>
			</div>
			<table id="grid"></table>
			<div id="msgBox"></div>
			<div id="wButtons">
			<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#w').dialog('close')">
			关闭窗口
			</a>
		</div>
		</div>
		
		<div id="positionDialog" title="头像上传" class="easyui-dialog"
			style="width: 240px; padding: 10px 10px" closed="true"
			buttons="#positionDialogButtons">
			<form id="formSub" method="POST" enctype="multipart/form-data">
				头像文件：<input id="headImg" name="filePathName" class="easyui-filebox"
					style="width: 200px" data-options="buttonText:'选择文件',prompt:'选择文件'">
			</form>
		</div>

		<div id="positionDialogButtons">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-ok" onclick="startUpload()">开始上传</a> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-cancel"
				onclick="javascript:$('#positionDialog').dialog('close')">关闭窗口</a>
		</div>
	</div>
	<script>
			var grid;
		    $(document).ready(function () {
		    	var indexFrame=$("#mainFrame",parent.window.document);
		    	var foot=$("#foot",parent.window.document);
		    	indexFrame.attr("rows","60,*,50");
		    	foot.attr("src","tools.jsp");
		        //配置表格
		        grid = $('#grid').edatagrid({
		            title: '用户清单',
		            method:'post',
		            url: '<%=basePath%>/user/gridData',
		            saveUrl: '<%=basePath%>/user/save',
		            updateUrl: '<%=basePath%>/user/save',
		            destroyUrl: '<%=basePath%>/user/delete',  
		            border: false,                 
		            rownumbers: true,
		            remoteSort: true,
		            nowrap: false,
		            singleSelect: true,
		            fitColumns: true,
		            pagination: true,
		            striped: true,
		            autoSave:true,
		            idField: "id",            
		            columns: [[
		                {field: 'id', title: 'ID',align: 'center', width:50,sortable: true},
		                {field: 'headimg', title: '头像',  align: 'center',width:120,
		                	formatter:function(value,row){
		                		if(value==null||value=="") value="images/farmer.png";
				                return "<img id='headimg"+row.id+"' width='100px' height='100px' style='border:0px;' src='<%=basePath%>"+value+"'/>"
				             },
				             editor: "text"
		                },
		                {field: 'username', title: '用户名', align: 'center',width:50, sortable: true,
		                	editor:{
		                        type:'validatebox' ,
		                        options:{
		                            required:true, 
		                            missingMessage:'用户名必填!'
		                        }
		                    }
		                },
		                {field: 'nickname', title: '昵称',align: 'center',width:50, sortable: true,
		                	editor: "text"
		                },
		                {field: 'exp', title: '经验值', align: 'center',width:50,sortable: true,
		                	formatter:function(value,row){
				                return "<img width='30px' height='30px' style='border:0px;' src='<%=basePath%>images/exp.png'/><span style='position:relative;top:-10px;'>"+value+"</span>"
				             },
		                	editor: "text"
		                },
		                {field: 'score', title: '积分', align: 'center',width:50,sortable: true,
		                	formatter:function(value,row){
				                return "<img width='30px' height='30px' style='border:0px;' src='<%=basePath%>images/score.png'/><span style='position:relative;top:-10px;'>"+value+"</span>"
				             },
		                	editor: "text"
		                },
		                {field: 'money', title: '金币', align: 'center',width:50,sortable: true,
		                	formatter:function(value,row){
				                return "<img width='30px' height='30px' style='border:0px;' src='<%=basePath%>images/coin.png'/><span style='position:relative;top:-10px;'>"+value+"</span>"
				             },
		                	editor: "text"
		                },
		                {field: 'operation', title: '操作',align: 'center',width:100,
		                	formatter: function (value, row) {
		                        return '<button class="easyui-linkbutton c4" iconCls="icon-edit" onclick="UploadHeadImg()">上传头像</button>'+
		                        '<button href="#" class="easyui-linkbutton c3" iconCls="icon-save" onclick="saveRow()">保存数据</button>';
		                    }
		                }
		            ]],
		            destroyMsg:{
		                norecord:{
		                    title:'警告',
		                    msg:'首先需要选中记录，然后在点击删除按钮'
		                },
		                confirm:{
		                    title:'确认',
		                    msg:'是否删除选中记录?'
		                }
		            },
		            
		            onSuccess:function(index,row){
		                console.log(row);
		                $("#msgBox").text(row.msg);
		            },
		            onDestroy:function(index,row){
		                console.log(row);
		                $("#msgBox").text(row.msg);
		            }
		        });
		        grid.datagrid('resize', {
		            height: $(window).height()-50,
		            width: $(window).width()*0.77
		        })
		        grid.datagrid({
		            fitColumns:true
		        });
		        grid.datagrid("getPager").pagination({
		            pageSize: 5,
		            pageList: [5,10,15,20]
		        });
		    });
		    function addRow(){
		    	var row = grid.edatagrid('getSelected');
		    	var rowIndex =grid.edatagrid('getRowIndex', row);
		    	grid.datagrid("insertRow", {
		           index: 0, 
		           row: {}
		        });
		        grid.datagrid("beginEdit", 0);
		        rowIndex = 0;   
		    }
		    function saveRow(){
		    	var row = grid.edatagrid('getSelected');
		    	var rowIndex =grid.edatagrid('getRowIndex', row);
		    	grid.datagrid("endEdit", rowIndex);
		    	parent.window.frames[0].window.location.reload();
		    }
		    function doSearch(){
		        grid.datagrid("load",{
		        	username: $("#usernameSearch").val()
		        });
		    }
		    
		    function UploadHeadImg(){
		    	$("#positionDialog").dialog({
		    		closed: false
		    	});
		    }
		    
		    function startUpload(){
		    	var row = grid.edatagrid('getSelected');
		    	var rowIndex =grid.edatagrid('getRowIndex', row);
		    	$('#formSub').form('submit', {
		            url: '<%=basePath%>/file/saveHeadImg',
		            onSubmit: function (param) {
		            	return $(this).form('validate');
		            },
		            success: function (result) {
		                var result = eval('(' + result + ')');
		                if (result.code == 0) {
		                    $('#positionDialog').dialog('close');
		                    grid.datagrid("beginEdit", rowIndex);
							var imgUrlObj=grid.datagrid('getEditor', {index:rowIndex,field:'headimg'});
							imgUrlObj.target.val(result.msg);
							$.messager.show({
			                    title: "消息",
			                    msg: "上传成功"
			                });
		                }
		                
		            }
		        });
		    }
		</script>
</body>
</html>