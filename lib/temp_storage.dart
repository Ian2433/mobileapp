// temp_storage.dart
class UserData {
  static String? username;
  static String? password;

  static void storeUser(String user, String pass) {
    username = user;
    password = pass;
  }

  static bool validateUser(String user, String pass) {
    return username == user && password == pass;
  }
}
