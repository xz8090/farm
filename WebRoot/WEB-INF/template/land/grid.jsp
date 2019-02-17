<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String wsBasePath = "ws://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <script type="text/javascript" src="<%=basePath%>ext/farm/sockjs.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/farm/helper.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/farm/imgPosition.js"></script>
    <style type="text/css">
    .ordinarylands,.blacklands,.redlands,.goldlands{
    	position:relative;
    }
    .blacklands{
    	left:100px;
    	top:-50px;
    }
    .redlands{
    	left:200px;
    	top:-100px;
    }
    .goldlands{
    	left:300px;
    	top:-150px;
    }
    .goldland{
    	width:100px;
    	height:65px;
    	position:absolute;
    	background:url('<%=basePath%>images/goldland.png');
    	background-size:100px;
		background-repeat:no-repeat;
		background-position:0px -20px;
    }
    .redland{
    	width:100px;
    	height:65px;
    	position:absolute;
    	background:url('<%=basePath%>images/redland.png');
    	background-size:100px 100px;
		background-repeat:no-repeat;
		background-position:0px -20px;
    }
    .blackland{
    	width:100px;
    	height:65px;
    	position:absolute;
    	background:url('<%=basePath%>images/blackland.png');
    	background-size:100px 100px;
		background-repeat:no-repeat;
		background-position:0px -20px;
    }
    .ordinaryland{
    	width:100px;
    	height:65px;
    	position:absolute;
    	background:url('<%=basePath%>images/ordinaryland.png');
    	background-size:100px 100px;
		background-repeat:no-repeat;
		background-position:0px -20px;
    }
    #myLands{
    	position:absolute;
    	top:150px;
    	left:5%;
    }
    </style>
</head>
<body>
<audio id="cleanLand" src="<%=basePath%>sounds/cleanLand.mp3"></audio>
<audio id="harvest" src="<%=basePath%>sounds/harvest.mp3"></audio>
<audio id="hasPlanted" src="<%=basePath%>sounds/hasPlanted.mp3"></audio>
<audio id="killWorm" src="<%=basePath%>sounds/killWorm.mp3"></audio>
<audio id="negtive" src="<%=basePath%>sounds/negtive.mp3"></audio>
<audio id="plant" src="<%=basePath%>sounds/plant.mp3"></audio>
<audio id="worm" src="<%=basePath%>sounds/worm.mp3"></audio>
<script>
	var cleanLand = $("#cleanLand")[0];
	var harvest = $("#harvest")[0];
	var hasPlanted = $("#hasPlanted")[0];
	var killWorm = $("#killWorm")[0];
	var negtive = $("#negtive")[0];
	var plant = $("#plant")[0];
	var worm = $("#worm")[0];
</script>
<div class="BigBox" style="width: 100%;height:800px" align="center">
	<div id="myLands" align="center">
		<div class="ordinarylands">
		</div>
		<div class="blacklands">
		</div>
		<div class="redlands">
		</div>
		<div class="goldlands">		
		</div>
	</div>
	<div id="win" class="easyui-window" title="种子收纳袋" style="width:80%;height:280px" closed="true" 
	data-options="iconCls:'icon-edit',modal:true">
		
	</div>
