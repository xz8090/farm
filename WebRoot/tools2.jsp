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
<title>工具</title>

</head>
<body class="bar" align="center">
<audio id="negtive" src="<%=basePath%>sounds/negtive.mp3"></audio>
	<style type="text/css">
        body {
            margin: 0px;           
        }
        
        .bar{
        	background-image:url(images/background.png);
        }
        .bag{
        	width:20px;
        	height:20px;
        	background-color:red;
			border-radius: 50%;
			text-align: center;
        }
        .bag span{
        	text-align: center;
        	color:white;
        	font-size:80%;
        }
        .seed{
        	position:relative;
        	float:left;
        }
        .datagrid-wrap{
        	background:transparent;
        	border:none;
        }
        .datagrid-body{
        	overflow:hidden;
        }
    </style>
	<div id="myBag" style="width:80%;height:100%;position:relative;left:20%;" align="center">
		<div style="position:relative;float:left;"><img src="<%=basePath%>images/leftTab.png" width="80" onclick="previousPage()"/></div>
		<div id="seeds" style="width:60%;position:relative;float:left;height:100px;">
			<table id="StoreList" class='tbledit' url="<%=basePath%>shop/gridData" style="width:100%;height:150px;padding:10px 10px;border:none;background:transparent;"
         	singleSelect="true" fitColumns="true" remoteSort="false" pagination="true" showPageList="false">
	        </table>
		</div>
		<div style="position:relative;float:left;"><img src="<%=basePath%>images/rightTab.png" width="80" onclick="nextPage()"/></div>
	</div>
	<script>
	var negtive = $("#negtive")[0];
	var rowDataTemp={};
	var cardview = $.extend({}, $.fn.datagrid.defaults.view, {
		renderRow: function(target, fields, frozen, rowIndex, rowData){
			//console.info(target);
			//console.info(fields);
			//console.info(frozen);
			//console.info(rowIndex);
			//console.info(rowData);
			var tempId="seed"+rowData.id;
			var cc = [];
			if (!frozen && typeof(rowData.cId) != "undefined" && rowData.cId!=null && rowData.cId!=""){
				cc.push('<div style="width:23%;border:0;position:relative;float:left;background:transparent;">');
				cc.push('<div class="bag" style="position:relative;left:40%;"><span>'+rowData.num+'</span></div>');
				var img = '<%=basePath%>images/crops/'+rowData.cId+'/5.png';
				cc.push('<div id="'+tempId+'" style="background:transparent;" align="center">'
				+'<img onclick="javascript:getParent(\''+rowData.num+'\');'
				+'" onmouseover="toolTip2(\''+tempId+'\',\''
						+rowData.cId+'\',\''
						+rowData.caption+'\',\''
						+rowData.output+'\',\''
						+rowData.price+'\',\''
						+rowData.harvestNum+'\',\''
						+rowData.landTypeCode+'\',\''
						+rowData.landTypeCaption+'\',\''
						+rowData.seedTypeCode+'\',\''
						+rowData.seedTypeCaption+'\',\''
						+rowData.width+'\',\''
						+rowData.height+'\',\''
						+rowData.offsetX+'\',\''
						+rowData.offsetY+'\',\''
						+rowData.status
						+'\')" src="' + img + '" width="50%"></div>');
				cc.push('</div>');
			}
			return cc.join('');
		}
	});
	var grid=$('#StoreList').edatagrid({
        view: cardview
    });
	grid.datagrid("getPager").pagination({
        pageSize: 4,
        pageList: [4,8,12,16]
    });
	grid.datagrid("getPager").pagination('select');
	$('.pagination').hide();
	function previousPage(){
		var options = grid.datagrid('getPager').data("pagination").options;
		var curr = options.pageNumber;
		if(curr-1>0) grid.datagrid("getPager").pagination('select', curr-1);
		else{
			$.messager.show({
                title: "消息",
                msg: "当前已经是第一页",
                height:"80px",
                timeout:3000
           });
		}
	}
	function nextPage(){
		var options = grid.datagrid('getPager').data("pagination").options;
		var curr = options.pageNumber;
		var total = options.total;
		var totalPages = Math.ceil(total/options.pageSize); 
		if(curr+1<=totalPages) grid.datagrid("getPager").pagination('select', curr+1);
		else{
			$.messager.show({
                title: "消息",
                msg: "当前已经是最后一页",
                height:"80px",
                timeout:3000
           });
		}
	}
	function toolTip2(seedId,cId,caption,output,price,harvestNum,landTypeCode,landTypeCaption,seedTypeCode,seedTypeCaption,
			width,height,offsetX,offsetY,status){
		var tip='<div><span>'+caption+'</span><br/>'
			+'<span>单季产量</span>:<span>'+output+'个果实</span><br/>'
			+'<span>果实单价</span>:<span>'+price+'金币</span><br/>'
			+'<span>季数</span>:<span>'+harvestNum+'季作物</span><br/>'
			+'<span>土地要求</span>:<span>'+landTypeCaption+'</span><br/>'
		+'</div>';
		$("#"+seedId).tooltip({
		    position: 'center',
		    content: tip,
		    onShow: function(){
				$(this).tooltip('tip').css({
					backgroundColor: '#666',
					borderColor: '#666'
				});
		    },
		    deltaX:60,
		    deltaY:20
		});
		rowDataTemp.cId=cId;
		rowDataTemp.caption=caption;
		rowDataTemp.output=output;
		rowDataTemp.price=price;
		rowDataTemp.harvestNum=harvestNum;
		rowDataTemp.landTypeCode=landTypeCode;
		rowDataTemp.landTypeCaption=landTypeCaption;
		rowDataTemp.seedTypeCode=seedTypeCode;
		rowDataTemp.seedTypeCaption=seedTypeCaption;
		rowDataTemp.width=width;
		rowDataTemp.height=height;
		rowDataTemp.offsetX=offsetX;
		rowDataTemp.offsetY=offsetY;
		rowDataTemp.status=status;
		//console.info(rowDataTemp);
	}
	function getParent(num){
		//console.info(rowDataTemp);
		if(num<=0){
			negtive.play();
			$.messager.show({
                title: "消息",
                msg: "种子数量不足，请先购买！",
                height:"80px",
                timeout:1000
           });
		}else{
			try
			{
				var landObj=$("#land${param.landId}");
				parent.window.frames[1].window.sowCId(rowDataTemp,landObj);
			}catch(err){
				console.info("该父页面不支持播种");
			}
		}
	}
	</script>
</body>
</html>