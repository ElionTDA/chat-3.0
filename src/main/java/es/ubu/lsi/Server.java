package es.ubu.lsi;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Server {
	private List<User> users;
	private HashMap<String, List<String>> bans;	
	
	public Server(){
		bans = new HashMap<String, List<String>>();
		users = new ArrayList<User>();	
	}
	
	public void addUser(User user){
		users.add(user);
	}
	
	public void removeUser(User user){
		users.remove(user);
	}
	
	public User getUser(String nick){
		for (User u: users){
			if(u.getNick().equals(nick)){
				return u;
			}
		}
		return null;
	}
	
	public List<User> getUsersConnected(){
		return users;
	}
	
	public String refreshUserConnected(){
		String res = "";
		for (User u: users){
			res += u.getNick() + "<br>";
		}
		return res;
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
	public boolean banUser(User user, String banned){

		boolean flag = false;
		if(!bans.containsKey(user.getNick())){	
			bans.put(user.getNick(), new ArrayList<String>());
		}
		if(!bans.get(user.getNick()).contains(banned)){
			bans.get(user.getNick()).add(banned);
			flag = true;
		}
		user.recibeMessage(new Message(user, "El usuario " + banned + " ha sido baneado."));
		return flag;
	}
	
	/**
	 * Un usuario desbanea a otro.
	 * 
	 * @param user Usuario que desbanea
	 * @param unbanned Usuario desbaneado 
	 * @return True o false en función de si se desbloquea a un usuario o no. 
	 */
	public boolean unbanUser(User user, String unbanned){
		boolean flag = false;
		if(bans.containsKey(user.getNick())){		
			if(bans.get(user.getNick()).contains(unbanned)){
				bans.get(user.getNick()).remove(unbanned);
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
		String sender = message.gerUser().getNick();
		
		boolean banned;
		for (User u: users){
			banned = false;
			
			if(bans.containsKey(sender)){
				if(bans.get(sender).contains(u.getNick())){
					banned = true;
				}
			}
			if(bans.containsKey(u.getNick())){
				if(bans.get(u.getNick()).contains(sender)){
					banned = true;
				}
			}
			
			if(!banned){
				u.recibeMessage(message);
			}
		}
	}
	

	
}
