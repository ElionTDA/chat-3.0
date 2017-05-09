package es.ubu.lsi;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Mensaje {

	SimpleDateFormat sdf;
	String mensaje;
	
	public Mensaje(String mensaje){
		this.mensaje = mensaje;
	}
	
	public void setMensaje(String nickName, String mensaje) {
		sdf = new SimpleDateFormat();
		String date = sdf.format(new Date());
		mensaje = date + ": " + nickName + "> " + mensaje; 
	}
	
	public String getMensaje() {
		return mensaje;
	}
	
}
