
function getXMLHttpRequest() {   

    if (window.XMLHttpRequest) {
        return new XMLHttpRequest();
        
    } else if (window.ActiveXObject) {
		try {
			
			return new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e1) {
			try {
				
				return new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e2) {
				
			}
		}
	}
}

var httpRequest = null;

function sendRequest(url,params,callback,method){
	
	httpRequest = getXMLHttpRequest();
	
	//method처리
	//method가 있으면 그 method를 쓰고, 없으면 GET방식을 쓴다.
	var httpMethod = method ? method : "GET";
	
	//GET도 POST도 아니면 기본값으로 GET을 넣는다.
	if(httpMethod!="GET" && httpMethod!="POST"){
		httpMethod = "GET";
	}
	
	//param처리
	//params가 널이면 널, 있으면 그 params로 처리한다.
	var httpParams = (params==null || params=="") ? null : params;
	
	//url처리
	var httpUrl = url;
	
	if(httpMethod=="GET"&&httpParams!=null){
		httpUrl = httpUrl + "?" + httpParams;
	}
	
	httpRequest.open(httpMethod,httpUrl,true);
	//아래는 POST방식일 때 적어주어야 하는 코드
	httpRequest.setRequestHeader(
			"Content-Type","application/x-www-form-urlencoded");
	httpRequest.onreadystatechange = callback;
	//POST일때는 params를 보내주어야 하고 POST가 아니라면 GET이라는 거니까
	//GET은 주소에 이미 params를 보내줬기 때문에 null을 쓴다.
	httpRequest.send(httpMethod=="POST"?httpParams:null);
	
}














