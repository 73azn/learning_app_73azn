class Users {
  static final Users _self = Users.self();
  Map<String, Map<String, String>> users = {
    "amer@amer.com": {"user": "amer", "name": "Ameir Nawab", "password": "123"},
  };
  Users.self();
  factory Users() {
    return _self;
  }

  bool userIn(String email) {
    return users.containsKey(email);
  }

  bool passwordCorrect(String email, String password) {
    return password == users[email]?["password"];
  }

  void addUser(String email, String password, String name, String user) {
    Map<String, String> map = {
      "name": name,
      "user": user,
      "password": password,
    };

    users[email] = map;
  }

  void operator [](String other) {}
}
