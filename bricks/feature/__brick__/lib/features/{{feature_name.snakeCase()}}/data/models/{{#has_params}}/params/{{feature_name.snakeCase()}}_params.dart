{{#has_params}}
import 'package:equatable/equatable.dart';

class {{feature_name.pascalCase()}}Params extends Equatable {
  final String name;
  final String? description;

  const {{feature_name.pascalCase()}}Params({
    required this.name,
    this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      if (description != null) 'description': description,
    };
  }

  {{feature_name.pascalCase()}}Params copyWith({
    String? name,
    String? description,
  }) {
    return {{feature_name.pascalCase()}}Params(
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [name, description];
}
{{/has_params}}
