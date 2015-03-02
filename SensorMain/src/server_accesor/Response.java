package server_accesor;

public class Response {
	private int statusnum;
	private String message;
	public Response(String message) {
		String[] tmp = message.split(":",2);
		this.statusnum = Integer.parseInt(tmp[0]);
		this.message = tmp[1];
	}
	public int getStatusNum() {
		return statusnum;
	}
	public String getMessage() {
		return message;
	}

}
