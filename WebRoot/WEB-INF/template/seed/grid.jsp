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
<div id="controlBox">
        <span style="color:#fff">种子名称:</span>
        <input id="captionSearch" required="false" panelHeight="auto" class="easyui-searchbox" />

        <a href="#" class="easyui-linkbutton c1" iconCls="icon-search" 

onclick="doSearch()">查询</a>

        <a href="#" class="easyui-linkbutton c2" iconCls="icon-add" 

onclick="javascript:newRecord()">添加</a>

        <a href="#" class="easyui-linkbutton c4" iconCls="icon-edit" 

onclick="javascript:editRecord()">编辑</a>

        <a href="#" class="easyui-linkbutton c3" iconCls="icon-remove" 

onclick="javascript:grid.edatagrid('cancelRow')">取消</a>

        <a href="#" class="easyui-linkbutton c5" iconCls="icon-cancel"

onclick="javascript:grid.edatagrid('destroyRow')">删除</a>
</div>
<table id="grid"></table>  
<div id="msgBox"></div>
<div id="formSeedContainer" class="easyui-dialog" style="width:90%;height:300px;padding:10px 10px" closed="true" buttons="#formSeedButtons">
    <form id="formSeed" method="POST" novalidate>
        <table class='tbledit'>
            <tr>
                <td>ID：</td>
                <td><input name="id" required="true" value="0"></td>
            	<td>种子ID：</td>
                <td><input name="cId" required="true" class="easyui-validatebox"></td>
            </tr>
            <tr>
                <td>种子名称：</td>
                <td><input name="caption" required="true" class="easyui-validatebox"></td>
				<td>X季作物：</td>
                <td><input name="harvestNum" required="true"></td>
            </tr>
            <tr>
                <td>种子等级：</td>
                <td><input name="cropLevel" required="true"></td>
				<td>种子类型：</td>
                <td>
                	<input name="type" required="true" id="type" class="easyui-combobox" panelHeight="auto"
			           data-options="editable:false,valueField:'code',textField:'caption',url:'<%=basePath%>/codeSeedType/data'"
			        >
                </td>
            </tr>
            <tr>
                <td>可获经验：</td>
                <td><input name="exp" required="true"></td>
                <td>每季成熟所需时间：</td>
                <td><input name="matureTime" required="true"></td>
            </tr>
            <tr>
                <td>每季成熟可获收成：</td>
                <td><input name="output" required="true"></td>
                <td>种子采购价：</td>
                <td><input name="price" required="true"></td>
            </tr>
            <tr>
                <td>每个收获的果实单价：</td>
                <td><input name="price4UnitSale" required="true"></td>
                <td>土地需求：</td>
                <td>
                	<input name="landRequirement" required="true" id="landRequirement" class="easyui-combobox" panelHeight="auto"
			           data-options="editable:false,valueField:'code',textField:'caption',url:'<%=basePath%>/codeLandRequire/data'"
			        >
                </td>
            </tr>
            <tr>
                <td>每季成熟可获积分：</td>
                <td><input name="score" required="true"></td>
                <td>提示信息：</td>
                <td><input name="tip" value="0"></td>
            </tr>
        </table>
    </form>
