{{#has_models}}
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part '{{feature_name.snakeCase()}}_model.g.dart';

/// {{feature_name.pascalCase()}} model representing the data structure
/// 
/// This model handles JSON serialization/deserialization and provides
/// a clean interface for working with {{feature_name.snakeCase()}} data.
@JsonSerializable()
class {{feature_name.pascalCase()}}Model extends Equatable {
  /// Unique identifier for the {{feature_name.snakeCase()}}
  final String id;
  
  /// Title or name of the {{feature_name.snakeCase()}}
  final String title;
  
  /// Description of the {{feature_name.snakeCase()}}
  final String? description;
  
  /// Creation timestamp
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  
  /// Last update timestamp
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  
  /// Status of the {{feature_name.snakeCase()}}
  final String? status;
  
  /// Whether the {{feature_name.snakeCase()}} is active
  @JsonKey(name: 'is_active')
  final bool isActive;

  /// Constructor for {{feature_name.pascalCase()}}Model
  const {{feature_name.pascalCase()}}Model({
    required this.id,
    required this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.isActive = true,
  });

  /// Creates a {{feature_name.pascalCase()}}Model from JSON
  factory {{feature_name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) =>
      _${{feature_name.pascalCase()}}ModelFromJson(json);

  /// Converts the {{feature_name.pascalCase()}}Model to JSON
  Map<String, dynamic> toJson() => _${{feature_name.pascalCase()}}ModelToJson(this);

  /// Creates a copy of this model with optionally updated fields
  {{feature_name.pascalCase()}}Model copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? status,
    bool? isActive,
  }) {
    return {{feature_name.pascalCase()}}Model(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      status: status ?? this.status,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        createdAt,
        updatedAt,
        status,
        isActive,
      ];

  @override
  String toString() {
    return '{{feature_name.pascalCase()}}Model(id: $id, title: $title, description: $description, '
        'createdAt: $createdAt, updatedAt: $updatedAt, status: $status, isActive: $isActive)';
  }

  /// Static method to create an empty model
  static {{feature_name.pascalCase()}}Model empty() => const {{feature_name.pascalCase()}}Model(
        id: '',
        title: '',
      );

  /// Check if this model is empty
  bool get isEmpty => id.isEmpty && title.isEmpty;

  /// Check if this model is not empty
  bool get isNotEmpty => !isEmpty;

  /// Get a formatted display name
  String get displayName => title.isNotEmpty ? title : 'Untitled {{feature_name.pascalCase()}}';

  /// Get status color based on status value
  String get statusColor {
    switch (status?.toLowerCase()) {
      case 'active':
        return '#10B981'; // Green
      case 'pending':
        return '#F59E0B'; // Yellow
      case 'inactive':
        return '#EF4444'; // Red
      default:
        return '#6B7280'; // Gray
    }
  }

  /// Check if the item is recently created (within 24 hours)
  bool get isRecentlyCreated {
    if (createdAt == null) return false;
    final now = DateTime.now();
    final difference = now.difference(createdAt!);
    return difference.inHours < 24;
  }

  /// Get formatted creation date
  String get formattedCreatedAt {
    if (createdAt == null) return 'Unknown';
    return '${createdAt!.day}/${createdAt!.month}/${createdAt!.year}';
  }

  /// Get time since creation
  String get timeSinceCreation {
    if (createdAt == null) return 'Unknown';
    final now = DateTime.now();
    final difference = now.difference(createdAt!);
    
    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }
}

/// Extension for working with lists of {{feature_name.pascalCase()}}Model
extension {{feature_name.pascalCase()}}ModelListExtension on List<{{feature_name.pascalCase()}}Model> {
  /// Filter active items
  List<{{feature_name.pascalCase()}}Model> get active => where((item) => item.isActive).toList();
  
  /// Filter inactive items
  List<{{feature_name.pascalCase()}}Model> get inactive => where((item) => !item.isActive).toList();
  
  /// Filter by status
  List<{{feature_name.pascalCase()}}Model> byStatus(String status) =>
      where((item) => item.status?.toLowerCase() == status.toLowerCase()).toList();
  
  /// Search by title or description
  List<{{feature_name.pascalCase()}}Model> search(String query) {
    if (query.isEmpty) return this;
    final lowercaseQuery = query.toLowerCase();
    return where((item) =>
        item.title.toLowerCase().contains(lowercaseQuery) ||
        (item.description?.toLowerCase().contains(lowercaseQuery) ?? false)
    ).toList();
  }
  
  /// Sort by creation date (newest first)
  List<{{feature_name.pascalCase()}}Model> get sortedByDate {
    final List<{{feature_name.pascalCase()}}Model> sorted = List.from(this);
    sorted.sort((a, b) {
      if (a.createdAt == null && b.createdAt == null) return 0;
      if (a.createdAt == null) return 1;
      if (b.createdAt == null) return -1;
      return b.createdAt!.compareTo(a.createdAt!);
    });
    return sorted;
  }
  
  /// Sort by title alphabetically
  List<{{feature_name.pascalCase()}}Model> get sortedByTitle {
    final List<{{feature_name.pascalCase()}}Model> sorted = List.from(this);
    sorted.sort((a, b) => a.title.compareTo(b.title));
    return sorted;
  }
}
{{/has_models}}
