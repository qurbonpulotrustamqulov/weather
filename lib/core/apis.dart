sealed class Api {
  /// DOMAIN
  static const String baseUrlWeather = 'api.open-meteo.com';
  static const String baseUrlGeocoding = 'geocoding-api.open-meteo.com';

  /// APIS
  static const String apiSearch = '/v1/search';
  static const String apiForecast = '/v1/forecast';

  /// HEADERS
  static const Map<String, String> headers = {
    'content-type': 'application/json',
  };
}
