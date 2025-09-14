import '../../../../core/api/dio_client.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/api/response/response.dart';
import '../../../../core/extensions/token_to_authorization_options.dart';
import '../models/params/home_params.dart';
import '../models/responses/home_model.dart';

abstract class HomeRemoteDataSource {
  Future<ApiResponse<HomeModel>> getHome(HomeParams params);
  Future<ApiResponse<void>> createHome(HomeParams params);
  Future<ApiResponse<void>> updateHome(HomeParams params);
  Future<ApiResponse<void>> deleteHome(String id);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final DioClient dioClient;

  HomeRemoteDataSourceImpl(this.dioClient);

  @override
  Future<ApiResponse<HomeModel>> getHome(HomeParams params) async {
    return dioClient.request<HomeModel>(
      method: RequestMethod.get,
      EndPoints.home,
      queryParams: params.toJson(),
      fromJson: (json) => HomeModel.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<ApiResponse<void>> createHome(HomeParams params) async {
    return dioClient.request<void>(
      method: RequestMethod.post,
      EndPoints.home,
      data: params.toJson(),
      fromJson: (json) => (),
    );
  }

  @override
  Future<ApiResponse<void>> updateHome(HomeParams params) async {
    return dioClient.request<void>(
      method: RequestMethod.put,
      EndPoints.home,
      data: params.toJson(),
      fromJson: (json) => (),
    );
  }

  @override
  Future<ApiResponse<void>> deleteHome(String id) async {
    return dioClient.request<void>(
      method: RequestMethod.delete,
      '${EndPoints.home}/$id',
      fromJson: (json) => (),
    );
  }
}
