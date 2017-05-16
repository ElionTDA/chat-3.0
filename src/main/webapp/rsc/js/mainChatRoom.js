

function refresh(){
	setInterval(refreshMessage, 500);
}

var http_request = false;
function refreshMessage(){
    http_request = false;
    url = "refreshMessage.jsp";
    if (window.XMLHttpRequest) { // Mozilla, Safari,...
        http_request = new XMLHttpRequest();
        if (http_request.overrideMimeType) {
            http_request.overrideMimeType('text/xml');
            // Ver nota sobre esta linea al final
        }
    } else if (window.ActiveXObject) { // IE
        try {
            http_request = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try {
                http_request = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {}
        }
    }

    if (!http_request) {
        alert('Falla :( No es posible crear una instancia XMLHTTP');
        return false;
    }
    http_request.onreadystatechange = alertMessages;	
    http_request.open('GET', url, true);
    http_request.send(null);
}

function alertMessages() {
    if (http_request.readyState == 4) {
        if (http_request.status == 200) {
            var str = http_request.responseText
        	document.getElementById("textarea").innerHTML = str;
        } else {
            alert('Hubo problemas al refrescar mensajes, podrás refrescarlos a mano, mandando un mensaje.');
        }
    }
}



function validateMessageForm(){
    var message = document.forms["message-form"]["message"].value;
    if (message == "") {
        alert("El mensaje no puede estar vacio.");
        return false;
    }
}

//function prueba(){
//	var objDiv = document.getElementById("your_div");
//	objDiv.scrollTop = objDiv.scrollHeight;
//}