package es.ubu.lsi;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Server {
	private List<User> users;
	private HashMap<User, List<User>> bans;	
	
	public Server(){
		bans = new HashMap<User, List<User>>();
		users = new ArrayList<User>();	
	}
	
	public void addUser(User user){
		users.add(user);
	}
	
	public void removeUser(User user){
		users.remove(user);
	}
	
	public boolean existNick(String nick){
		// TODO pasar a lowercase para hacer la comparacion Juan y juAN son iguales.
		for (User u: users){
			if(nick.equals(u.getNick())){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * Un usuario banea a otro. 
	 * 
	 * @param user Usuario que banea.
	 * @param banned Usuario baneado.
	 * @return True o false en función de si lo banea o no. (No lo podrá banear si ya lo tiene baneado).
	 */
	public boolean banUser(User user, User banned){
		boolean flag = false;
		if(!bans.containsKey(user)){	
			bans.put(user, new ArrayList<User>());
		}
		if(!bans.get(user).contains(banned)){
			bans.get(user).add(banned);
			flag = true;
		}
		
		return flag;
	}
	
	/**
	 * Un usuario desbanea a otro.
	 * 
	 * @param user Usuario que desbanea
	 * @param unbanned Usuario desbaneado 
	 * @return True o false en función de si se desbloquea a un usuario o no. 
	 */
	public boolean unbanUser(User user, User unbanned){
		boolean flag = false;
		if(bans.containsKey(user)){		
			if(bans.get(user).contains(unbanned)){
				bans.get(user).remove(unbanned);
				flag = true;
			}
		}
		return flag;
	}
	
	public String toStringConnectedUsers(){
		String result = "";
		for (User u: users){
			result += ", " + u.getNick();
		}
		return result;
	}
	
	/**
	 * Si el usuario que manda el mensaje no tiene baneado a otro usuario, y el otro usuario no le tiene baneado a ék
	 * @param message
	 */
	public void sendMensaje(Message message){
		User sender = message.gerUser();
		
		boolean banned;
		for (User u: users){
			banned = false;
			
			if(bans.containsKey(sender)){
				if(bans.get(sender).contains(u)){
					banned = true;
				}
			}
			if(bans.containsKey(u)){
				if(bans.get(u).contains(sender)){
					banned = true;
				}
			}
			
			if(!banned){
				u.recibeMessage(message);
			}
		}
	}
	

	
}
