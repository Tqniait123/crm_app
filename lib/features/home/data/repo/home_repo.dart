import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:crm_app/core/preferences/shared_pref.dart';

import '../../../../core/api/dio_client.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/api/response/response.dart';
import '../../../../core/errors/app_error.dart';
import '../../../../core/extensions/token_to_authorization_options.dart';
import '../datasource/home_remote_datasource.dart';
import '../models/params/home_params.dart';
import '../models/responses/home_model.dart';

abstract class HomeRepo {
  Future<Either<HomeModel, AppError>> getHome(HomeParams params);
  Future<Either<String, AppError>> createHome(HomeParams params);
  Future<Either<String, AppError>> updateHome(HomeParams params);
  Future<Either<String, AppError>> deleteHome(String id);
}

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _remoteDataSource;
  final CrmAppPreferences _localDataSource;

  HomeRepoImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<HomeModel, AppError>> getHome(HomeParams params) async {
    try {
      final response = await _remoteDataSource.getHome(params);

      if (response.isSuccess) {
        return Left(response.data!);
      } else {
        return Right(AppError(message: response.errorMessage, apiResponse: response, type: ErrorType.api));
      }
    } catch (e) {
      return Right(AppError(message: e.toString(), type: ErrorType.unknown));
    }
  }

  @override
  Future<Either<String, AppError>> createHome(HomeParams params) async {
    try {
      final response = await _remoteDataSource.createHome(params);

      if (response.isSuccess) {
        return Left(response.message);
      } else {
        return Right(AppError(message: response.errorMessage, apiResponse: response, type: ErrorType.api));
      }
    } catch (e) {
      return Right(AppError(message: e.toString(), type: ErrorType.unknown));
    }
  }

  @override
  Future<Either<String, AppError>> updateHome(HomeParams params) async {
    try {
      final response = await _remoteDataSource.updateHome(params);

      if (response.isSuccess) {
        return Left(response.message);
      } else {
        return Right(AppError(message: response.errorMessage, apiResponse: response, type: ErrorType.api));
      }
    } catch (e) {
      return Right(AppError(message: e.toString(), type: ErrorType.unknown));
    }
  }

  @override
  Future<Either<String, AppError>> deleteHome(String id) async {
    try {
      final response = await _remoteDataSource.deleteHome(id);

      if (response.isSuccess) {
        return Left(response.message);
      } else {
        return Right(AppError(message: response.errorMessage, apiResponse: response, type: ErrorType.api));
      }
    } catch (e) {
      return Right(AppError(message: e.toString(), type: ErrorType.unknown));
    }
  }
}
