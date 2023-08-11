import 'dart:convert';

class UserModel {
  String email;

  UserModel({
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
    };
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return UserModel(
      email: email ?? this.email,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel( email: $email,)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.email == email ;
  }

  @override
  int get hashCode => email.hashCode ;
}