</div>
<div id="formSeedButtons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveForm()">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#formSeedContainer').dialog('close')">取消</a>
</div>
<div id="win" class="easyui-window" title="编辑成长阶段" style="width:60%;height:460px" closed="true" 
    data-options="iconCls:'icon-edit',modal:true">
    
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
            title: '种子清单',
            method:'post',
            url: '<%=basePath%>/seed/gridData',
            saveUrl: '<%=basePath%>/seed/save',
            updateUrl: '<%=basePath%>/seed/save',
            destroyUrl: '<%=basePath%>/seed/delete',
            
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
                {field: 'id', title: 'ID',align: 'center', sortable: true},
                {field: 'cId', title: '种子ID',  align: 'center'},
                {field: 'caption', title: '种子名称',  align: 'center', sortable: true},
                {field: 'harvestNum', title: 'X季作物', align: 'center',
                	formatter:function(value,row){
		                 return value+'季作物'
		             }   
                },
                {field: 'cropLevel', title: '种子等级'},
                {field: 'type', title: '种子类型', align: 'center',
                	formatter:function(value,row){
		                 if(value=="0"){
		                     return '普通';
		                 }if(value=="1"){
		                     return '有机';
		                 }else{
		                	 return '其他';
		                 }
		             }      
             	},
                {field: 'exp', title: '可获经验', align: 'center'},
                {field: 'matureTime', title: '每季成熟所需时间', align: 'center'},
                {field: 'output', title: '每季成熟可获收成', align: 'center'},
                {field: 'price', title: '种子采购价',align: 'center'},
                {field: 'price4UnitSale', title: '每个收获的果实单价', align: 'center'},
                {field: 'landRequirement', title: '土地需求', align: 'center',
                	formatter:function(value,row){
                		
		                 if(value=="0"){
		                     return '普通土地';
		                 }if(value=="1"){
		                     return '黄土地';
		                 }if(value=='2'){
		                	 return '红土地';
		                 }if(value=='3'){
		                	 return '黑土地';
		                 }if(value=='4'){
		                	 return '蓝土地';
		                 }if(value=='5'){
		                	 return '金土地';
		                 }
		                 else{
		                	 return '其他';
		                 }
		             } 
                },
                {field: 'score', title: '每季成熟可获积分', align: 'center'},
                {field: 'tip', title: '提示信息',  align: 'center'},
                {field: 'operation', title: '操作',align: 'center',width:'6%',
                	formatter: function (value, row) {
                        return '<button class="easyui-linkbutton c4" iconCls="icon-edit" onclick="winOpen()">成长阶段</button>';
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
        grid.datagrid('resize',{
        	width: ($(window).width()*0.99),
        	height:($(window).height()-36)
        });
        grid.datagrid({
            fitColumns:true
        });
        grid.datagrid("getPager").pagination({
            pageSize: 5,
            pageList: [5,10,15,20]
        });
    });
    function doSearch(){
        grid.datagrid("load",{
        	caption: $("#captionSearch").val()
        });
    }

    function newRecord(){
        $('#formSeedContainer').dialog('open').dialog('center').dialog('setTitle','添加数据');     
        $('#formSeed').form('clear');
        $('#formSeed').find("input[name='id']").val(0);
        $('#formSeed').find("input[name='id']").attr("disabled","disabled"); 
    }
    
    function editRecord(){
    	//$('#formSeed').find("input[name='id']").attr("disabled","disabled"); 
        var row = grid.datagrid('getSelected');
        if (row){
            $('#formSeedContainer').dialog('open').dialog('center').dialog('setTitle','编辑数据');
            $('#formSeed').form('load',row);
        } else {
            $.messager.show({
                title: "消息",
                msg: "请先选择一行数据，然后再尝试点击操作按钮！"
            });
        }
    }

    function saveForm() {
        $('#formSeed').form('submit', {
            url: '<%=basePath%>/seed/save',
            onSubmit: function (param) {
            	return $(this).form('validate');
            },
            success: function (result) {
                var result = eval('(' + result + ')');
                if (result.code == 0) {
                    $('#formSeedContainer').dialog('close');
                    grid.datagrid('reload');
                }
                $.messager.show({
                    title: "消息",
                    msg: result.msg
                });
            }
        });
    }
    
    function winOpen(){
    	//$("#win").window("open");
    	//var row = grid.datagrid('getSelected');
    	//alert(row.cId);
    	$('#win').dialog({    
    	    title: '编辑成长阶段', 
    	    closed: false,    
    	    cache: false,    
    	    href: '<%=basePath%>/cropsGrow/grid',    
    	    modal: true   
    	}); 
    }
    $('#win').dialog({  
        onClose:function(){  
        	grid.datagrid('reload'); 
        }  
    }); 

</script>
</body>
</html>