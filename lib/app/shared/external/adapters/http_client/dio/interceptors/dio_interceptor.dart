import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../../domain/usecases/get_token_usecase.dart';
import '../../../erros.dart';

class CustomInterceptors extends InterceptorsWrapper {
  CustomInterceptors(this._getTokenUsecase);

  final GetTokenUsecase _getTokenUsecase;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final response = await _getTokenUsecase.fetch();
    response.fold((l) {}, (token) {
      options.headers.addAll({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
    });
    if (options.data != null) {
      debugPrint("Payload ${json.encode(options.data)}");
    }

    handler.next(options);
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    HttpClientError failure;
    if (err.response?.statusCode == 401) {
      failure = HttpClientError(
          message: 'Falha ao realizar requisição.',
          requestOptions: err.requestOptions,
          statusCode: err.response?.statusCode,
          stackTrace: err.stackTrace,
          type: err.type,
          data: err.requestOptions.data,
          error: err,
          response: err.response);
    } else {
      failure = HttpClientError(
          requestOptions: err.requestOptions,
          statusCode: err.response?.statusCode,
          stackTrace: err.stackTrace,
          type: err.type,
          data: err.requestOptions.data,
          error: err,
          response: err.response,
          message: 'Ocorreu um erro na requisição com o servidor');
    }

    handler.next(failure);
  }
}
