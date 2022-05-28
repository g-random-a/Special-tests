class User {
  final String id;
  final String username;
  final String email;
  final String avatar;
  final String password;
  final String role;

  User(
      {required this.id,
      required this.username,
      required this.email,
      required this.password,
      required this.role})
      : this.avatar = "https://avatars.dicebear.com/api/gridy/${username}.svg";

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['_id'],
        username: json['username'],
        email: json['email'],
        role: json['role'][0]['name'], 
        password: json['password']);
  }
}
