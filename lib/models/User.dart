class User {
  final int id;
  final String l_name;
  final String f_name;
  final String address;
  final String email;

  User(
      {required this.id,
      required this.f_name,
      required this.l_name,
      required this.email,
      required this.address});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["id"],
        l_name: json["l_name"],
        f_name: json["f_name"],
        address: json["address"],
        email: json["email"]);
  }
}
