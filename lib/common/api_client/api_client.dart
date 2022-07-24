import 'package:dio/dio.dart';
import 'package:even/common/api_client/api_constants.dart';
import 'package:even/common/api_client/app_exception.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiClient {
  final Dio dio;

  ApiClient(this.dio) {
    dio.options.baseUrl = ApiConstants.BASE_URL;
  }

  Future<dynamic> get(String url, {Map<String, dynamic> params}) async {
    try {
      Response response;
      response = await dio.get(
        url,
        queryParameters: params,
      );
      final data = response.data;

      return data;
    } on DioError catch (error) {
      throw AppException(
        object: error,
        statusCode: error.response.statusCode,
      );
    } catch (error) {
      throw AppException(
        object: error,
      );
    }
  }

  Future<dynamic> post(String url, Map<String, dynamic> body) async {
    try {
      Response response;
      response = await dio.post(url, data: body);
      final data = response.data;

      return data;
    } on DioError catch (error) {
      throw AppException(
        object: error,
        statusCode: error.response.statusCode,
      );
    } catch (error) {
      throw AppException(
        object: error,
      );
    }
  }

  Future<dynamic> put(String url, Map<String, dynamic> body) async {
    try {
      Response response;
      response = await dio.put(url, data: body);
      final data = response.data;

      return data;
    } on DioError catch (error) {
      throw AppException(
        object: error,
        statusCode: error.response.statusCode,
      );
    } catch (error) {
      throw AppException(
        object: error,
      );
    }
  }
}
