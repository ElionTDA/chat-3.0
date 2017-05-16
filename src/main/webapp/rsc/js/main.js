
function quitarValue(){
	document.getElementById('login-text-nick').value = "";
	document.getElementById('login-usuario-text').innerHTML = "Usuario";
}

function ponerValue(){
	if(document.getElementById('login-text-nick').value.length == 0){
		document.getElementById('login-text-nick').value = "Usuario";
		document.getElementById('login-usuario-text').innerHTML = "";		
	}
}

function validateForm(){
    var nick = document.forms["login"]["nickname"].value;
    if (nick == "") {
        alert("No se ha introducido nick");
        return false;
    }
    if(nick.length < 4){
    	alert("El nick tiene que tener minimo 4 caracteres.");
    	return false;
    }
}