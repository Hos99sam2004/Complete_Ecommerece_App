import 'package:complete_e_commerce_app/Presentation/Helper/ApiConst.dart';
import 'package:dio/dio.dart';

class ApiHelper {
  ApiHelper._();
  static ApiHelper instance = ApiHelper._();
  static final Dio _dio = Dio(
    BaseOptions(baseUrl: ApiConst.BASE_URL, headers: {
      "lang": "ar",
      "Content-Type": "application/json",
      // "Authorization": ApiConst.Access_TOKEN,
    }),
  );
  Future<Response> post({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? Quiryparams,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post(
        url,
        queryParameters: Quiryparams,
        data: body,
        options: Options(
          headers: headers,
        ),
      );
      return response;
    } on DioException catch (e) {
      throw e;
    }
  }

  Future<Response> get({
    required String url,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get(
        url,
        options: Options(
          headers: headers,
        ),
      );
      return response;
    } on DioException catch (e) {
      throw e;
    }
  }
}
