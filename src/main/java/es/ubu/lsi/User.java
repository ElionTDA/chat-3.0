package es.ubu.lsi;

public class User {
	private String nick;

	public User(){
		nick = null;
	}

	public String getNick(){
		return nick;
	}
	public void setNick(String nick){
		this.nick = nick;
	}
}
