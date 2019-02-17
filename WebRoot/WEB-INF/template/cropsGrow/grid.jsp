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
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/easyui/themes/green/easyui.css?t564">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/farm/farm.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/farm/imgPosition.css?t=0901">
    
    <script type="text/javascript" src="<%=basePath%>ext/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/easyui/plugins/jquery.edatagrid.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/easyui/plugins/jquery.draggable.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/easyui/locale/easyui-lang-zh_CN.js"></script>
    
    <script type="text/javascript" src="<%=basePath%>ext/farm/helper.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/farm/imgPosition.js"></script>
</head>
<body>
<div id="controlBox2">

        <a href="#" class="easyui-linkbutton c2" iconCls="icon-add" 

onclick="javascript:newRecord2()">添加</a>

        <a href="#" class="easyui-linkbutton c4" iconCls="icon-edit" 

onclick="javascript:editRecord2()">编辑</a>

        <a href="#" class="easyui-linkbutton c3" iconCls="icon-remove" 

onclick="javascript:grid2.edatagrid('cancelRow')">取消</a>

        <a href="#" class="easyui-linkbutton c5" iconCls="icon-cancel"

onclick="javascript:grid2.edatagrid('destroyRow')">删除</a>
</div>
<table id="grid2"></table>  
<div id="msgBox2"></div>
<div id="formCropsGrowContainer" class="easyui-dialog" style="width:60%;height:300px;padding:10px 10px" closed="true" buttons="#formCropsGrowButtons2">
    <form id="formCropsGrow" method="POST" novalidate>
        <table class='tbledit'>
            <tr>
                <td>ID：</td>
                <td><input name="id" required="true" class="w200" value="0"></td>
            	<td>种子ID：</td>
                <td><input name="cId" required="true" class="easyui-validatebox w1024"></td>
                <td><span style="font-size:110%;">小提示：</span></td>
                <td rowspan="6">
                	<span>
                	生长阶段<br/>
                	0：种子阶段->种子<br/>
                	1：生长阶段->发芽<br/>
                	2：生长阶段->小叶子<br/>
                	3：生长阶段->大叶子<br/>
                	4：生长阶段->开花<br/>
                	5：成熟阶段->成熟<br/>
                	6：枯草期->枯草<br/>
                	</span>
                </td>
            </tr>
            <tr>
                <td>生长阶段：</td>
                <td><input name="growStep" required="true" class="easyui-validatebox w50" placeholder="0~6"></td>
				<td>生长阶段标题：</td>
                <td><input name="growCaption" required="true" class="w200" placeholder="如幼苗"></td>
            </tr>
            <tr>
                <td>生长阶段时间：</td>
                <td><input name="growTime" required="true" class="w200">秒</td>
				<td>生虫概率：</td>
                <td><input name="insect" required="true" class="w200">%</td>
            </tr>
            <tr>
                <td>图片宽度：</td>
                <td><input name="width" required="true" class="w200">px</td>
                <td>图片高度：</td>
                <td><input name="height" required="true" class="w200">px</td>
            </tr>
            <tr>
                <td>图片offsetX：</td>
                <td><input name="offsetX" required="true" class="w200">px</td>
                <td>图片offsetY：</td>
                <td><input name="offsetY" required="true" class="w200">px</td>
            </tr>
            <tr>
                <td>作物状态：</td>
                <td>
					<input name="status" id="status" class="easyui-combobox" panelHeight="auto"
			           data-options="editable:false,valueField:'code',textField:'caption',url:'<%=basePath%>/codeCropStatus/data'"
			        >
				</td>
                <td></td>
                <td><a href="javascript:void(0)" class="easyui-linkbutton c4" onclick="javascript:editPic()">编辑图片位置</a></td>
            </tr>
            
        </table>
    </form>
