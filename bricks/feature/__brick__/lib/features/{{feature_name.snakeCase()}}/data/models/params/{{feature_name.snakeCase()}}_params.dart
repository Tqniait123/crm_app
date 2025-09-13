{{#has_params}}
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part '{{feature_name.snakeCase()}}_params.g.dart';

/// Parameters for {{feature_name.pascalCase()}} API requests
/// 
/// This class encapsulates all the parameters needed for
/// {{feature_name.snakeCase()}} related API operations.
@JsonSerializable()
class {{feature_name.pascalCase()}}Params extends Equatable {
  /// Title or name of the {{feature_name.snakeCase()}}
  final String title;
  
  /// Description of the {{feature_name.snakeCase()}}
  final String? description;
  
  /// Status of the {{feature_name.snakeCase()}}
  final String? status;
  
  /// Whether the {{feature_name.snakeCase()}} is active
  @JsonKey(name: 'is_active')
  final bool? isActive;
  
  /// Additional metadata
  final Map<String, dynamic>? metadata;

  /// Constructor for {{feature_name.pascalCase()}}Params
  const {{feature_name.pascalCase()}}Params({
    required this.title,
    this.description,
    this.status,
    this.isActive,
    this.metadata,
  });

  /// Creates {{feature_name.pascalCase()}}Params from JSON
  factory {{feature_name.pascalCase()}}Params.fromJson(Map<String, dynamic> json) =>
      _${{feature_name.pascalCase()}}ParamsFromJson(json);

  /// Converts {{feature_name.pascalCase()}}Params to JSON
  Map<String, dynamic> toJson() => _${{feature_name.pascalCase()}}ParamsToJson(this);

  /// Creates a copy with optionally updated fields
  {{feature_name.pascalCase()}}Params copyWith({
    String? title,
    String? description,
    String? status,
    bool? isActive,
    Map<String, dynamic>? metadata,
  }) {
    return {{feature_name.pascalCase()}}Params(
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      isActive: isActive ?? this.isActive,
      metadata: metadata ?? this.metadata,
    );
  }

  @override
  List<Object?> get props => [
        title,
        description,
        status,
        isActive,
        metadata,
      ];

  @override
  String toString() {
    return '{{feature_name.pascalCase()}}Params(title: $title, description: $description, '
        'status: $status, isActive: $isActive, metadata: $metadata)';
  }

  /// Check if params are valid
  bool get isValid => title.trim().isNotEmpty;

  /// Get validation errors
  List<String> get validationErrors {
    final errors = <String>[];
    
    if (title.trim().isEmpty) {
      errors.add('Title is required');
    }
    
    if (title.trim().length < 2) {
      errors.add('Title must be at least 2 characters long');
    }
    
    if (title.trim().length > 100) {
      errors.add('Title must be less than 100 characters');
    }
    
    if (description != null && description!.length > 500) {
      errors.add('Description must be less than 500 characters');
    }
    
    return errors;
  }

  /// Create params for creation
  static {{feature_name.pascalCase()}}Params forCreation({
    required String title,
    String? description,
    String status = 'active',
    bool isActive = true,
    Map<String, dynamic>? metadata,
  }) {
    return {{feature_name.pascalCase()}}Params(
      title: title,
      description: description,
      status: status,
      isActive: isActive,
      metadata: metadata,
    );
  }

  /// Create params for update
  static {{feature_name.pascalCase()}}Params forUpdate({
    required String title,
    String? description,
    String? status,
    bool? isActive,
    Map<String, dynamic>? metadata,
  }) {
    return {{feature_name.pascalCase()}}Params(
      title: title,
      description: description,
      status: status,
      isActive: isActive,
      metadata: metadata,
    );
  }
}
{{/has_params}}
