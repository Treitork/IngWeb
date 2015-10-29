package Model;

public class User {
		private String login;
		private int id;
		private String role;

		public User(String login, int id, String role) {
			this.login = login;
			this.id = id;
			this.role = role;
		}

		public String getLogin() {
			return login;
		}

		public int getId() {
			return id;
		}

		public String getRole() {
			return role;
		
	}
}
