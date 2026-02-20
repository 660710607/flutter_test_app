// Model Class
class User {
  final int id;
  final String firstName;
  final String username;
  final String email;
  // Constructor
  User(this.id, this.firstName, this.username, this.email);

  // แปลง JSON เป็น Object
  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        firstName = json['firstName'],
        username = json['username'],
        email = json['email'];

  // แปลง Object เป็น JSON Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'username': username,
      'email': email
    };
  }
}