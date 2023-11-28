import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:qg_stock_take_app/models/login_model.dart';
import 'package:qg_stock_take_app/offline/prefs_manager.dart';

class TokenInterceptor extends Interceptor {
  Dio? _dio;

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = PrefsManager().getToken();

    // Add the access token to the request header
    options.headers['Authorization'] = 'Bearer $token';
    return handler.next(options);
  }

  @override
  FutureOr<dynamic> onResponse(options, handler) async {
    return handler.next(options);
  }

  @override
  Future onError(err, handler) async {
    if (err.response?.statusCode == 401 ||
        err.response?.data['message'] == "JWT expired") {
      // If a 401 response is received, refresh the access token
      try {
        await refreshToken();
      } catch (_) {
        return handler.next(err);
      }

      // get new access token
      String newAccessToken = PrefsManager().getToken();

      // Repeat the request with the updated header
      // Update the request header with the new access token
      err.requestOptions.headers['Authorization'] = "Bearer $newAccessToken";
      return handler.resolve(await _retry(err.requestOptions));
    }
    return handler.next(err);
  }

  void setDioInstance(Dio dio) {
    _dio = dio;
  }

  Future<void> refreshToken() async {
    final phone = PrefsManager().getPhone();
    final code = PrefsManager().getStationCode();

    // final response = await _dio.post('/rpc/generatetoken',
    try {
      // final response =
      //     await generateToken(_dio, LoginModel(phoneNumber: phone, code: code));
      final response =
          await Dio(BaseOptions(baseUrl: _dio!.options.baseUrl)).post(
        '/rpc/generatetoken',
        options: Options(
            headers: {HttpHeaders.contentTypeHeader: 'application/json'}),
        data: LoginModel(phone: phone, code: code).toJson(),
      );

      // Update the access token
      PrefsManager().setToken(response.data[0]['token']);
    } on DioException {
      PrefsManager().clearPrefs();
      rethrow;
    }
  }

  Future _retry(RequestOptions requestOptions) async {
    final options =
        Options(method: requestOptions.method, headers: requestOptions.headers);

    return _dio!.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
