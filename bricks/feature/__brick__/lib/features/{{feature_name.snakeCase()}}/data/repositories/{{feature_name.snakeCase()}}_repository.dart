import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:{{project_name.snakeCase()}}/core/errors/app_error.dart';
import 'package:{{project_name.snakeCase()}}/core/preferences/shared_pref.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/data/datasources/{{feature_name.snakeCase()}}_remote_datasource.dart';
{{#has_models}}
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/data/models/{{feature_name.snakeCase()}}_model.dart';
{{/has_models}}
{{#has_params}}
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/data/models/params/{{feature_name.snakeCase()}}_params.dart';
{{/has_params}}

/// Abstract repository defining {{feature_name.pascalCase()}} business operations
/// 
/// This repository provides a clean interface between the presentation layer
/// and the data layer, handling business logic and error management.
abstract class {{feature_name.pascalCase()}}Repository {
{{#crud_operations}}
  {{#equals this "read"}}
  /// Retrieves a list of {{feature_name.snakeCase()}} items
  /// 
  /// Returns [Either<List<{{feature_name.pascalCase()}}Model>, AppError>] where:
  /// - Left contains the successful result with list of items
  /// - Right contains the error if operation fails
  {{#has_pagination}}
  Future<Either<List<{{feature_name.pascalCase()}}Model>, AppError>> get{{feature_name.pascalCase()}}List({
    int page = 1,
    int limit = 20,
    {{#has_search}}String? searchQuery,{{/has_search}}
  });
  {{/has_pagination}}
  {{^has_pagination}}
  Future<Either<List<{{feature_name.pascalCase()}}Model>, AppError>> get{{feature_name.pascalCase()}}List({{#has_search}}{String? searchQuery}{{/has_search}});
  {{/has_pagination}}
  
  /// Retrieves a single {{feature_name.snakeCase()}} item by ID
  /// 
  /// Args:
  ///   id: The unique identifier of the {{feature_name.snakeCase()}} item
  /// 
  /// Returns [Either<{{feature_name.pascalCase()}}Model, AppError>] where:
  /// - Left contains the successful result with the item
  /// - Right contains the error if operation fails
  Future<Either<{{feature_name.pascalCase()}}Model, AppError>> get{{feature_name.pascalCase()}}ById(String id);
  {{/equals}}
  
  {{#equals this "create"}}
  /// Creates a new {{feature_name.snakeCase()}} item
  /// 
  /// Args:
  ///   params: The parameters required to create the item
  /// 
  /// Returns [Either<{{feature_name.pascalCase()}}Model, AppError>] where:
  /// - Left contains the created item
  /// - Right contains the error if creation fails
  Future<Either<{{feature_name.pascalCase()}}Model, AppError>> create{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}Params params);
  {{/equals}}
  
  {{#equals this "update"}}
  /// Updates an existing {{feature_name.snakeCase()}} item
  /// 
  /// Args:
  ///   id: The unique identifier of the item to update
  ///   params: The parameters containing updated values
  /// 
  /// Returns [Either<{{feature_name.pascalCase()}}Model, AppError>] where:
  /// - Left contains the updated item
  /// - Right contains the error if update fails
  Future<Either<{{feature_name.pascalCase()}}Model, AppError>> update{{feature_name.pascalCase()}}(String id, {{feature_name.pascalCase()}}Params params);
  {{/equals}}
  
  {{#equals this "delete"}}
  /// Deletes a {{feature_name.snakeCase()}} item
  /// 
  /// Args:
  ///   id: The unique identifier of the item to delete
  /// 
  /// Returns [Either<bool, AppError>] where:
  /// - Left contains true if deletion was successful
  /// - Right contains the error if deletion fails
  Future<Either<bool, AppError>> delete{{feature_name.pascalCase()}}(String id);
  {{/equals}}
{{/crud_operations}}
}

/// Implementation of {{feature_name.pascalCase()}}Repository
/// 
/// This class implements the actual business logic for {{feature_name.snakeCase()}} operations,
/// coordinating between remote data sources and local preferences.
class {{feature_name.pascalCase()}}RepositoryImpl implements {{feature_name.pascalCase()}}Repository {
  final {{feature_name.pascalCase()}}RemoteDataSource _remoteDataSource;
  final {{project_name.pascalCase()}}Preferences _localDataSource;

  /// Constructor that injects the required dependencies
  {{feature_name.pascalCase()}}RepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
  );

{{#crud_operations}}
  {{#equals this "read"}}
  @override
  {{#has_pagination}}
  Future<Either<List<{{feature_name.pascalCase()}}Model>, AppError>> get{{feature_name.pascalCase()}}List({
    int page = 1,
    int limit = 20,
    {{#has_search}}String? searchQuery,{{/has_search}}
  }) async {
  {{/has_pagination}}
  {{^has_pagination}}
  Future<Either<List<{{feature_name.pascalCase()}}Model>, AppError>> get{{feature_name.pascalCase()}}List({{#has_search}}{String? searchQuery}{{/has_search}}) async {
  {{/has_pagination}}
    try {
      log('Fetching {{feature_name.snakeCase()}} list{{#has_pagination}} - Page: $page, Limit: $limit{{/has_pagination}}{{#has_search}}, Query: $searchQuery{{/has_search}}', 
          name: '{{feature_name.pascalCase()}}Repository');

      final response = await _remoteDataSource.get{{feature_name.pascalCase()}}List(
        {{#has_pagination}}
        page: page,
        limit: limit,
        {{/has_pagination}}
        {{#has_search}}
        {{#has_pagination}}searchQuery: searchQuery,{{/has_pagination}}
        {{^has_pagination}}searchQuery: searchQuery,{{/has_pagination}}
        {{/has_search}}
      );

      if (response.isSuccess && response.data != null) {
        log('Successfully fetched ${response.data!.length} {{feature_name.snakeCase()}} items', 
            name: '{{feature_name.pascalCase()}}Repository');
        return Left(response.data!);
      } else {
        final error = AppError(
          message: response.errorMessage ?? 'Failed to fetch {{feature_name.snakeCase()}} list',
          apiResponse: response,
          type: ErrorType.api,
        );
        log('Failed to fetch {{feature_name.snakeCase()}} list: ${error.message}', 
            name: '{{feature_name.pascalCase()}}Repository');
        return Right(error);
      }
    } catch (e) {
      log('Exception occurred while fetching {{feature_name.snakeCase()}} list: $e', 
          name: '{{feature_name.pascalCase()}}Repository');
      return Right(AppError(
        message: e.toString(),
        type: ErrorType.unknown,
      ));
    }
  }

  @override
  Future<Either<{{feature_name.pascalCase()}}Model, AppError>> get{{feature_name.pascalCase()}}ById(String id) async {
    try {
      log('Fetching {{feature_name.snakeCase()}} by ID: $id', name: '{{feature_name.pascalCase()}}Repository');

      final response = await _remoteDataSource.get{{feature_name.pascalCase()}}ById(id);

      if (response.isSuccess && response.data != null) {
        log('Successfully fetched {{feature_name.snakeCase()}} with ID: $id', 
            name: '{{feature_name.pascalCase()}}Repository');
        return Left(response.data!);
      } else {
        final error = AppError(
          message: response.errorMessage ?? 'Failed to fetch {{feature_name.snakeCase()}}',
          apiResponse: response,
          type: ErrorType.api,
        );
        log('Failed to fetch {{feature_name.snakeCase()}} by ID: ${error.message}', 
            name: '{{feature_name.pascalCase()}}Repository');
        return Right(error);
      }
    } catch (e) {
      log('Exception occurred while fetching {{feature_name.snakeCase()}} by ID: $e', 
          name: '{{feature_name.pascalCase()}}Repository');
      return Right(AppError(
        message: e.toString(),
        type: ErrorType.unknown,
      ));
    }
  }
  {{/equals}}
  
  {{#equals this "create"}}
  @override
  Future<Either<{{feature_name.pascalCase()}}Model, AppError>> create{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}Params params) async {
    try {
      log('Creating {{feature_name.snakeCase()}}: ${params.title}', name: '{{feature_name.pascalCase()}}Repository');

      // Validate parameters before making the request
      if (!params.isValid) {
        final validationErrors = params.validationErrors;
        log('Validation failed for {{feature_name.snakeCase()}} creation: ${validationErrors.join(', ')}', 
            name: '{{feature_name.pascalCase()}}Repository');
        return Right(AppError(
          message: validationErrors.first,
          type: ErrorType.validation,
        ));
      }

      final response = await _remoteDataSource.create{{feature_name.pascalCase()}}(params);

      if (response.isSuccess && response.data != null) {
        log('Successfully created {{feature_name.snakeCase()}} with ID: ${response.data!.id}', 
            name: '{{feature_name.pascalCase()}}Repository');
        return Left(response.data!);
      } else {
        final error = AppError(
          message: response.errorMessage ?? 'Failed to create {{feature_name.snakeCase()}}',
          apiResponse: response,
          type: ErrorType.api,
        );
        log('Failed to create {{feature_name.snakeCase()}}: ${error.message}', 
            name: '{{feature_name.pascalCase()}}Repository');
        return Right(error);
      }
    } catch (e) {
      log('Exception occurred while creating {{feature_name.snakeCase()}}: $e', 
          name: '{{feature_name.pascalCase()}}Repository');
      return Right(AppError(
        message: e.toString(),
        type: ErrorType.unknown,
      ));
    }
  }
  {{/equals}}
  
  {{#equals this "update"}}
  @override
  Future<Either<{{feature_name.pascalCase()}}Model, AppError>> update{{feature_name.pascalCase()}}(String id, {{feature_name.pascalCase()}}Params params) async {
    try {
      log('Updating {{feature_name.snakeCase()}} with ID: $id', name: '{{feature_name.pascalCase()}}Repository');

      // Validate parameters before making the request
      if (!params.isValid) {
        final validationErrors = params.validationErrors;
        log('Validation failed for {{feature_name.snakeCase()}} update: ${validationErrors.join(', ')}', 
            name: '{{feature_name.pascalCase()}}Repository');
        return Right(AppError(
          message: validationErrors.first,
          type: ErrorType.validation,
        ));
      }

      final response = await _remoteDataSource.update{{feature_name.pascalCase()}}(id, params);

      if (response.isSuccess && response.data != null) {
        log('Successfully updated {{feature_name.snakeCase()}} with ID: $id', 
            name: '{{feature_name.pascalCase()}}Repository');
        return Left(response.data!);
      } else {
        final error = AppError(
          message: response.errorMessage ?? 'Failed to update {{feature_name.snakeCase()}}',
          apiResponse: response,
          type: ErrorType.api,
        );
        log('Failed to update {{feature_name.snakeCase()}} with ID: $id - ${error.message}', 
            name: '{{feature_name.pascalCase()}}Repository');
        return Right(error);
      }
    } catch (e) {
      log('Exception occurred while updating {{feature_name.snakeCase()}}: $e', 
          name: '{{feature_name.pascalCase()}}Repository');
      return Right(AppError(
        message: e.toString(),
        type: ErrorType.unknown,
      ));
    }
  }
  {{/equals}}
  
  {{#equals this "delete"}}
  @override
  Future<Either<bool, AppError>> delete{{feature_name.pascalCase()}}(String id) async {
    try {
      log('Deleting {{feature_name.snakeCase()}} with ID: $id', name: '{{feature_name.pascalCase()}}Repository');

      final response = await _remoteDataSource.delete{{feature_name.pascalCase()}}(id);

      if (response.isSuccess) {
        log('Successfully deleted {{feature_name.snakeCase()}} with ID: $id', 
            name: '{{feature_name.pascalCase()}}Repository');
        return const Left(true);
      } else {
        final error = AppError(
          message: response.errorMessage ?? 'Failed to delete {{feature_name.snakeCase()}}',
          apiResponse: response,
          type: ErrorType.api,
        );
        log('Failed to delete {{feature_name.snakeCase()}} with ID: $id - ${error.message}', 
            name: '{{feature_name.pascalCase()}}Repository');
        return Right(error);
      }
    } catch (e) {
      log('Exception occurred while deleting {{feature_name.snakeCase()}}: $e', 
          name: '{{feature_name.pascalCase()}}Repository');
      return Right(AppError(
        message: e.toString(),
        type: ErrorType.unknown,
      ));
    }
  }
  {{/equals}}
{{/crud_operations}}
}
