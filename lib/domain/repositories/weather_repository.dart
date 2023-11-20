import 'dart:convert';

import 'package:weather_app/data/network_service.dart';
import 'package:weather_app/domain/models/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> fetchWeatherOfCity(
      {required double latitude, required double longitude});
}

class WeatherRepositoryImplementation extends WeatherRepository {
  final Network network;

  WeatherRepositoryImplementation({required this.network});

  @override
  Future<WeatherModel> fetchWeatherOfCity({
    required double latitude,
    required double longitude,
  }) async {
    String response =
        await network.getWeather(latitude: latitude, longitude: longitude) ??
            '{}';

    final Map<dynamic, dynamic> json = jsonDecode(response);
    final Map<String, Object?> data = Map<String, Object?>.from(json);

    return WeatherModel.fromJson(data);
  }
}
