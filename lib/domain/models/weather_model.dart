class CurrentWeatherModel {
  final double temperature;
  final double windSpeed;
  final int windDirection;
  final int weatherCode;
  final int isDay;
  final String time;

  const CurrentWeatherModel({
    required this.temperature,
    required this.windSpeed,
    required this.windDirection,
    required this.weatherCode,
    required this.isDay,
    required this.time,
  });

  factory CurrentWeatherModel.fromJson(Map<String, Object?> json) {
    final double temperature = json['temperature'] as double;
    final double windSpeed = json['windspeed'] as double;
    final int windDirection = json['winddirection'] as int;
    final int weatherCode = json['weathercode'] as int;
    final int isDay = json['is_day'] as int;
    final String time = json['time'] as String;

    return CurrentWeatherModel(
      temperature: temperature,
      windSpeed: windSpeed,
      windDirection: windDirection,
      weatherCode: weatherCode,
      isDay: isDay,
      time: time,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'temperature': temperature,
      'windSpeed': windSpeed,
      'windDirection': windDirection,
      'weatherCode': weatherCode,
      'isDay': isDay,
      'time': time,
    };
  }

  @override
  String toString() {
    return 'CurrentWeatherModel{temperature: $temperature, windSpeed: $windSpeed, windDirection: $windDirection, weatherCode: $weatherCode, isDay: $isDay, time: $time}';
  }
}

class WeatherModel {
  final double latitude;
  final double longitude;
  final double generationTimeMs;
  final num utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;
  final CurrentWeatherModel currentWeatherModel;

  const WeatherModel({
    required this.latitude,
    required this.longitude,
    required this.generationTimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentWeatherModel,
  });

  factory WeatherModel.fromJson(Map<String, Object?> json) {
    final double latitude = json['latitude'] as double;
    final double longitude = json['longitude'] as double;
    final double generationTimeMs = json['generationtime_ms'] as double;
    final num utcOffsetSeconds = json['utc_offset_seconds'] as num;
    final String timezone = json['timezone'] as String;
    final String timezoneAbbreviation = json['timezone_abbreviation'] as String;
    final double elevation = json['elevation'] as double;
    final CurrentWeatherModel currentWeatherModel =
        CurrentWeatherModel.fromJson(
      Map<String, Object?>.from(json['current_weather'] as Map),
    );

    return WeatherModel(
      latitude: latitude,
      longitude: longitude,
      generationTimeMs: generationTimeMs,
      utcOffsetSeconds: utcOffsetSeconds,
      timezone: timezone,
      timezoneAbbreviation: timezoneAbbreviation,
      elevation: elevation,
      currentWeatherModel: currentWeatherModel,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'generationtime_ms': generationTimeMs,
      'utc_offset_seconds': utcOffsetSeconds,
      'timezone': timezone,
      'timezone_abbreviation': timezoneAbbreviation,
      'elevation': elevation,
      'currentWeatherModel': currentWeatherModel,
    };
  }

  @override
  String toString() {
    return 'WeatherModel{latitude: $latitude, longitude: $longitude, generationTimeMs: $generationTimeMs, utcOffsetSeconds: $utcOffsetSeconds, timezone: $timezone, timezoneAbbreviation: $timezoneAbbreviation, elevation: $elevation, currentWeatherModel: $currentWeatherModel}';
  }
}
