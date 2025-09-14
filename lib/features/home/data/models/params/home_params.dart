class HomeParams {
  final String? id;
  final String? name;
  final String? description;

  HomeParams({
    this.id,
    this.name,
    this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    };
  }

  factory HomeParams.fromJson(Map<String, dynamic> json) {
    return HomeParams(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }

  HomeParams copyWith({
    String? id,
    String? name,
    String? description,
  }) {
    return HomeParams(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}
