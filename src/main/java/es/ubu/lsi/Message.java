package es.ubu.lsi;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Message {

	private SimpleDateFormat dateMessage;
	private String message;
	private User user;
	
	public Message(User user, String mensaje){
		dateMessage = new SimpleDateFormat();
		this.user = user;
		this.message = mensaje;
	}
	
	public String createMessage() {
		// TODO poner segundos a la fecha
		String date = dateMessage.format(new Date());
		return date + ": " + user.getNick() + "> " + message; 
	}
	
	public User gerUser(){
		return user;
	}
	
	public SimpleDateFormat getDateMessage(){
		return dateMessage;
	}
	
	public String getMessage() {
		return message;
	}
	
}
