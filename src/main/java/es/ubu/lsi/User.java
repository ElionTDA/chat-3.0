package es.ubu.lsi;

import java.util.ArrayList;
import java.util.List;

public class User {
	private String nick;
	private List<Message> messageList;
	
	public User(){
		nick = null;
		messageList = new ArrayList<Message>();
	}

	public String getNick(){
		return nick;
	}
	
	public void setNick(String nick){
		this.nick = nick;
	}
	
	public boolean recibeMessage(Message message){
		return messageList.add(message);
	}
	
	public List<Message> getMessageList(){
		return messageList;
	}
}