</div> 
<script>
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
		createCrops(evt.data);
		
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
	
	var landnum=6;
	var mylandsObj=[];
	var username='${sessionScope.curUser}';
	var startEnter=0;
	$(document).ready(function(){
		var indexFrame=$("#mainFrame",parent.window.document);
    	var foot=$("#foot",parent.window.document);
    	indexFrame.attr("rows","60,*,50");
    	foot.attr("src","tools.jsp");
    	init();
    	initWebSocket();
	});

	function init(){
		if(username!=null && username!='')
		{
			$.ajax({
		        url: "<%=basePath%>land/getLands",
		        type: 'POST',
		        dataType:'json',
		        cache:false,
		        async:false,
		        data: {username:username},
		        contentType:"application/json",
	            success: function (result) {
	            	mylandsObj=eval(result);
	            	//console.info(mylandsObj);
	            	createLands($(".ordinarylands"),"ordinaryland",0);
	        		createLands($(".blacklands"),"blackland",3);
	        		createLands($(".redlands"),"redland",2);
	        		createLands($(".goldlands"),"goldland",5);
	            }
	        });
			
		}else{
			negtive.play();
			$.messager.show({
                title: "消息",
                msg: "请先登录!",
                timeout:3000
           });
			
		}
	}

    var pest=[];
	function createLands(landsObj,typeName,typeCode){	
		for(var i=0,j=0;j<mylandsObj.length;j++){
			pest[j]={
					id:	mylandsObj[j].id,
					status:0,//土地是否有虫
					ifStart:0
			};
			if(Number(mylandsObj[j].landType)==typeCode)//landType的code=5即金土地
			{
				var landObj=$('<div class="'+typeName+'" id="land'+mylandsObj[j].id
						+'" onclick="javascript:winOpen($(this),'+j+')"></div>');
				landObj.css({
					"top":50*(i+1)+"px",
					"left":100*(i+1)+"px"
				});
				landObj.attr("typeCode",typeCode);
				landsObj.append(landObj);
				i++;
			}
		}
	}
	function getImgUrl(code,cId,growStep){
      	//种子阶段图片
    	if(code==0) return "<%=basePath%>images/crops/basic/0.png";
    	//枯草期图片
    	else if(code==3) return "<%=basePath%>images/crops/basic/9.png";
    	//生长阶段图片
    	else{
    		if(code==2) return "<%=basePath%>images/crops/"+cId+"/5.png";
    		else{
    			return "<%=basePath%>images/crops/"+cId+"/"+growStep+".png";
    		}
    	}
	}
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
	function createCrops(nowTime){
		var mylandsObj2=[];
		$.ajax({
	        url: "<%=basePath%>land/getLands",
	        type: 'POST',
	        dataType:'json',
	        cache:false,
	        async:false,
	        data: {username:username},
	        contentType:"application/json",
            success: function (result) {
            	mylandsObj2=eval(result);
            }
		});
		console.info("nowTime:"+nowTime);
		for(var j=0;j<mylandsObj2.length;j++){
				var oldCId=mylandsObj[j].cId;
				var cId=mylandsObj2[j].cId;
				var status=mylandsObj2[j].status;
				var oldgrowStep=mylandsObj[j].growStep;
				var growStep=mylandsObj2[j].growStep;
				var growChange=(oldgrowStep!=growStep||oldCId!=cId)?true:false;//作物状态改变才能移除上一次状态,注意空地种种子的状态改变
				//console.info("oldgrowStep:"+oldgrowStep+" newgrowStep:"+growStep+" growChange:"+growChange);
				var haspest=mylandsObj2[j].haspest;
				var residueNum=mylandsObj2[j].residueNum;
				var imgObj=$('<img id="crop" />');
				var output=0;
				var caption="";
				var time=new Date().format("yyyy-MM-dd hh:mm:ss");
				var startTime="";
				var landObj=$('#land'+mylandsObj2[j].id);
				if(growChange) landObj.find("img").remove();
				landObj.tooltip("destroy");
				//种子属性
				var seedExp=0;
				var salePrice=0;
				var seedScore=0;
				var seedWidth=0;
				var seedHeight=0;
				var seedOffsetX=0;
				var seedOffsetY=0;
				var growTime=0;
				var matureTime=0;
				var insect=0;
				//如果cId=0，说明没有种子，如果不为0再查询另外一张表获取图片位置信息
				if(cId!=0)
				{
					$.ajax({
				        url: "<%=basePath%>land/getSeeds?cId="+cId+"&growStep="+growStep,
				        type: 'POST',
				        dataType:'json',
				        cache:false,
				        async:false,
				        contentType:"application/json",
			            success: function (seedObj) {
			            	//console.info(seedObj);
			            	output=seedObj.output;
			            	caption=seedObj.caption;
			            	seedExp=seedObj.exp;
			            	salePrice=seedObj.price4UnitSale;
			            	seedScore=seedObj.score;
			            	seedWidth=seedObj.width;
			            	seedHeight=seedObj.height;
			            	seedOffsetX=seedObj.offsetX;
			            	seedOffsetY=seedObj.offsetY;
			            	growTime=seedObj.growTime;
			            	matureTime=seedObj.matureTime;
			            	insect=seedObj.insect;
			            	imgObj.attr("src",getImgUrl(seedObj.status,seedObj.cId,seedObj.growStep));
							imgObj.css("position","absolute");
							imgObj.css("left",0.5*seedObj.offsetX+"px");
							imgObj.css("top",(0.5*seedObj.offsetY-90)+"px");
							imgObj.css("width",0.5*seedObj.width);
							imgObj.css("height",0.5*seedObj.height);
							if(growChange||startEnter==0) {
								//console.info("growChange:"+growChange+" startEnter:"+startEnter);
								landObj.append(imgObj);//作物状态改变或者首次进入页面才刷新作物新状态
							}
			            }
			        });
					startTime=mylandsObj2[j].startTime;
					
					var pestObj=$('<img id="pest"/>');
					if(haspest!=0){
						if(pest[j].status==0) {
							worm.play();
							pest[j].status=1;
						}
						var rd=Math.ceil(Math.random()*9);
						if(pest[j].id==j%9) pest[j].id=rd;
						<%-- //var rdUrl='<%=basePath%>images/pest'+pest[j].id+'.png'; --%>
						var rdUrl='<%=basePath%>images/pest1.png';
						//alert(rdUrl);
						pestObj.attr("src",rdUrl);
						pestObj.css("position","absolute");
						//var leftTemp=Math.ceil(Math.random()*50+5);
						//pestObj.css("left",leftTemp+"px");
						pestObj.css("left",30);
						//var topTemp=Math.pow(-1,Math.ceil(Math.random()*10))*Math.sqrt(Math.abs(300-(leftTemp-30)*(leftTemp-30)));
						//pestObj.css("top",(topTemp+25)+"px");
						pestObj.css("top",20);
						pestObj.css("width",30);
						landObj.append(pestObj);
					}
					/* else{
						haspest=(Math.random()*100>insect)?0:1;
					} */
					//pest[j].status=(Math.random()*100>insect)?1:0;
				}
				
				landObj.attr({
					"numid":mylandsObj2[j].id,
					"cId":cId,
					"caption":caption,
					"growStep":growStep,
					"haspest":haspest,
					"time":time,//每季结束时间
					"startTime":startTime,//作物种植时间
					"residueNum":residueNum,
					"status":status,
					"output":output,
					"seedExp":seedExp,
					"salePrice":salePrice,
					"seedScore":seedScore,
					"seedWidth":seedWidth,
					"seedHeight":seedHeight,
					"seedOffsetX":seedOffsetX,
					"seedOffsetY":seedOffsetY,
					"growTime":growTime,
					"matureTime":matureTime,
					"insect":insect
				});
				getAction(landObj);
			}
		mylandsObj = JSON.parse(JSON.stringify(mylandsObj2));
		var rdlandNum=Math.floor(Math.random()*(mylandsObj2.length));
		var landObj=$('#land'+mylandsObj[rdlandNum].id);
		var growStep=mylandsObj2[rdlandNum].growStep;
		if(growStep==5)
		{
			var insect=landObj.attr("insect");
			landObj.attr("haspest",Math.random()*100>insect?0:1);
			updateMyland(landObj,-1);
		}	
    	startEnter++;
	}
	function getAction(Obj){
		var caption=Obj.attr("caption");
		var growStep=Obj.attr("growStep");
		var cId=Obj.attr("cId");
		var status=Obj.attr("status");
		var haspest=Obj.attr("haspest");
		var output=Obj.attr("output");
		var endTime=Obj.attr("time");
		var startTime=Obj.attr("startTime");
		var growTime=Obj.attr("growTime");
		var residueNum=Obj.attr("residueNum");
		var typeCode=Obj.attr("typeCode");
		var color="rgba(102,102,102,0.7)";
		if(typeCode==0) color="rgba(122,85,42,0.7)";
		if(typeCode==3) color="rgba(43,32,15,0.7)";
		if(typeCode==2) color="rgba(160,57,17,0.7)";
		if(typeCode==5) color="rgba(248,215,42,0.7)";
		if(cId==0||cId==null){
			Obj.css("cursor","url(<%=basePath%>images/sowing.cur),default");
		}else{
			if(growStep==finalGrowStep){
				Obj.css("cursor","url(<%=basePath%>images/eradicate.cur),default");
			}
			else{
				if(haspest==0)
				{
					if(status==1){
						Obj.css("cursor","url(<%=basePath%>images/gains.cur),default");
					}else{
						Obj.css("cursor","url(<%=basePath%>images/waiting.cur),default");
						var time=(startTime==null||startTime==""?
								new Date().format("yyyy-MM-dd hh:mm:ss")
								:new Date((new Date(startTime)).getTime()+growTime*1000).format("yyyy-MM-dd hh:mm:ss"));
						//Obj.attr("startTime",time);
						toolTip(Obj,caption,growStep,output,time,color);
					}
				}else{
					Obj.css("cursor","url(<%=basePath%>images/pesticide.cur),default");
				}
			}
		}
		
	}
	function toolTip(obj,caption,growStep,output,time,color){
		var tip='<div><span>名称</span>:<span>'+caption+'</span><br/>'
			+'<span>状态</span>:<span>'+growStep+'</span><br/>'
			+'<span>产量</span>:<span>'+output+'个果实</span><br/>'
			+'<span>时间</span>:<span>'+time+'</span><br/>'
		+'</div>';
		obj.tooltip({
		    position: 'bottom',
		    content: tip,
		    onShow: function(){
				$(this).tooltip('tip').css({
					backgroundColor: color,
					borderColor: color,
					color:'#fff'
				});
		    },
		    deltaX:0,
		    deltaY:-25,
		    showDelay:10,
		    hideDelay: 10
		});
	}
	var finalGrowStep=6;
	function winOpen(Obj,j){
		var growStep=Obj.attr("growStep");
		var cId=Obj.attr("cId");
		var status=Obj.attr("status");
		var haspest=Obj.attr("haspest");
		var output=Obj.attr("output");
		var time=Obj.attr("time");
		var residueNum=Obj.attr("residueNum");
		var landId=Obj.attr("numid");
		if(cId==0){
			plant.play();
			$('#win').window({    
	    	    title: '种子收纳袋', 
	    	    closed: false,    
	    	    cache: false,
	    	    height:200,
	    	    width:'65%',
	    	    href: '<%=basePath%>tools2.jsp?landId='+landId,    
	    	    modal: true,
	    	    buttons:[{text:'取消',iconCls:'icon-cancel',handler:function(){$('#win').dialog('close')}}]
	    	});
		}else{//默认枯草阶段为6
			if(growStep==finalGrowStep){
				//铲除枯草
				var msg="<span>除枯叶收获</span><br/>"
					+"<span>经验：+5</span><br/>"
					+"<span>积分：+5</span><br/>";
				if(residueNum-1<0) 
				{
					Obj.attr({
						"cId":0,
						"growStep":0,
						"haspest":0,
						"startTime":"",
						"residueNum":0,
						"status":0
					});
				}
				else{
					residueNum=Number(residueNum)-1;
					Obj.attr({
						"growStep":0,
						"haspest":0,
						"residueNum":residueNum,
						"status":0
					});
					Obj.attr("startTime",new Date().format("yyyy-MM-dd hh:mm:ss"));
					//提前进入下一状态而不经过后台响应
					<%-- var imgObj=$('<img id="crop" />');
					$.ajax({
				        url: "<%=basePath%>land/getSeeds?cId="+Obj.attr("cId")+"&growStep="+Obj.attr("growStep"),
				        type: 'POST',
				        dataType:'json',
				        cache:false,
				        async:false,
				        contentType:"application/json",
			            success: function (seedObj) {
			            	imgObj.attr("src",getImgUrl(seedObj.status,seedObj.cId,seedObj.growStep));
							imgObj.css("position","absolute");
							imgObj.css("left",0.5*seedObj.offsetX+"px");
							imgObj.css("top",(0.5*seedObj.offsetY-70)+"px");
							imgObj.css("width",0.5*seedObj.width);
							imgObj.css("height",0.5*seedObj.height);
							Obj.append(imgObj);
							$.messager.show({
				                title: "消息",
				                msg: msg,
				                timeout:2000
				           });
			            }
			        }); --%>
				}
				updateMyland(Obj,3);
				updateUser(5,5,0);
			}
			else{
				if(haspest==0)
				{
					if(status==1){
						//收获果实
						var addMoney=Obj.attr("salePrice")*Obj.attr("output");					
						var msg="<span>"+Obj.attr("caption")+"已经收获</span><br/>"
							+"<span>经验：+"+Obj.attr("seedExp")+"</span><br/>"
							+"<span>金币：+"+Obj.attr("salePrice")+"金币x"+Obj.attr("output")+"个果实="+addMoney+"</span><br/>"
							+"<span>积分：+"+Obj.attr("seedScore")+"</span><br/>";
					
						Obj.attr({
							"growStep":finalGrowStep,
							"haspest":0,
							"startTime":new Date().format("yyyy-MM-dd hh:mm:ss")
						});
						//提前进入下一状态而不经过后台响应
						<%-- Obj.find("#crop").remove();
						var imgObj=$('<img id="crop" />');
						$.ajax({
					        url: "<%=basePath%>land/getSeeds?cId="+Obj.attr("cId")+"&growStep="+Obj.attr("growStep"),
					        type: 'POST',
					        dataType:'json',
					        cache:false,
					        async:false,
					        contentType:"application/json",
				            success: function (seedObj) {
				            	imgObj.attr("src",getImgUrl(seedObj.status,seedObj.cId,seedObj.growStep));
								imgObj.css("position","absolute");
								imgObj.css("left",0.5*seedObj.offsetX+"px");
								imgObj.css("top",(0.5*seedObj.offsetY-70)+"px");
								imgObj.css("width",0.5*seedObj.width);
								imgObj.css("height",0.5*seedObj.height);
								Obj.append(imgObj);
								$.messager.show({
					                title: "消息",
					                msg: msg,
					                timeout:2000
					           });
				            }
				        }); --%>
						updateMyland(Obj,2);
						updateUser(Obj.attr("seedExp"),Obj.attr("seedScore"),addMoney);
					}else{
						//等待果实成熟
					}
				}else{
					//清除害虫
					pest[j].status=0;
					//出现害虫，随机减少果实一到两个
					var output=Obj.attr("output");
					var minusOutput=Math.floor(Math.random()*2+1);
					output=output-minusOutput;
					if(output<=0) Obj.attr("output",0);//被虫子吃光了
					else Obj.attr("output",output);
					var msg="<span>除害虫收获</span><br/>"
						+"<span>经验：+2</span><br/>"
						+"<span>金币：+1</span><br/>"
						+"<span>积分：+2</span><br/>"
						+"<span>减产：-"+minusOutput+"个果实</span><br/>";
					$.messager.show({
		                title: "消息",
		                msg: msg,
		                timeout:2000
		           });
					Obj.attr("haspest",0);
					updateMyland(Obj,1);
					updateUser(2,2,1);
				}
			}
		}	
    }
	function sowCId(seedObj,landObj){
		console.info("种子类型："+seedObj.landTypeCode+" 土地类型："+landObj.attr("typeCode"));
		if(seedObj.landTypeCode==landObj.attr("typeCode"))
		{
			/*//更新下一状态信息 
			var imgObj=$('<img id="crop" />');
			imgObj.attr("src",getImgUrl(seedObj.status,seedObj.cId,seedObj.status));
			imgObj.css("position","absolute");
			imgObj.css("left",0.5*seedObj.offsetX+"px");
			imgObj.css("top",(0.5*seedObj.offsetY-70)+"px");
			imgObj.css("width",0.5*seedObj.width);
			imgObj.css("height",0.5*seedObj.height);
			landObj.append(imgObj); */
			//更新前台landObj属性
			landObj.attr("cId",seedObj.cId);
			landObj.attr("growStep",seedObj.status);
			landObj.attr("haspest",0);
			landObj.attr("startTime",new Date().format("yyyy-MM-dd hh:mm:ss"));
			landObj.attr("residueNum",seedObj.harvestNum);
			landObj.attr("status",0);
			landObj.css("cursor","url(<%=basePath%>images/waiting.cur),default");
			//更新后台land属性
			updateMyland(landObj,0);
			//更新收纳袋
			updateBag(seedObj.cId,-1);//种子减1
			$('#win').dialog('close');
			$.messager.show({
	            title: "消息",
	            msg: "成功播种"+seedObj.seedTypeCaption+seedObj.caption+"！",
	            height:"80px",
	            timeout:2000
	       });
			
		}else{
			negtive.play();
			$.messager.show({
	            title: "消息",
	            msg: "土地类型不匹配！",
	            height:"80px",
	            timeout:2000
	       });
		}
		
	}
	function updateMyland(landObj,n)
	{
		var Myland={
				id:landObj.attr("numid"),
				username:username,
				landType:landObj.attr("typeCode"),
				cId:landObj.attr("cId"),
				growStep:landObj.attr("growStep"),
				haspest:landObj.attr("haspest"),
				startTime:landObj.attr("startTime"),
				residueNum:landObj.attr("residueNum"),
				status:landObj.attr("status")
		};
		//console.info(Myland);
		$.ajax({
	        url: "<%=basePath%>land/save",
	        type: 'POST',
	        dataType:'json',
	        data: JSON.stringify(Myland),
	        contentType:"application/json",
            success: function (result) {
            	if(n==0) {
            		hasPlanted.play();
        			landObj.find("#crop").remove();
            	}
            	if(n==1) {
            		killWorm.play();
            		landObj.find("#pest").remove();
            	}
            	if(n==2) {
            		harvest.play();
            		landObj.find("img").remove();
            	}
            	if(n==3) {
            		cleanLand.play();
            		landObj.find("#crop").remove();
            	}
            },
            error:function(data,type, err){ 
            	negtive.play();
            }
        });
	}
	function updateUser(addExp,addScore,addMoney){
		$.ajax({
	        url: "<%=basePath%>user/updateESM?addExp="+addExp+"&addScore="+addScore+"&addMoney="+addMoney,
	        type: 'POST',
	        dataType:'json',
	        cache:false,
	        async:false,
	        contentType:"application/json",
            success: function (result) {
            	console.info(result);
            	parent.window.frames[0].window.location.reload();
            },
            error:function(data,type, err){ 
            	negtive.play();
            }
        });
	}
	function updateBag(cId,addNum){
		$.ajax({
	        url: "<%=basePath%>shop/updateBag?cId="+cId+"&addNum="+addNum,
	        type: 'POST',
	        dataType:'json',
	        cache:false,
	        async:false,
	        contentType:"application/json",
            success: function (result) {
            	console.info("更新背包成功");
            	parent.window.frames[2].window.location.reload();
            }
        });
	}
	$('#win').dialog({  
        onClose:function(){  
        }  
    });
</script>
</body>
</html>