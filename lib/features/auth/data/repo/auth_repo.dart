import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:project_name/core/errors/app_error.dart';
import 'package:project_name/core/preferences/shared_pref.dart';
import 'package:project_name/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:project_name/features/auth/data/models/auth_model.dart';
import 'package:project_name/features/auth/data/models/user.dart';

abstract class AuthRepo {
  Future<Either<User, AppError>> autoLogin();
  Future<Either<AuthModel, AppError>> login(LoginParams params);

}

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _remoteDataSource;
  final ProjectNamePreferences _localDataSource;

  AuthRepoImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<User, AppError>> autoLogin() async {
    try {
      final token = _localDataSource.getToken();
      final response = await _remoteDataSource.autoLogin(token ?? '');

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
  Future<Either<AuthModel, AppError>> login(LoginParams params) async {
    try {
      final response = await _remoteDataSource.login(params);

      if (response.isSuccess) {
        _localDataSource.saveToken(response.data?.token ?? '');
        _localDataSource.setRememberMe(params.isRemembered);
        // if (params.isRemembered) {
        // }
        return Left(response.data!);
      } else {
        return Right(AppError(message: response.errorMessage, apiResponse: response, type: ErrorType.api));
      }
    } catch (e) {
      return Right(AppError(message: e.toString(), type: ErrorType.unknown));
    }
  }
}
