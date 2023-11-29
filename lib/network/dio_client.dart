import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:qg_stock_take_app/network/interceptors/token_interceptor.dart';

import 'dio_exceptions.dart';

class DioClient {
  static final DioClient _instance = DioClient.internal();

  factory DioClient() => _instance;

  static late Dio _dio;

  DioClient.internal();

  Future<void> initDioClient() async {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'http://206.189.112.216:3024/',
      ),
    );

    final tokenInterceptor = TokenInterceptor();
    tokenInterceptor.setDioInstance(_dio);

    _dio.interceptors.addAll([
      AwesomeDioInterceptor(),
      tokenInterceptor,
    ]);
  }

  // get endpoint
  Future get(String endpoint,
      [Map<String, dynamic>? queryParameters, String token = '']) async {
    Response response;

    try {
      response = await _dio.get(endpoint, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw (errorMessage);
    }
  }

  // post endpoint
  Future post(String endpoint, [Map<String, dynamic>? body]) async {
    Response response;

    try {
      response = await _dio.post(endpoint, data: body);

      return response.data;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw (errorMessage);
    }
  }

  // patch endpoint
  Future<void> patch(String endpoint, [Map<String, dynamic>? body]) async {
    try {
      await _dio.patch(endpoint, data: body);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw (errorMessage);
    }
  }
}
