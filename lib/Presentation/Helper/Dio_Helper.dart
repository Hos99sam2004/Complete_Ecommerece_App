import 'package:complete_e_commerce_app/Presentation/Helper/ApiConst.dart';
import 'package:dio/dio.dart';

class ApiHelper {
  ApiHelper._();
  static ApiHelper instance = ApiHelper._();
  static final Dio _dio = Dio(
    BaseOptions(baseUrl: ApiConst.BASE_URL, headers: {
      "lang": "en",
      "Content-Type": "application/json",
    }),
  );
  Future<Response> post({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? Quiryparams,
  }) async {
    try {
      final response =
          await _dio.post(url, queryParameters: Quiryparams, data: body);
      return response;
    } on DioException catch (e) {
      throw e;
    }
  }

  Future<Response> get(String url) async {
    try {
      final response = await _dio.get(url);
      return response;
    } on DioException catch (e) {
      throw e;
    }
  }
}
