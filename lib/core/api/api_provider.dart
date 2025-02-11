import 'dart:io';
import 'package:chopper/chopper.dart';
import 'package:http/io_client.dart' as http;
import 'package:soqqa_app/widget_imports.dart';

class ApiProvider {
  static late ChopperClient _client;
  // static late AuthService authService;

  ///Services
  static create({String? token, int? institutionID, String? language}) {
    _client = ChopperClient(
      client: http.IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 40),
      ),
      services: [
        // AuthService.create(),
      ],
      interceptors: getInterceptors(
        token: token,
        institutionID: institutionID,
        language: language,
      ),
      converter: CustomDataConverter(),
    );

    // authService = _client.getService<AuthService>();
  }

  static List getInterceptors({
    String? token,
    int? institutionID,
    String? language,
  }) {
    List interceptors = [];

    interceptors.add(HttpLoggingInterceptor());

    interceptors.add(
      HeadersInterceptor(
        {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: token != null ? 'Bearer $token' : '',
        },
      ),
    );

    return interceptors;
  }

  static dispose() {
    _client.dispose();
  }
}
