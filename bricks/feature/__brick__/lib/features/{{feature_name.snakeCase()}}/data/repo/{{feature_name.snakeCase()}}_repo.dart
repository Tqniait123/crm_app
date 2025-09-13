import 'package:dartz/dartz.dart';
import 'package:{{project_name.snakeCase()}}/core/errors/app_error.dart';
import 'package:{{project_name.snakeCase()}}/core/preferences/shared_pref.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/data/datasources/{{feature_name.snakeCase()}}_remote_datasource.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/domain/repositories/{{feature_name.snakeCase()}}_repository.dart';
{{#has_models}}
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/data/models/{{feature_name.snakeCase()}}_model.dart';
{{/has_models}}
{{#has_params}}
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/data/models/params/{{feature_name.snakeCase()}}_params.dart';
{{/has_params}}

class {{feature_name.pascalCase()}}RepoImpl implements {{feature_name.pascalCase()}}Repository {
  final {{feature_name.pascalCase()}}RemoteDataSource _remoteDataSource;
  final {{project_name.pascalCase()}}Preferences _localDataSource;

  {{feature_name.pascalCase()}}RepoImpl(this._remoteDataSource, this._localDataSource);

  {{#has_models}}
  @override
  Future<Either<List<{{feature_name.pascalCase()}}Model>, AppError>> get{{feature_name.pascalCase()}}s() async {
    try {
      final response = await _remoteDataSource.get{{feature_name.pascalCase()}}s();
      if (response.isSuccess) {
        return Left(response.data!);
      } else {
        return Right(AppError(
          message: response.errorMessage,
          apiResponse: response,
          type: ErrorType.api,
        ));
      }
    } catch (e) {
      return Right(AppError(message: e.toString(), type: ErrorType.unknown));
    }
  }

  @override
  Future<Either<{{feature_name.pascalCase()}}Model, AppError>> get{{feature_name.pascalCase()}}ById(String id) async {
    try {
      final response = await _remoteDataSource.get{{feature_name.pascalCase()}}ById(id);
      if (response.isSuccess) {
        return Left(response.data!);
      } else {
        return Right(AppError(
          message: response.errorMessage,
          apiResponse: response,
          type: ErrorType.api,
        ));
      }
    } catch (e) {
      return Right(AppError(message: e.toString(), type: ErrorType.unknown));
    }
  }

  {{#has_params}}
  @override
  Future<Either<{{feature_name.pascalCase()}}Model, AppError>> create{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}Params params) async {
    try {
      final response = await _remoteDataSource.create{{feature_name.pascalCase()}}(params);
      if (response.isSuccess) {
        return Left(response.data!);
      } else {
        return Right(AppError(
          message: response.errorMessage,
          apiResponse: response,
          type: ErrorType.api,
        ));
      }
    } catch (e) {
      return Right(AppError(message: e.toString(), type: ErrorType.unknown));
    }
  }

  @override
  Future<Either<{{feature_name.pascalCase()}}Model, AppError>> update{{feature_name.pascalCase()}}(String id, {{feature_name.pascalCase()}}Params params) async {
    try {
      final response = await _remoteDataSource.update{{feature_name.pascalCase()}}(id, params);
      if (response.isSuccess) {
        return Left(response.data!);
      } else {
        return Right(AppError(
          message: response.errorMessage,
          apiResponse: response,
          type: ErrorType.api,
        ));
      }
    } catch (e) {
      return Right(AppError(message: e.toString(), type: ErrorType.unknown));
    }
  }
  {{/has_params}}

  @override
  Future<Either<void, AppError>> delete{{feature_name.pascalCase()}}(String id) async {
    try {
      final response = await _remoteDataSource.delete{{feature_name.pascalCase()}}(id);
      if (response.isSuccess) {
        return const Left(null);
      } else {
        return Right(AppError(
          message: response.errorMessage,
          apiResponse: response,
          type: ErrorType.api,
        ));
      }
    } catch (e) {
      return Right(AppError(message: e.toString(), type: ErrorType.unknown));
    }
  }
  {{/has_models}}
}
