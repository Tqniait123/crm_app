{{#has_cubit}}
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:{{project_name.snakeCase()}}/core/errors/app_error.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/data/repositories/{{feature_name.snakeCase()}}_repository.dart';
{{#has_models}}
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/data/models/{{feature_name.snakeCase()}}_model.dart';
{{/has_models}}
{{#has_params}}
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/data/models/params/{{feature_name.snakeCase()}}_params.dart';
{{/has_params}}

part '{{feature_name.snakeCase()}}_state.dart';

/// Cubit for managing {{feature_name.pascalCase()}} state
/// 
/// This cubit handles all the business logic and state management
/// for {{feature_name.snakeCase()}} operations including CRUD operations,
/// loading states, and error handling.
class {{feature_name.pascalCase()}}Cubit extends Cubit<{{feature_name.pascalCase()}}State> {
  final {{feature_name.pascalCase()}}Repository _repository;

  /// Constructor that injects the repository dependency
  {{feature_name.pascalCase()}}Cubit(this._repository) : super(const {{feature_name.pascalCase()}}State());

  /// Current page for pagination
  int _currentPage = 1;
  
  /// Items per page
  static const int _itemsPerPage = 20;
  
  /// Whether there are more items to load
  bool _hasReachedMax = false;
  
  /// Current search query
  String? _currentSearchQuery;

{{#crud_operations}}
  {{#equals this "read"}}
  /// Loads the list of {{feature_name.snakeCase()}} items
  /// 
  /// Args:
  ///   refresh: If true, clears existing data and loads fresh data
  ///   {{#has_search}}searchQuery: Optional search query to filter results{{/has_search}}
  Future<void> load{{feature_name.pascalCase()}}List({
    bool refresh = false,
    {{#has_search}}String? searchQuery,{{/has_search}}
  }) async {
    try {
      {{#has_search}}
      // Update search query if provided
      if (searchQuery != null) {
        _currentSearchQuery = searchQuery;
      }
      {{/has_search}}

      if (refresh) {
        _currentPage = 1;
        _hasReachedMax = false;
        emit(state.copyWith(
          status: {{feature_name.pascalCase()}}Status.loading,
          items: [],
          error: null,
        ));
      } else if (state.status == {{feature_name.pascalCase()}}Status.loading || _hasReachedMax) {
        return;
      } else {
        emit(state.copyWith(status: {{feature_name.pascalCase()}}Status.loadingMore));
      }

      log('Loading {{feature_name.snakeCase()}} list - Page: $_currentPage{{#has_search}}, Query: $_currentSearchQuery{{/has_search}}', 
          name: '{{feature_name.pascalCase()}}Cubit');

      {{#has_pagination}}
      final result = await _repository.get{{feature_name.pascalCase()}}List(
        page: _currentPage,
        limit: _itemsPerPage,
        {{#has_search}}searchQuery: _currentSearchQuery,{{/has_search}}
      );
      {{/has_pagination}}
      {{^has_pagination}}
      final result = await _repository.get{{feature_name.pascalCase()}}List({{#has_search}}searchQuery: _currentSearchQuery{{/has_search}});
      {{/has_pagination}}

      result.fold(
        (items) {
          log('Successfully loaded ${items.length} {{feature_name.snakeCase()}} items', 
              name: '{{feature_name.pascalCase()}}Cubit');

          {{#has_pagination}}
          // Check if we've reached the end
          if (items.length < _itemsPerPage) {
            _hasReachedMax = true;
          }

          final updatedItems = refresh 
              ? items 
              : [...state.items, ...items];

          _currentPage++;
          {{/has_pagination}}
          {{^has_pagination}}
          final updatedItems = items;
          {{/has_pagination}}

          emit(state.copyWith(
            status: {{feature_name.pascalCase()}}Status.success,
            items: updatedItems,
            {{#has_pagination}}hasReachedMax: _hasReachedMax,{{/has_pagination}}
            error: null,
          ));
        },
        (error) {
          log('Failed to load {{feature_name.snakeCase()}} list: ${error.message}', 
              name: '{{feature_name.pascalCase()}}Cubit');
          emit(state.copyWith(
            status: {{feature_name.pascalCase()}}Status.error,
            error: error,
          ));
        },
      );
    } catch (e) {
      log('Exception in load{{feature_name.pascalCase()}}List: $e', name: '{{feature_name.pascalCase()}}Cubit');
      emit(state.copyWith(
        status: {{feature_name.pascalCase()}}Status.error,
        error: AppError(message: e.toString(), type: ErrorType.unknown),
      ));
    }
  }

  /// Loads a single {{feature_name.snakeCase()}} item by ID
  /// 
  /// Args:
  ///   id: The unique identifier of the item to load
  Future<void> load{{feature_name.pascalCase()}}ById(String id) async {
    try {
      emit(state.copyWith(
        detailStatus: {{feature_name.pascalCase()}}DetailStatus.loading,
        selectedItem: null,
        error: null,
      ));

      log('Loading {{feature_name.snakeCase()}} by ID: $id', name: '{{feature_name.pascalCase()}}Cubit');

      final result = await _repository.get{{feature_name.pascalCase()}}ById(id);

      result.fold(
        (item) {
          log('Successfully loaded {{feature_name.snakeCase()}} with ID: $id', 
              name: '{{feature_name.pascalCase()}}Cubit');
          emit(state.copyWith(
            detailStatus: {{feature_name.pascalCase()}}DetailStatus.success,
            selectedItem: item,
            error: null,
          ));
        },
        (error) {
          log('Failed to load {{feature_name.snakeCase()}} by ID: ${error.message}', 
              name: '{{feature_name.pascalCase()}}Cubit');
          emit(state.copyWith(
            detailStatus: {{feature_name.pascalCase()}}DetailStatus.error,
            error: error,
          ));
        },
      );
    } catch (e) {
      log('Exception in load{{feature_name.pascalCase()}}ById: $e', name: '{{feature_name.pascalCase()}}Cubit');
      emit(state.copyWith(
        detailStatus: {{feature_name.pascalCase()}}DetailStatus.error,
        error: AppError(message: e.toString(), type: ErrorType.unknown),
      ));
    }
  }

  {{#has_search}}
  /// Searches {{feature_name.snakeCase()}} items
  /// 
  /// Args:
  ///   query: The search query string
  Future<void> search{{feature_name.pascalCase()}}(String query) async {
    if (query.trim().isEmpty) {
      await load{{feature_name.pascalCase()}}List(refresh: true);
      return;
    }

    await load{{feature_name.pascalCase()}}List(refresh: true, searchQuery: query.trim());
  }

  /// Clears the current search and reloads all items
  Future<void> clearSearch() async {
    _currentSearchQuery = null;
    await load{{feature_name.pascalCase()}}List(refresh: true);
  }
  {{/has_search}}

  {{#has_pagination}}
  /// Loads more items for pagination
  Future<void> loadMore() async {
    if (!_hasReachedMax && state.status != {{feature_name.pascalCase()}}Status.loadingMore) {
      await load{{feature_name.pascalCase()}}List();
    }
  }
  {{/has_pagination}}
  {{/equals}}

  {{#equals this "create"}}
  /// Creates a new {{feature_name.snakeCase()}} item
  /// 
  /// Args:
  ///   params: The parameters for creating the item
  Future<void> create{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}Params params) async {
    try {
      emit(state.copyWith(
        createStatus: {{feature_name.pascalCase()}}CreateStatus.loading,
        error: null,
      ));

      log('Creating {{feature_name.snakeCase()}}: ${params.title}', name: '{{feature_name.pascalCase()}}Cubit');

      final result = await _repository.create{{feature_name.pascalCase()}}(params);

      result.fold(
        (createdItem) {
          log('Successfully created {{feature_name.snakeCase()}} with ID: ${createdItem.id}', 
              name: '{{feature_name.pascalCase()}}Cubit');
          
          // Add the new item to the beginning of the list
          final updatedItems = [createdItem, ...state.items];
          
          emit(state.copyWith(
            createStatus: {{feature_name.pascalCase()}}CreateStatus.success,
            items: updatedItems,
            selectedItem: createdItem,
            error: null,
          ));
        },
        (error) {
          log('Failed to create {{feature_name.snakeCase()}}: ${error.message}', 
              name: '{{feature_name.pascalCase()}}Cubit');
          emit(state.copyWith(
            createStatus: {{feature_name.pascalCase()}}CreateStatus.error,
            error: error,
          ));
        },
      );
    } catch (e) {
      log('Exception in create{{feature_name.pascalCase()}}: $e', name: '{{feature_name.pascalCase()}}Cubit');
      emit(state.copyWith(
        createStatus: {{feature_name.pascalCase()}}CreateStatus.error,
        error: AppError(message: e.toString(), type: ErrorType.unknown),
      ));
    }
  }
  {{/equals}}

  {{#equals this "update"}}
  /// Updates an existing {{feature_name.snakeCase()}} item
  /// 
  /// Args:
  ///   id: The unique identifier of the item to update
  ///   params: The parameters containing updated values
  Future<void> update{{feature_name.pascalCase()}}(String id, {{feature_name.pascalCase()}}Params params) async {
    try {
      emit(state.copyWith(
        updateStatus: {{feature_name.pascalCase()}}UpdateStatus.loading,
        error: null,
      ));

      log('Updating {{feature_name.snakeCase()}} with ID: $id', name: '{{feature_name.pascalCase()}}Cubit');

      final result = await _repository.update{{feature_name.pascalCase()}}(id, params);

      result.fold(
        (updatedItem) {
          log('Successfully updated {{feature_name.snakeCase()}} with ID: $id', 
              name: '{{feature_name.pascalCase()}}Cubit');
          
          // Update the item in the list
          final updatedItems = state.items.map((item) {
            return item.id == id ? updatedItem : item;
          }).toList();
          
          emit(state.copyWith(
            updateStatus: {{feature_name.pascalCase()}}UpdateStatus.success,
            items: updatedItems,
            selectedItem: state.selectedItem?.id == id ? updatedItem : state.selectedItem,
            error: null,
          ));
        },
        (error) {
          log('Failed to update {{feature_name.snakeCase()}} with ID: $id - ${error.message}', 
              name: '{{feature_name.pascalCase()}}Cubit');
          emit(state.copyWith(
            updateStatus: {{feature_name.pascalCase()}}UpdateStatus.error,
            error: error,
          ));
        },
      );
    } catch (e) {
      log('Exception in update{{feature_name.pascalCase()}}: $e', name: '{{feature_name.pascalCase()}}Cubit');
      emit(state.copyWith(
        updateStatus: {{feature_name.pascalCase()}}UpdateStatus.error,
        error: AppError(message: e.toString(), type: ErrorType.unknown),
      ));
    }
  }
  {{/equals}}

  {{#equals this "delete"}}
  /// Deletes a {{feature_name.snakeCase()}} item
  /// 
  /// Args:
  ///   id: The unique identifier of the item to delete
  Future<void> delete{{feature_name.pascalCase()}}(String id) async {
    try {
      emit(state.copyWith(
        deleteStatus: {{feature_name.pascalCase()}}DeleteStatus.loading,
        error: null,
      ));

      log('Deleting {{feature_name.snakeCase()}} with ID: $id', name: '{{feature_name.pascalCase()}}Cubit');

      final result = await _repository.delete{{feature_name.pascalCase()}}(id);

      result.fold(
        (success) {
          if (success) {
            log('Successfully deleted {{feature_name.snakeCase()}} with ID: $id', 
                name: '{{feature_name.pascalCase()}}Cubit');
            
            // Remove the item from the list
            final updatedItems = state.items.where((item) => item.id != id).toList();
            
            emit(state.copyWith(
              deleteStatus: {{feature_name.pascalCase()}}DeleteStatus.success,
              items: updatedItems,
              selectedItem: state.selectedItem?.id == id ? null : state.selectedItem,
              error: null,
            ));
          } else {
            emit(state.copyWith(
              deleteStatus: {{feature_name.pascalCase()}}DeleteStatus.error,
              error: AppError(message: 'Delete operation failed', type: ErrorType.unknown),
            ));
          }
        },
        (error) {
          log('Failed to delete {{feature_name.snakeCase()}} with ID: $id - ${error.message}', 
              name: '{{feature_name.pascalCase()}}Cubit');
          emit(state.copyWith(
            deleteStatus: {{feature_name.pascalCase()}}DeleteStatus.error,
            error: error,
          ));
        },
      );
    } catch (e) {
      log('Exception in delete{{feature_name.pascalCase()}}: $e', name: '{{feature_name.pascalCase()}}Cubit');
      emit(state.copyWith(
        deleteStatus: {{feature_name.pascalCase()}}DeleteStatus.error,
        error: AppError(message: e.toString(), type: ErrorType.unknown),
      ));
    }
  }
  {{/equals}}
{{/crud_operations}}

  /// Resets all statuses to initial state
  void resetStatuses() {
    emit(state.copyWith(
      createStatus: {{feature_name.pascalCase()}}CreateStatus.initial,
      updateStatus: {{feature_name.pascalCase()}}UpdateStatus.initial,
      deleteStatus: {{feature_name.pascalCase()}}DeleteStatus.initial,
      detailStatus: {{feature_name.pascalCase()}}DetailStatus.initial,
      error: null,
    ));
  }

  /// Clears the selected item
  void clearSelectedItem() {
    emit(state.copyWith(
      selectedItem: null,
      detailStatus: {{feature_name.pascalCase()}}DetailStatus.initial,
    ));
  }

  /// Clears any error state
  void clearError() {
    emit(state.copyWith(error: null));
  }

  /// Refreshes the entire list
  Future<void> refresh() async {
    await load{{feature_name.pascalCase()}}List(refresh: true);
  }

  @override
  void onChange(Change<{{feature_name.pascalCase()}}State> change) {
    super.onChange(change);
    log('{{feature_name.pascalCase()}}Cubit State Changed: ${change.nextState.status}', 
        name: '{{feature_name.pascalCase()}}Cubit');
  }
}
{{/has_cubit}}
