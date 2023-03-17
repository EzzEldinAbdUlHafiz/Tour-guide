// ignore_for_file: file_names

class User {
  final String name;
  final String email;
  final String password;

  const User({required this.name, required this.email, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }
}
