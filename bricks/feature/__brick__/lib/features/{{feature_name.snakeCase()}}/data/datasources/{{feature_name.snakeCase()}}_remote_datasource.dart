import 'package:dartz/dartz.dart';
import 'package:{{project_name.snakeCase()}}/core/api/dio_client.dart';
import 'package:{{project_name.snakeCase()}}/core/api/end_points.dart';
import 'package:{{project_name.snakeCase()}}/core/api/response/response.dart';
import 'package:{{project_name.snakeCase()}}/core/errors/app_error.dart';
{{#has_models}}
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/data/models/{{feature_name.snakeCase()}}_model.dart';
{{/has_models}}
{{#has_params}}
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/data/models/params/{{feature_name.snakeCase()}}_params.dart';
{{/has_params}}

/// Abstract class defining the contract for {{feature_name.pascalCase()}} remote data operations
/// 
/// This class defines all the remote API operations for the {{feature_name.pascalCase()}} feature.
/// It follows the Repository pattern and provides a clean interface for data access.
abstract class {{feature_name.pascalCase()}}RemoteDataSource {
{{#crud_operations}}
  {{#equals this "read"}}
  /// Fetches a list of {{feature_name.snakeCase()}} items
  /// 
  /// Returns [ApiResponse<List<{{feature_name.pascalCase()}}Model>>] containing the fetched items
  /// or an error response if the request fails.
  {{#has_pagination}}
  Future<ApiResponse<List<{{feature_name.pascalCase()}}Model>>> get{{feature_name.pascalCase()}}List({
    int page = 1,
    int limit = 20,
    {{#has_search}}String? searchQuery,{{/has_search}}
  });
  {{/has_pagination}}
  {{^has_pagination}}
  Future<ApiResponse<List<{{feature_name.pascalCase()}}Model>>> get{{feature_name.pascalCase()}}List({{#has_search}}{String? searchQuery}{{/has_search}});
  {{/has_pagination}}
  
  /// Fetches a single {{feature_name.snakeCase()}} item by ID
  /// 
  /// Args:
  ///   id: The unique identifier of the {{feature_name.snakeCase()}} item
  /// 
  /// Returns [ApiResponse<{{feature_name.pascalCase()}}Model>] containing the fetched item
  /// or an error response if the request fails.
  Future<ApiResponse<{{feature_name.pascalCase()}}Model>> get{{feature_name.pascalCase()}}ById(String id);
  {{/equals}}
  
  {{#equals this "create"}}
  /// Creates a new {{feature_name.snakeCase()}} item
  /// 
  /// Args:
  ///   params: The parameters required to create a new {{feature_name.snakeCase()}} item
  /// 
  /// Returns [ApiResponse<{{feature_name.pascalCase()}}Model>] containing the created item
  /// or an error response if the creation fails.
  Future<ApiResponse<{{feature_name.pascalCase()}}Model>> create{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}Params params);
  {{/equals}}
  
  {{#equals this "update"}}
  /// Updates an existing {{feature_name.snakeCase()}} item
  /// 
  /// Args:
  ///   id: The unique identifier of the {{feature_name.snakeCase()}} item to update
  ///   params: The parameters containing the updated values
  /// 
  /// Returns [ApiResponse<{{feature_name.pascalCase()}}Model>] containing the updated item
  /// or an error response if the update fails.
  Future<ApiResponse<{{feature_name.pascalCase()}}Model>> update{{feature_name.pascalCase()}}(String id, {{feature_name.pascalCase()}}Params params);
  {{/equals}}
  
  {{#equals this "delete"}}
  /// Deletes a {{feature_name.snakeCase()}} item
  /// 
  /// Args:
  ///   id: The unique identifier of the {{feature_name.snakeCase()}} item to delete
  /// 
  /// Returns [ApiResponse<void>] indicating success or failure
  Future<ApiResponse<void>> delete{{feature_name.pascalCase()}}(String id);
  {{/equals}}
{{/crud_operations}}
}

/// Implementation of {{feature_name.pascalCase()}}RemoteDataSource
/// 
/// This class implements the actual API calls using DioClient.
/// It handles HTTP requests, response parsing, and error handling.
class {{feature_name.pascalCase()}}RemoteDataSourceImpl implements {{feature_name.pascalCase()}}RemoteDataSource {
  final DioClient _dioClient;

  /// Constructor that injects the DioClient dependency
  {{feature_name.pascalCase()}}RemoteDataSourceImpl(this._dioClient);

{{#crud_operations}}
  {{#equals this "read"}}
  @override
  {{#has_pagination}}
  Future<ApiResponse<List<{{feature_name.pascalCase()}}Model>>> get{{feature_name.pascalCase()}}List({
    int page = 1,
    int limit = 20,
    {{#has_search}}String? searchQuery,{{/has_search}}
  }) async {
    final queryParams = <String, dynamic>{
      'page': page,
      'limit': limit,
      {{#has_search}}
      if (searchQuery != null && searchQuery.isNotEmpty) 'search': searchQuery,
      {{/has_search}}
    };
  {{/has_pagination}}
  {{^has_pagination}}
  Future<ApiResponse<List<{{feature_name.pascalCase()}}Model>>> get{{feature_name.pascalCase()}}List({{#has_search}}{String? searchQuery}{{/has_search}}) async {
    {{#has_search}}
    final queryParams = <String, dynamic>{};
    if (searchQuery != null && searchQuery.isNotEmpty) {
      queryParams['search'] = searchQuery;
    }
    {{/has_search}}
  {{/has_pagination}}

    return _dioClient.request<List<{{feature_name.pascalCase()}}Model>>(
      method: RequestMethod.get,
      EndPoints.{{feature_name.camelCase()}},
      {{#has_pagination}}queryParams: queryParams,{{/has_pagination}}
      {{#has_search}}{{^has_pagination}}queryParams: queryParams.isNotEmpty ? queryParams : null,{{/has_search}}{{/has_pagination}}
      fromJson: (json) {
        if (json is List) {
          return json
              .map((item) => {{feature_name.pascalCase()}}Model.fromJson(item as Map<String, dynamic>))
              .toList();
        }
        // Handle paginated response
        if (json is Map<String, dynamic> && json.containsKey('data')) {
          final List<dynamic> dataList = json['data'] as List<dynamic>;
          return dataList
              .map((item) => {{feature_name.pascalCase()}}Model.fromJson(item as Map<String, dynamic>))
              .toList();
        }
        throw Exception('Invalid response format');
      },
    );
  }

  @override
  Future<ApiResponse<{{feature_name.pascalCase()}}Model>> get{{feature_name.pascalCase()}}ById(String id) async {
    return _dioClient.request<{{feature_name.pascalCase()}}Model>(
      method: RequestMethod.get,
      '${EndPoints.{{feature_name.camelCase()}}}/$id',
      fromJson: (json) => {{feature_name.pascalCase()}}Model.fromJson(json as Map<String, dynamic>),
    );
  }
  {{/equals}}
  
  {{#equals this "create"}}
  @override
  Future<ApiResponse<{{feature_name.pascalCase()}}Model>> create{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}Params params) async {
    return _dioClient.request<{{feature_name.pascalCase()}}Model>(
      method: RequestMethod.post,
      EndPoints.{{feature_name.camelCase()}},
      data: params.toJson(),
      fromJson: (json) => {{feature_name.pascalCase()}}Model.fromJson(json as Map<String, dynamic>),
    );
  }
  {{/equals}}
  
  {{#equals this "update"}}
  @override
  Future<ApiResponse<{{feature_name.pascalCase()}}Model>> update{{feature_name.pascalCase()}}(String id, {{feature_name.pascalCase()}}Params params) async {
    return _dioClient.request<{{feature_name.pascalCase()}}Model>(
      method: RequestMethod.put,
      '${EndPoints.{{feature_name.camelCase()}}}/$id',
      data: params.toJson(),
      fromJson: (json) => {{feature_name.pascalCase()}}Model.fromJson(json as Map<String, dynamic>),
    );
  }
  {{/equals}}
  
  {{#equals this "delete"}}
  @override
  Future<ApiResponse<void>> delete{{feature_name.pascalCase()}}(String id) async {
    return _dioClient.request<void>(
      method: RequestMethod.delete,
      '${EndPoints.{{feature_name.camelCase()}}}/$id',
      fromJson: (_) => null,
    );
  }
  {{/equals}}
{{/crud_operations}}
}
