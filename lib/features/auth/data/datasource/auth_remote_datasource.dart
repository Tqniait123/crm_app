import 'package:crm_app/core/api/response/response.dart';

sealed class AuthRemoteDataSource {
  // Future<ApiResponse> login();
  Future<ApiResponse<User>> autoLogin(String token);
  Future<ApiResponse<AuthModel>> login(LoginParams params);

  }


class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;
  // final FcmService fcmService;
  AuthRemoteDataSourceImpl(this.dioClient);

  /// The function `autoLogin` sends a POST request to the `autoLogin` endpoint with login parameters
  /// and returns an ApiResponse containing an AppUser object.
  ///
  /// Args:
  ///   params (LoginParams): The `autoLogin` method takes a `LoginParams` object as a parameter. This
  /// object likely contains the necessary information for the auto-login process, such as username and
  /// password. The `toJson()` method is likely used to convert the `LoginParams` object into a JSON
  /// format that can be sent
  ///
  /// Returns:
  ///   A `Future` of type `ApiResponse<AppUser>` is being returned.
  @override
  Future<ApiResponse<User>> autoLogin(String token) async {
    return dioClient.request<User>(
      method: RequestMethod.get,
      EndPoints.autoLogin,
      options: token.toAuthorizationOptions(),
      fromJson: (json) => User.fromJson(json as Map<String, dynamic>),
    );
  }

  /// The function `login` sends a POST request to the login endpoint with the provided parameters and
  /// returns an ApiResponse containing an AuthModel.
  ///
  /// Args:
  ///   params (LoginParams): The `params` parameter is an instance of the `LoginParams` class, which
  /// contains the username and password of the user trying to log in.
  ///
  /// Returns:
  ///   The `login` method is returning a `Future` that resolves to an `ApiResponse` containing an
  /// `AuthModel` object.
  @override
  Future<ApiResponse<AuthModel>> login(LoginParams params) async {
    // final deviceToken = await fcmService.getDeviceToken();

    return dioClient.request<AuthModel>(
      method: RequestMethod.post,
      EndPoints.login,
      data: params.toJson(),
      fromJson: (json) => AuthModel.fromJson(json as Map<String, dynamic>),
      onSuccess: () {
        // fcmService.subscribeToTopic(Constants.allTopic);
      },
    );
  }
}
