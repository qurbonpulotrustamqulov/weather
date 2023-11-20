import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/core/apis.dart';

abstract class Network {
  Future<String?> methodGet({
    required String api,
    String baseUrl = Api.baseUrlWeather,
    Object? id,
    Map<String, String> headers = Api.headers,
    Map<String, String>? query,
  });

  Future<void> methodDelete({
    required String api,
    required Object id,
    String baseUrl = Api.baseUrlWeather,
    Map<String, String> headers = Api.headers,
  });

  Future<void> methodPost({
    required String api,
    required Map<String, Object?> data,
    String baseUrl = Api.baseUrlWeather,
    Map<String, String> headers = Api.headers,
  });

  Future<void> methodPut({
    required String api,
    required Object id,
    required Map<String, Object?> data,
    Map<String, String> headers = Api.headers,
    String baseUrl = Api.baseUrlWeather,
  });

  Future<String?> locationSearch({
    required String countryName,
    String api = Api.apiSearch,
    String baseUrl = Api.baseUrlWeather,
  });

  Future<String?> getWeather({
    required double latitude,
    required double longitude,
    String api = Api.apiForecast,
    String baseUrl = Api.baseUrlWeather,
  });
}

class HttpNetwork extends Network {
  @override
  Future<String?> methodGet({
    required String api,
    Object? id,
    Map<String, String> headers = Api.headers,
    String baseUrl = Api.baseUrlWeather,
    Map<String, String>? query,
  }) async {
    // TODO: implement methodGet
    throw UnimplementedError();
  }

  @override
  Future<void> methodPost({
    required String api,
    required Map<String, Object?> data,
    Map<String, String> headers = Api.headers,
    String baseUrl = Api.baseUrlWeather,
  }) async {
    // TODO: implement methodPost
    throw UnimplementedError();
  }

  @override
  Future<void> methodPut({
    required String api,
    required Object id,
    required Map<String, Object?> data,
    Map<String, String> headers = Api.headers,
    String baseUrl = Api.baseUrlWeather,
  }) async {
    // TODO: implement methodPut
    throw UnimplementedError();
  }

  @override
  Future<void> methodDelete({
    required String api,
    required Object id,
    Map<String, String> headers = Api.headers,
    String baseUrl = Api.baseUrlWeather,
  }) {
    // TODO: implement methodDelete
    throw UnimplementedError();
  }

  @override
  Future<String?> locationSearch({
    required String countryName,
    String api = Api.apiSearch,
    String baseUrl = Api.baseUrlGeocoding,
  }) async {
    try {
      final Uri uri =
          Uri.https(baseUrl, api, {'name': countryName, 'count': '1'});

      final http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        debugPrint(response.body);

        return utf8.decoder.convert(response.bodyBytes);
      }

      return null;
    } catch (e) {
      debugPrint('ERROR: $e');

      return null;
    }
  }

  @override
  Future<String?> getWeather({
    required double latitude,
    required double longitude,
    String api = Api.apiForecast,
    String baseUrl = Api.baseUrlWeather,
  }) async {
    try {
      final Uri uri = Uri.https(
        Api.baseUrlWeather,
        Api.apiForecast,
        {
          'latitude': '$latitude',
          'longitude': '$longitude',
          'current_weather': 'true'
        },
      );

      final http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        debugPrint(response.body);

        return utf8.decoder.convert(response.bodyBytes);
      }

      return null;
    } catch (e) {
      debugPrint('ERROR: $e');

      return null;
    }
  }
}
