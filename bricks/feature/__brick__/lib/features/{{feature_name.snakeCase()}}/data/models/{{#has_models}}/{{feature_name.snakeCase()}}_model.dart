{{#has_models}}
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/entities/{{feature_name.snakeCase()}}_entity.dart';

class {{feature_name.pascalCase()}}Model extends {{feature_name.pascalCase()}}Entity {
  const {{feature_name.pascalCase()}}Model({
    required super.id,
    required super.name,
    super.description,
    super.createdAt,
    super.updatedAt,
  });

  factory {{feature_name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) {
    return {{feature_name.pascalCase()}}Model(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString(),
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  {{feature_name.pascalCase()}}Model copyWith({
    String? id,
    String? name,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return {{feature_name.pascalCase()}}Model(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
{{/has_models}}
