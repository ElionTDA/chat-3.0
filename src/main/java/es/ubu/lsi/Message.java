package es.ubu.lsi;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Message {

	private Date date;
	private String message;
	private User user;
	
	public Message(User user, String mensaje){
		date = new Date();
		this.user = user;
		this.message = mensaje;
	}
	
	public String createMessage() {
		// TODO poner segundos a la fecha
		String dateStr = new SimpleDateFormat().format(date);		
		return dateStr + ": " + user.getNick() + "> " + message; 
	}
	
	public User gerUser(){
		return user;
	}
	
	public Date getDateMessage(){
		return date;
	}
	
	public String getMessage() {
		return message;
	}
	
}