</div>
<div id="formCropsGrowButtons2">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveForm2()">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#formCropsGrowContainer').dialog('close')">取消</a>
</div>
<div id="positionDialog" title="定位编辑器" class="easyui-dialog" style="width:240px;height:420px;padding:10px 10px" closed="true" buttons="#positionDialogButtons">
    <div id="tools-imagePositioner-display" class="tools-imagePositioner-display">
       <img class="easyui-draggable easyui-resizable" data-options="onDrag:imagePositioneronDrag"  src=""/>
    </div>
</div>
<div id="positionDialogButtons">

    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok"

 onclick="gainPostion()">确定</a>

    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"

 onclick="javascript:$('#positionDialog').dialog('close')">取消</a>
</div>  
<script>
	var img=$("#positionDialog div img");
	var grid2;
	var row = grid.datagrid('getSelected');

    $(document).ready(function () {
    	
    	var indexFrame=$("#mainFrame",parent.window.document);
    	var foot=$("#foot",parent.window.document);
    	indexFrame.attr("rows","60,*,50");
    	foot.attr("src","tools.jsp");	

        //配置表格
        grid2 = $('#grid2').edatagrid({
            title: '成长阶段定义',
            method:'post',
            url: '<%=basePath%>/cropsGrow/gridData?cId='+row.cId,
            saveUrl: '<%=basePath%>/cropsGrow/save',
            updateUrl: '<%=basePath%>/cropsGrow/save',
            destroyUrl: '<%=basePath%>/cropsGrow/delete',
            
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
                {field: 'id', title: 'ID',align: 'center',editable:"false"},
                {field: 'cId', title: '种子ID',  align: 'center',editable:"false"},
                {field: 'growStep', title: '生长阶段',  align: 'center', sortable: true},
                {field: 'growCaption', title: '生长阶段标题',align: 'center', sortable: true},
                {field: 'growTime', title: '生长阶段时间',align: 'center', sortable: true},
                {field: 'insect', title: '生虫概率', align: 'center', sortable: true},
                {field: 'width', title: '宽度', align: 'center', sortable: true},
                {field: 'height', title: '高度', align: 'center', sortable: true},
                {field: 'offsetX', title: 'offsetX',align: 'center', sortable: true},
                {field: 'offsetY', title: 'offsetY', align: 'center', sortable: true},
                {field: 'status', title: '作物状态', align: 'center', sortable: true,
                	formatter:function(value,row){
		                 if(value=="0"){
		                     return '种子阶段';
		                 }if(value=="1"){
		                     return '生长阶段';
		                 }if(value=="2"){
		                     return '成熟阶段';
		                 }if(value=="3"){
		                     return '枯草期';
		                 }else{
		                	 return '其他';
		                 }
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
                $("#msgBox2").text(row.msg);
            },
            onDestroy:function(index,row){
                console.log(row);
                $("#msgBox2").text(row.msg);
            }
        });
        grid2.datagrid('resize',{
        	height:($(window).height()*0.55)
        });
        grid2.datagrid({
            fitColumns:true
        });
        grid2.datagrid("getPager").pagination({
            pageSize: 10,
            pageList: [10,15,20,25]
        }); 
    });
    function doSearch(){
        grid2.datagrid("load",{
            gender: $("#genderSearch").val()
        });
    }

    function newRecord2(){
        $('#formCropsGrowContainer').dialog('open').dialog('center').dialog('setTitle','添加数据');     
        $('#formCropsGrow').form('clear');
        $('#formCropsGrow').find("input[name='id']").val(0);
        $('#formCropsGrow').find("input[name='id']").attr("readonly",true); 
        $('#formCropsGrow').find("input[name='cId']").val(row.cId);
        $('#formCropsGrow').find("input[name='cId']").attr("readonly",true); 
    }
    
    function editRecord2(){
        var row = grid2.datagrid('getSelected');
        $('#formCropsGrow').find("input[name='id']").attr("readonly",true);
    	$('#formCropsGrow').find("input[name='cId']").attr("readonly",true);
        if (row){
            $('#formCropsGrowContainer').dialog('open').dialog('center').dialog('setTitle','编辑数据');
            $('#formCropsGrow').form('load',row);
            var code=$('#formCropsGrow').find("input[name='status']").val();
          	//种子阶段图片
        	if(code==0) img.attr("src","<%=basePath%>images/crops/basic/0.png");
        	//枯草期图片
        	else if(code==3) img.attr("src","<%=basePath%>images/crops/basic/9.png");
        	//生长阶段图片
        	else{
        		if(code==2) img.attr("src","<%=basePath%>images/crops/"+row.cId+"/5.png");
        		else{
        			img.attr("src","<%=basePath%>images/crops/"+row.cId+"/"+row.growStep+".png");
        		}
        	}
            imgExtData.offsetX= (row.offsetX==null||row.offsetX=="")?0:row.offsetX;
            imgExtData.offsetY= (row.offsetY==null||row.offsetY=="")?0:row.offsetY;
            imgExtData.width= (row.width==null||row.width=="")?50:row.width;
            imgExtData.height= (row.height==null||row.height=="")?50:row.height;
            positionerLoadImage();
        } else {
            $.messager.show({
                title: "消息",
                msg: "请先选择一行数据，然后再尝试点击操作按钮！"
            });
        }
    }

    function saveForm2() {
    	var cId=$("#formCropsGrow").find("input[name='cId']");
    	cId.val(row.cId);
        $('#formCropsGrow').form('submit', {
            url: '<%=basePath%>/cropsGrow/save?cId='+row.cId,
            onSubmit: function (param) {
            	return $(this).form('validate');
            },
            success: function (result) {
                var result = eval('(' + result + ')');
                if (result.code == 0) {
                    $('#formCropsGrowContainer').dialog('close');
                    $('#grid2').datagrid('reload');
                }
                $.messager.show({
                    title: "消息",
                    msg: result.msg
                });
            },
            onLoadError:function (result) {
            	$.messager.show({
                    title: "消息",
                    msg: "请检查你的输入！"
                });
            }
        });
    }
    function editPic(){
    	var code=$('#formCropsGrow').find("input[name='status']").val();
    	var growStep=$('#formCropsGrow').find("input[name='growStep']").val();
    	//种子阶段图片
    	if(code==0) img.attr("src","<%=basePath%>images/crops/basic/0.png");
    	//枯草期图片
    	else if(code==3) img.attr("src","<%=basePath%>images/crops/basic/9.png");
    	//生长阶段图片
    	else{
    		if(code==2) img.attr("src","<%=basePath%>images/crops/"+row.cId+"/5.png");
    		else{
    			img.attr("src","<%=basePath%>images/crops/"+row.cId+"/"+growStep+".png");
    		}
    	}
    	
    	$("#positionDialog").dialog({
    		closed: false
    	});
    }

	var imgExtData= function (){
		  this.offsetX= 0;
		  this.offsetY= 0;
		  this.width= 0;
		  this.height= 0;
	};
	
	draggableImg = $('#tools-imagePositioner-display img');
	
	draggableImg.draggable({
        onStopDrag: function () {
			imgExtData.offsetX = draggableImg.position().left;
			imgExtData.offsetY = draggableImg.position().top;
			imgExtData.width = draggableImg.width();
			imgExtData.height = draggableImg.height();
            console.log(imgExtData);
        }
    });

    function gainPostion(){
    	
    	var offsetX=$("#formCropsGrow").find("input[name='offsetX']");
    	var offsetY=$("#formCropsGrow").find("input[name='offsetY']");
    	var width=$("#formCropsGrow").find("input[name='width']");
    	var height=$("#formCropsGrow").find("input[name='height']");
    	offsetX.val(imgExtData.offsetX);
    	offsetY.val(imgExtData.offsetY);
    	width.val(imgExtData.width);
    	height.val(imgExtData.height);
    	$("#positionDialog").dialog('close');
    	$('#grid2').datagrid('reload');
    }
</script>
</body>
</html>