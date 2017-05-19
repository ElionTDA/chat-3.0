package es.ubu.lsi;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Clase Server 
 * 
 * @author Diego Martín Pérez
 * @author Daniel Arnaiz Gutiérrez
 *
 */
public class Server {
	
	/**Lista de usuarios. */
	private List<User> users;
	/** Mapa de clientes y baneos. */
	private HashMap<String, List<String>> bans;	
	
	/**
	 * Constructor del servidor. Se inicializan las variables bans y users.
	 */
	public Server(){
		bans = new HashMap<String, List<String>>();
		users = new ArrayList<User>();	
	}
	
	/**
	 * Método que añade un nuevo usuario a la lista.
	 * @param user
	 * 			Usuario a añadir.
	 */
	public void addUser(User user){
		users.add(user);
	}
	
	/**
	 * Método que quita un usuario de la lista.
	 * @param user
	 * 			usuario a quitar.
	 */		
	public void removeUser(User user){
		users.remove(user);
	}
	
	/**
	 * Método que devuelve un usuario según su nick.
	 * 
	 * @param nick
	 * 			Nombre del usuario a buscar
	 * @return usuario o null
	 * 			User con el nick pasado como argumento.
	 */
	public User getUser(String nick){
		for (User u: users){
			if(u.getNick().equals(nick)){
				return u;
			}
		}
		return null;
	}
	
	/**
	 * Método que devuelve la lista de usuarios conectados en ese momento.
	 * 
	 * @return users
	 * 			Lista de usuarios conectados.
	 */
	public List<User> getUsersConnected(){
		return users;
	}
	
	/**
	 * Método que devuelve un String con los usuarios conectados en ese momento.
	 * 
	 * @return res
	 * 			String con los nombres de los usuarios coenctados.
	 */
	public String refreshUserConnected(){
		String res = "";
		for (User u: users){
			res += u.getNick() + "<br>";
		}
		return res;
	}
	
	/**
	 * Método que comprueba si un nick existe entre los usuarios conectados en ese momento.
	 * 
	 * @param nick
	 * 			Nick a buscar.
	 * @return booleano
	 * 			Existe o no existe.
	 */
	public boolean existNick(String nick){
		// Antes de comprobar pasamos todo a minúsculas.
		for (User u: users){
			if(nick.toLowerCase().equals(u.getNick().toLowerCase())){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * Método que permite que un usuario banee a otro. 
	 * 
	 * @param user
	 * 			Usuario que banea.
	 * @param banned
	 * 			Usuario baneado.
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
	 * Método que permite eu un usuario desbanee a otro.
	 * 
	 * @param user
	 * 			Usuario que desbanea.
	 * @param unbanned
	 * 			Usuario desbaneado.
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
	
	/**
	 * Método que devuelve un String con los nicks de todos los usuarios separados por comas.
	 * 
	 * @return result
	 * 			Strind con los nombres de los usuario conectados.
	 */
	public String toStringConnectedUsers(){
		String result = "";
		for (User u: users){
			result += ", " + u.getNick();
		}
		return result;
	}
	
	/**
	 * Método que envía un mensaje si el usuario que manda el mensaje no tiene baneado a otro usuario,
	 * y el otro usuario no le tiene baneado a él.
	 * 
	 * @param message
	 * 			Mensaje a enviar.
	 */
	public void sendMensaje(Message message){
		String sender = message.getUser().getNick();
		
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
