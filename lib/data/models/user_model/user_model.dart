class UserModel {
  String name;
  String email;
  String password;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    String name = json['name'];
    String password = json['password'];
    String email = json['email'];
    return UserModel(
      name: name,
      email: email,
      password: password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
