part of 'temperature_bloc.dart';

@immutable
abstract class TemperatureState {
  final WeatherModel weatherModel;

  const TemperatureState({required this.weatherModel});
}

class TemperatureInitialState extends TemperatureState {
  const TemperatureInitialState({required super.weatherModel});
}

class TemperatureLoadingState extends TemperatureState {
  const TemperatureLoadingState({required super.weatherModel});
}

class TemperatureFailureState extends TemperatureState {
  const TemperatureFailureState({required super.weatherModel});
}

class FetchWeatherSuccessState extends TemperatureState {
  final LocationModel locationModel;

  const FetchWeatherSuccessState({
    required super.weatherModel,
    required this.locationModel,
  });
}
class UpdateMapSuccess extends TemperatureState {
  final LocationModel locationModel;

  const UpdateMapSuccess({
    required super.weatherModel,
    required this.locationModel,
  });
}
