import 'package:crm_app/core/api/dio_client.dart';
import 'package:crm_app/core/api/end_points.dart';
import 'package:crm_app/core/api/response/response.dart';

import 'package:crm_app/features/home/data/models/home_model.dart';


import 'package:crm_app/features/home/data/models/params/home_params.dart';


abstract class HomeRemoteDataSource {
  
  Future<ApiResponse<List<HomeModel>>> getHomes();
  Future<ApiResponse<HomeModel>> getHomeById(String id);
  
  Future<ApiResponse<HomeModel>> createHome(HomeParams params);
  Future<ApiResponse<HomeModel>> updateHome(String id, HomeParams params);
  
  Future<ApiResponse<void>> deleteHome(String id);
  
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final DioClient dioClient;

  HomeRemoteDataSourceImpl(this.dioClient);

  
  @override
  Future<ApiResponse<List<HomeModel>>> getHomes() async {
    return dioClient.request<List<HomeModel>>(
      method: RequestMethod.get,
      EndPoints.home,
      fromJson: (json) => (json as List)
          .map((item) => HomeModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  Future<ApiResponse<HomeModel>> getHomeById(String id) async {
    return dioClient.request<HomeModel>(
      method: RequestMethod.get,
      '${EndPoints.home}/$id',
      fromJson: (json) => HomeModel.fromJson(json as Map<String, dynamic>),
    );
  }

  
  @override
  Future<ApiResponse<HomeModel>> createHome(HomeParams params) async {
    return dioClient.request<HomeModel>(
      method: RequestMethod.post,
      EndPoints.home,
      data: params.toJson(),
      fromJson: (json) => HomeModel.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<ApiResponse<HomeModel>> updateHome(String id, HomeParams params) async {
    return dioClient.request<HomeModel>(
      method: RequestMethod.put,
      '${EndPoints.home}/$id',
      data: params.toJson(),
      fromJson: (json) => HomeModel.fromJson(json as Map<String, dynamic>),
    );
  }
  

  @override
  Future<ApiResponse<void>> deleteHome(String id) async {
    return dioClient.request<void>(
      method: RequestMethod.delete,
      '${EndPoints.home}/$id',
      fromJson: (json) => null,
    );
  }
  
}
