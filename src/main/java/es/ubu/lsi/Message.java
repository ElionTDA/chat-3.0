package es.ubu.lsi;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Message {

	private SimpleDateFormat dateMessage;
	private String message;
	private User user;
	
	public Message(User user, String mensaje){
		this.user = user;
		this.message = mensaje;
	}
	
	public String createMessage() {
		dateMessage = new SimpleDateFormat();
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
