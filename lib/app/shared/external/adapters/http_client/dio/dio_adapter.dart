import 'package:dio/dio.dart';
import '../../erros.dart';
import '../http_client_adapter.dart';
import '../http_reponse.dart';

class DioAdapter implements IHttpClientAdapter {
  final Dio dio;
  final List<InterceptorsWrapper> interceptors;

  DioAdapter({
    required this.dio,
    required this.interceptors,
  }) {
    dio.interceptors.addAll(interceptors);
  }

  @override
  Future<HttpResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final result = await dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      final response = HttpResponse(
        data: result.data,
        statusCode: result.statusCode ?? 200,
      );
      return response;
    } on DioError catch (e) {
      throw HttpClientError(
        data: e.response?.data,
        statusCode: e.response?.statusCode ?? 500,
        type: DioErrorType.response,
        message: e.message,
        requestOptions: e.requestOptions,
      );
    }
  }

  @override
  Future<HttpResponse> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final result = await dio.post(
        path,
        queryParameters: queryParameters,
        data: data,
        options: Options(headers: headers),
      );
      HttpResponse response = HttpResponse(
        data: result.data,
        statusCode: result.statusCode ?? 200,
      );
      return response;
    } on DioError catch (e) {
      throw HttpClientError(
        data: e.response?.data,
        statusCode: e.response?.statusCode ?? 500,
        type: DioErrorType.response,
        message: e.message,
        requestOptions: e.requestOptions,
      );
    }
  }

  @override
  Future<HttpResponse> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final result = await dio.put(
        path,
        queryParameters: queryParameters,
        data: data,
        options: Options(headers: headers),
      );
      HttpResponse response = HttpResponse(
        data: result.data,
        statusCode: result.statusCode ?? 200,
      );
      return response;
    } on DioError catch (e) {
      throw HttpClientError(
        data: e.response?.data,
        statusCode: e.response?.statusCode ?? 500,
        type: DioErrorType.response,
        message: e.message,
        requestOptions: e.requestOptions,
      );
    }
  }

  @override
  Future<HttpResponse> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final result = await dio.delete(
        path,
        queryParameters: queryParameters,
        data: data,
        options: Options(headers: headers),
      );
      HttpResponse response = HttpResponse(
        data: result.data,
        statusCode: result.statusCode ?? 200,
      );
      return response;
    } on DioError catch (e) {
      throw HttpClientError(
        data: e.response?.data,
        statusCode: e.response?.statusCode ?? 500,
        type: DioErrorType.response,
        message: e.message,
        requestOptions: e.requestOptions,
      );
    }
  }

  @override
  @override
  Future<HttpResponse> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final result = await dio.patch(
        path,
        queryParameters: queryParameters,
        data: data,
        options: Options(headers: headers),
      );
      HttpResponse response = HttpResponse(
        data: result.data,
        statusCode: result.statusCode ?? 200,
      );
      return response;
    } on DioError catch (e) {
      throw HttpClientError(
        data: e.response?.data,
        statusCode: e.response?.statusCode ?? 500,
        type: DioErrorType.response,
        message: e.message,
        requestOptions: e.requestOptions,
      );
    }
  }
}
