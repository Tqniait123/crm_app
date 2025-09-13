class User {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? photo;
  final bool? verified;

  const User({required this.id, required this.name, required this.email, this.phone, this.photo, this.verified});

  // CopyWith method for easy updates
  User copyWith({int? id, String? name, String? email, String? phone, String? photo}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      photo: photo ?? this.photo,
      verified: verified,
    );
  }

  // Factory constructor for JSON deserialization
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'],
      photo: json['photo'],
      verified: json['verified'],
    );
  }

  // JSON serialization
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'phone': phone, 'photo': photo, 'verified': verified};
  }
}
