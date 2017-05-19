package es.ubu.lsi;

import java.util.ArrayList;
import java.util.List;

/**
 * Clase User 
 * 
 * @author Diego Martín Pérez
 * @author Daniel Arnaiz Gutiérrez
 *
 */
public class User {
	/**nick del usuario. */
	private String nick;
	/**Lista de mensajes. */
	private List<Message> messageList;
	
	/**
	 * Contructor de User. inicializa las variables nick y messageList.
	 */
	public User(){
		nick = null;
		messageList = new ArrayList<Message>();
	}

	/**
	 * Método que devuelve el nick del usuario.
	 * 
	 * @return nick
	 * 			Nick del usuario
	 */
	public String getNick(){
		return nick;
	}
	
	/**
	 * Método que propporciona un nick a un usuario.
	 * @param nick
	 * 			Nick a poner al usuario.
	 */
	public void setNick(String nick){
		this.nick = nick;
	}
	
	/**
	 * Método que añade un mensaje a la lista de mensajes recibidos.
	 * 
	 * @param message
	 * 			Mensaje a añadir
	 * @return messageList
	 * 			Lista de mensajes recibidos con el mesaje ya añadido.
	 */
	public boolean recibeMessage(Message message){
		return messageList.add(message);
	}
	
	/**
	 * Método que devuelve la lista de mensajes recibidos.
	 * 
	 * @return messageList
	 * 			Lista de mensajes recibidos.
	 */
	public List<Message> getMessageList(){
		return messageList;
	}
	
	/**
	 * Método que devuelve un String con los mensajes recibidos hasta ese momento.
	 * 
	 * @return res
	 * 			String con los mesajes recibidos.
	 */
	public String getRefreshMessages(){
		String res = "";
		for(Message m: messageList){
			res += m.createMessage() + "<br>";
		}
		return res;
	}
	
	/**
	 * Método que devuelve un String con los mensajes recibidos hasta ese momento.
	 * 
	 * @return result
	 * 			String con los mesajes recibidos.
	 */
	public String toStringMessages(){
		String result = "";
		for(Message m: messageList){
			result = result + m.createMessage() + " ";
		}
		return result;
	}
}
