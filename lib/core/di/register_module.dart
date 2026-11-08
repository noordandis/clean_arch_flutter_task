import 'package:clean_arch_flutter_task/core/network/api_endpoint.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: ApiEndpoint.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        'Content-Type': 'Application/json',
        'Accept': 'Application/json',
      },
    ),
  )..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
}
