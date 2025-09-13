{{#has_cubit}}
part of '{{feature_name.snakeCase()}}_cubit.dart';

/// Status enumeration for list operations
enum {{feature_name.pascalCase()}}Status {
  /// Initial state before any operation
  initial,
  /// Loading data
  loading,
  /// Loading more data for pagination
  loadingMore,
  /// Operation completed successfully
  success,
  /// Operation failed with error
  error,
}

/// Status enumeration for detail operations
enum {{feature_name.pascalCase()}}DetailStatus {
  /// Initial state before any operation
  initial,
  /// Loading single item data
  loading,
  /// Operation completed successfully
  success,
  /// Operation failed with error
  error,
}

/// Status enumeration for create operations
enum {{feature_name.pascalCase()}}CreateStatus {
  /// Initial state before any operation
  initial,
  /// Creating new item
  loading,
  /// Item created successfully
  success,
  /// Create operation failed
  error,
}

/// Status enumeration for update operations
enum {{feature_name.pascalCase()}}UpdateStatus {
  /// Initial state before any operation
  initial,
  /// Updating item
  loading,
  /// Item updated successfully
  success,
  /// Update operation failed
  error,
}

/// Status enumeration for delete operations
enum {{feature_name.pascalCase()}}DeleteStatus {
  /// Initial state before any operation
  initial,
  /// Deleting item
  loading,
  /// Item deleted successfully
  success,
  /// Delete operation failed
  error,
}

/// State class for {{feature_name.pascalCase()}} feature
/// 
/// This class manages all the state for the {{feature_name.snakeCase()}} feature
/// including lists, selected items, loading states, and errors.
class {{feature_name.pascalCase()}}State extends Equatable {
  /// Current status of list operations
  final {{feature_name.pascalCase()}}Status status;
  
  /// Current status of detail operations
  final {{feature_name.pascalCase()}}DetailStatus detailStatus;
  
  /// Current status of create operations
  final {{feature_name.pascalCase()}}CreateStatus createStatus;
  
  /// Current status of update operations
  final {{feature_name.pascalCase()}}UpdateStatus updateStatus;
  
  /// Current status of delete operations
  final {{feature_name.pascalCase()}}DeleteStatus deleteStatus;
  
  /// List of {{feature_name.snakeCase()}} items
  final List<{{feature_name.pascalCase()}}Model> items;
  
  /// Currently selected {{feature_name.snakeCase()}} item
  final {{feature_name.pascalCase()}}Model? selectedItem;
  
  /// Current error, if any
  final AppError? error;
  
  /// Whether pagination has reached the maximum
  final bool hasReachedMax;
  
  /// Current search query
  final String? searchQuery;
  
  /// Whether the list is currently being refreshed
  final bool isRefreshing;

  /// Constructor for {{feature_name.pascalCase()}}State
  const {{feature_name.pascalCase()}}State({
    this.status = {{feature_name.pascalCase()}}Status.initial,
    this.detailStatus = {{feature_name.pascalCase()}}DetailStatus.initial,
    this.createStatus = {{feature_name.pascalCase()}}CreateStatus.initial,
    this.updateStatus = {{feature_name.pascalCase()}}UpdateStatus.initial,
    this.deleteStatus = {{feature_name.pascalCase()}}DeleteStatus.initial,
    this.items = const [],
    this.selectedItem,
    this.error,
    this.hasReachedMax = false,
    this.searchQuery,
    this.isRefreshing = false,
  });

  /// Creates a copy of this state with optionally updated fields
  {{feature_name.pascalCase()}}State copyWith({
    {{feature_name.pascalCase()}}Status? status,
    {{feature_name.pascalCase()}}DetailStatus? detailStatus,
    {{feature_name.pascalCase()}}CreateStatus? createStatus,
    {{feature_name.pascalCase()}}UpdateStatus? updateStatus,
    {{feature_name.pascalCase()}}DeleteStatus? deleteStatus,
    List<{{feature_name.pascalCase()}}Model>? items,
    {{feature_name.pascalCase()}}Model? selectedItem,
    AppError? error,
    bool? hasReachedMax,
    String? searchQuery,
    bool? isRefreshing,
  }) {
    return {{feature_name.pascalCase()}}State(
      status: status ?? this.status,
      detailStatus: detailStatus ?? this.detailStatus,
      createStatus: createStatus ?? this.createStatus,
      updateStatus: updateStatus ?? this.updateStatus,
      deleteStatus: deleteStatus ?? this.deleteStatus,
      items: items ?? this.items,
      selectedItem: selectedItem ?? this.selectedItem,
      error: error ?? this.error,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      searchQuery: searchQuery ?? this.searchQuery,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }

  @override
  List<Object?> get props => [
        status,
        detailStatus,
        createStatus,
        updateStatus,
        deleteStatus,
        items,
        selectedItem,
        error,
        hasReachedMax,
        searchQuery,
        isRefreshing,
      ];

  @override
  String toString() {
    return '''{{feature_name.pascalCase()}}State(
      status: $status,
      detailStatus: $detailStatus,
      createStatus: $createStatus,
      updateStatus: $updateStatus,
      deleteStatus: $deleteStatus,
      itemsCount: ${items.length},
      selectedItem: $selectedItem,
      error: $error,
      hasReachedMax: $hasReachedMax,
      searchQuery: $searchQuery,
      isRefreshing: $isRefreshing,
    )''';
  }

  // Convenience getters
  
  /// Whether the main list is currently loading
  bool get isLoading => status == {{feature_name.pascalCase()}}Status.loading;
  
  /// Whether more items are being loaded for pagination
  bool get isLoadingMore => status == {{feature_name.pascalCase()}}Status.loadingMore;
  
  /// Whether the list has loaded successfully
  bool get isSuccess => status == {{feature_name.pascalCase()}}Status.success;
  
  /// Whether there's an error with list operations
  bool get hasError => status == {{feature_name.pascalCase()}}Status.error;
  
  /// Whether detail operations are loading
  bool get isDetailLoading => detailStatus == {{feature_name.pascalCase()}}DetailStatus.loading;
  
  /// Whether detail operations were successful
  bool get isDetailSuccess => detailStatus == {{feature_name.pascalCase()}}DetailStatus.success;
  
  /// Whether detail operations have an error
  bool get hasDetailError => detailStatus == {{feature_name.pascalCase()}}DetailStatus.error;
  
  /// Whether create operations are loading
  bool get isCreating => createStatus == {{feature_name.pascalCase()}}CreateStatus.loading;
  
  /// Whether create operations were successful
  bool get isCreateSuccess => createStatus == {{feature_name.pascalCase()}}CreateStatus.success;
  
  /// Whether create operations have an error
  bool get hasCreateError => createStatus == {{feature_name.pascalCase()}}CreateStatus.error;
  
  /// Whether update operations are loading
  bool get isUpdating => updateStatus == {{feature_name.pascalCase()}}UpdateStatus.loading;
  
  /// Whether update operations were successful
  bool get isUpdateSuccess => updateStatus == {{feature_name.pascalCase()}}UpdateStatus.success;
  
  /// Whether update operations have an error
  bool get hasUpdateError => updateStatus == {{feature_name.pascalCase()}}UpdateStatus.error;
  
  /// Whether delete operations are loading
  bool get isDeleting => deleteStatus == {{feature_name.pascalCase()}}DeleteStatus.loading;
  
  /// Whether delete operations were successful
  bool get isDeleteSuccess => deleteStatus == {{feature_name.pascalCase()}}DeleteStatus.success;
  
  /// Whether delete operations have an error
  bool get hasDeleteError => deleteStatus == {{feature_name.pascalCase()}}DeleteStatus.error;
  
  /// Whether any operation is currently loading
  bool get isAnyLoading => 
      isLoading || 
      isLoadingMore || 
      isDetailLoading || 
      isCreating || 
      isUpdating || 
      isDeleting;
  
  /// Whether the list is empty
  bool get isEmpty => items.isEmpty;
  
  /// Whether the list is not empty
  bool get isNotEmpty => items.isNotEmpty;
  
  /// Total number of items
  int get itemCount => items.length;
  
  /// Whether search is active
  bool get hasActiveSearch => searchQuery != null && searchQuery!.isNotEmpty;
  
  /// Get active items (filtered by active status)
  List<{{feature_name.pascalCase()}}Model> get activeItems => 
      items.where((item) => item.isActive).toList();
  
  /// Get inactive items
  List<{{feature_name.pascalCase()}}Model> get inactiveItems => 
      items.where((item) => !item.isActive).toList();
  
  /// Get items by status
  List<{{feature_name.pascalCase()}}Model> getItemsByStatus(String status) =>
      items.where((item) => item.status?.toLowerCase() == status.toLowerCase()).toList();
  
  /// Find item by ID
  {{feature_name.pascalCase()}}Model? findItemById(String id) {
    try {
      return items.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }
  
  /// Check if an item exists
  bool containsItem(String id) => findItemById(id) != null;
  
  /// Get recently created items (within 24 hours)
  List<{{feature_name.pascalCase()}}Model> get recentItems =>
      items.where((item) => item.isRecentlyCreated).toList();
  
  /// Get items sorted by creation date (newest first)
  List<{{feature_name.pascalCase()}}Model> get itemsSortedByDate => 
      [...items]..sort((a, b) {
        if (a.createdAt == null && b.createdAt == null) return 0;
        if (a.createdAt == null) return 1;
        if (b.createdAt == null) return -1;
        return b.createdAt!.compareTo(a.createdAt!);
      });
  
  /// Get items sorted alphabetically by title
  List<{{feature_name.pascalCase()}}Model> get itemsSortedByTitle => 
      [...items]..sort((a, b) => a.title.compareTo(b.title));
}
{{/has_cubit}}
