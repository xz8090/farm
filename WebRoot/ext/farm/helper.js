function getRemoteData(url,callBack){
	return request({},"post",url,callBack);
}


function fromCode2Caption(code, arrayList) {
	var items = $(arrayList);
	for(var index = 0;index<items.length;index++){     	
    	if(items[index].code==code){
			return items[index].caption;			
    	}
	}
	return "";
}

function request(object,method,methodURL,successFunction){	
	$.ajax({
        cache: true,
        type: method,
        datatype:"json",
        contentType: "application/json",
        url:methodURL,
        data:JSON.stringify(object),
        error: function(XMLHttpRequest, textStatus, errorThrown) {
        	 alert(XMLHttpRequest.status+"\r\n"+XMLHttpRequest.readyState+"\r\n"+textStatus);
        },
        success: successFunction
    });			
 } 