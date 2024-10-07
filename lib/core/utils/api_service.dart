import 'package:bookly/core/utils/constants.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String _baseUrl = booksBaseUrl;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get(
      {required String endPoint, Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.get(_baseUrl + endPoint, queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to fetch data from API');
      }
    } on DioException catch (error) {
      throw Exception('Failed to fetch data from API: ${error.message}');
    }
  }
}
