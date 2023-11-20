part of 'temperature_bloc.dart';

@immutable
abstract class TemperatureEvent {
  const TemperatureEvent();
}

class FetchWeatherEvent extends TemperatureEvent {
  final String countryName;

  const FetchWeatherEvent({required this.countryName});
}
class UpdateMapEvent extends TemperatureEvent {
  final String countryName;
  const UpdateMapEvent({required this.countryName});
}
