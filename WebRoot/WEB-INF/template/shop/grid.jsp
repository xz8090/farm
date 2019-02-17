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
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/easyui/themes/icon.css?t=1">
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
<body id="myBody">
<div style="width: 100%; height: 800px;">
<div id="formShopContainer" class="easyui-dialog" iconCls='icon-seed' title="种子仓库" style="width:80%;height:400px;padding:10px 10px" closed="false">
    <form id="formShop" method="POST" novalidate>
        <table id="StoreList" class='tbledit' url="<%=basePath%>shop/seeds" style="width:100%;height:340px;padding:10px 10px"
         singleSelect="true" fitColumns="true" remoteSort="false"
            pagination="true">
          <thead>
			<tr>
				<th field="caption" width="25%" sortable="true">种子名称</th>
				<th field="cropLevel" width="25%" sortable="true">种子等级</th>
				<th field="type" width="25%" sortable="true">种子类型</th>
				<th field="landRequirement" width="25%" sortable="true">土地需求</th>
			</tr>
		</thead>
        </table>
    </form>
</div>
</div>
<script>

	$(document).ready(function() {
		
		var username='${sessionScope.curUser}';
		var indexFrame=$("#mainFrame",parent.window.document);
		var foot=$("#foot",parent.window.document);
		if(username!=null && username!='')
		{
			indexFrame.attr("rows","60,*,100");
			foot.attr("src","tools2.jsp");	
		}
		else{
			$.messager.show({
                title: "消息",
                msg: "请先登录!",
                timeout:3000
           });
			
		}
	});
	
	var cardview = $.extend({}, $.fn.datagrid.defaults.view, {
		renderRow: function(target, fields, frozen, rowIndex, rowData){
			//console.info(target);
			//console.info(fields);
			//console.info(frozen);
			//console.info(rowIndex);
			//console.info(rowData);
			var tempId="seed"+rowData.id;
			var cc = [];
			if (!frozen && typeof(rowData.cId) != undefined && rowData.cId!=null && rowData.cId!=""){
				cc.push('<div style="width:23%;padding:10px 5px;border:0;position:relative;float:left;background-image:url(<%=basePath%>images/card.png);background-size:100%;">');
				var img = '<%=basePath%>images/crops/'+rowData.cId+'/5.png';
				cc.push('<div style="width:100%;height:60px;" align="center"><p align="center"><span class="c-label">小贴士：' + rowData.tip + '</span></p></div>');
				cc.push('<div id="'+tempId+'" style="width:100%;height:120px;" align="center"><img onmouseover="toolTip(\''+tempId+'\',\''
						+rowData.caption+'\',\''
						+rowData.cropLevel+'\',\''
						+rowData.price+'\',\''
						+rowData.seedTypeCaption+'\',\''
						+rowData.landTypeCaption+'\',\''
						+rowData.harvestNum+'\',\''
						+rowData.matureTime+'\',\''
						+rowData.output+'\',\''
						+rowData.exp+'\',\''
						+rowData.price4UnitSale+'\',\''
						+rowData.score+'\',\''
						
						+'\')" src="' + img + '" width="50%"></div><br/>');
				cc.push("<div align='center' style='width:100%;'><button class='easyui-linkbutton c4' type='button' iconCls='icon-ok' onclick='confirmBuy(\""+rowData.caption+"\","+rowData.cId+")'>我要购买</button></div>");
				/*(seedId,caption,cropLevel,price,seedTypeCaption,landTypeCaption,harvestNum,matureTime,output,exp,price4UnitSale,score)*/
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
	grid.datagrid("getPager").pagination('select');//重新加载才能分页
	function confirmBuy(seedName,cId){
		try{
			var obj={};
			obj.id=0;
			obj.username='${sessionScope.curUser.username}';
			obj.cId=cId;
			obj.num=0;
			$.messager.confirm('种子购买','确认购买<font style="color:yellow;">'+seedName+'</font>种子么?',function(r){
			    if (r){
					$.ajax({
				        url: "<%=basePath%>shop/saveBag",
				        type: 'POST',
				        dataType:'json',
				        data: JSON.stringify(obj),
				        contentType:"application/json",
			            success: function (result) {
			                console.info(result);
			                $.messager.show({
				                 title: "消息",
				                 msg: result.msg
				            });
			                parent.window.frames[0].window.location.reload();
			                parent.window.frames[2].window.location.reload();
			                //alert($("#myBag",parent.window.frames[2].document).html());
			            }
			        });
			    }
			});
		}
		catch(err){
			$.messager.show({
                title: "消息",
                msg: "请先选择人物"
           });
		}
		
		
	}
	
	/*鼠标划过悬浮，显示一个小提示框的方法*/
	function toolTip(seedId,caption,cropLevel,price,seedTypeCaption,landTypeCaption,harvestNum,matureTime,output,exp,price4UnitSale,score){
		var tip='<div><span>名称</span>:<span>'+caption+'</span><br/>'
			+'<span>级别</span>:<span>'+cropLevel+'</span><br/>'
			+'<span>价格</span>:<span>'+price+'金币</span><br/>'
			+'<span>类别</span>:<span>'+seedTypeCaption+'</span><br/>'
			+'<span>土地</span>:<span>'+landTypeCaption+'</span><br/>'
			+'<span>可收获季</span>:<span>'+harvestNum+'季</span><br/>'
			+'<span>成熟时间</span>:<span>'+matureTime+'秒</span><br/>'
			+'<span>单季收获</span>:<span>'+output+'个果实</span><br/>'
			+'<span>经验收获</span>:<span>'+exp+'</span><br/>'
			+'<span>单个果实可获金币</span>:<span>'+price4UnitSale+'个</span><br/>'
			+'<span>积分收获</span>:<span>'+score+'</span><br/>'
		+'</div>'
		$("#"+seedId).tooltip({
		    position: 'bottom',
		    content: tip,
		    onShow: function(){
				$(this).tooltip('tip').css({
					backgroundColor: 'rgba(102,102,102,0.9)',
					borderColor: 'rgba(102,102,102,0.9)'
				});
		    },
		    deltaX:110,
		    deltaY:200
		});
	}
</script>
</body>
</html>