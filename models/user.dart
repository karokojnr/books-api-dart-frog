class User {
  User({
    required this.name,
    required this.email,
    required this.password,
    required this.age,
    this.id,
  });
  User.fromMap(Map<String, dynamic> map)
      : id = map['id'] as String? ?? '',
        name = map['name'] as String? ?? '',
        email = map['email'] as String,
        password = map['password'] as String,
        age = map['age'] as int? ?? 0;

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    int? age,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? '',
        email: email ?? '',
        password: password ?? '',
        age: age ?? 0,
      );

  String? id;
  String name;
  String email;
  String password;
  int age;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'name': name,
        'email': email,
        'password': password,
        'age': age,
      };
}
