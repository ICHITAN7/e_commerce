class UserModel {
  String userId;
  String email;
  String? username;
  Map<String, dynamic>? loved;
  Map<String, dynamic>? shop;

  UserModel({
    required this.userId,
    required this.email,
    this.username,
    this.loved,
    this.shop,
  });

  factory UserModel.fromMap(String userId, Map<String, dynamic> map) {
    return UserModel(
      userId: userId,
      email: map['email'],
      username: map['username'],
      loved: map['loved'],
      shop: map['shop'],
    );
  }
}