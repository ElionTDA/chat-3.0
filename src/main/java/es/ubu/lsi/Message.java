package es.ubu.lsi;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Clase Message 
 * 
 * @author Diego Martín Pérez
 * @author Daniel Arnaiz Gutiérrez
 *
 */
public class Message {

	/**Fecha y hora de la recepción del mensaje. */
	private Date date;
	/**Contenido del mensaje. */
	private String message;
	/**Usuario que envía el mensaje */
	private User user;
	
	/**
	 * Constructor del mensaje. Se inicializan las variables necesarias.
	 * 
	 * @param user
	 * 			Usuario remitente.
	 * @param mensaje
	 * 			Mensaje enviado por el usuario.
	 */
	public Message(User user, String mensaje){
		date = new Date();
		this.user = user;
		this.message = mensaje;
	}
	
	/**
	 * Da forma al mensaje junto con la hora y nombre del usuario.
	 * @return
	 * 		String con el mensaje, la hora y el usuario que lo envía.
	 */
	public String createMessage() {
		// TODO Si quieres que salga la fecha completa sería " dd/MM/yyyy HH:mm:ss"
		String dateStr = new SimpleDateFormat("HH:mm:ss").format(date);		
		return dateStr + ": " + user.getNick() + "> " + message; 
	}
	
	/**
	 * Obtiene el usuario.
	 * @return user
	 */
	public User getUser(){
		return user;
	}
	
	/**
	 * Obtiene la fecha y hora del mensaje.
	 * @return date
	 */
	public Date getDateMessage(){
		return date;
	}
	
	/**
	 * Obtiene el mensaje.
	 * @return message
	 */
	public String getMessage() {
		return message;
	}
	
}
