import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/core/service_locator.dart';
import 'package:weather_app/domain/models/location_model.dart';
import 'package:weather_app/domain/models/weather_model.dart';

part 'temperature_event.dart';
part 'temperature_state.dart';

class TemperatureBloc extends Bloc<TemperatureEvent, TemperatureState> {
  TemperatureBloc()
      : super(
          TemperatureInitialState(
            weatherModel: WeatherModel(
              latitude: 41.25,
              longitude: 69.25,
              generationTimeMs: 0.0,
              utcOffsetSeconds: 0,
              timezone: 'GMT',
              timezoneAbbreviation: 'GMT',
              elevation: 426.0,
              currentWeatherModel: CurrentWeatherModel(
                temperature: 14.0,
                windSpeed: 4.5,
                windDirection: 104,
                weatherCode: 0,
                isDay: 0,
                time: DateTime.now().toIso8601String(),
              ),
            ),
          ),
        ) {
    on<FetchWeatherEvent>(_onFetchWeather);
    on<UpdateMapEvent>(_updateWeather)
    ;
  }

  Future<void> _onFetchWeather(FetchWeatherEvent event, Emitter emit) async {
    emit(TemperatureLoadingState(weatherModel: state.weatherModel));

    final LocationModel locationModel = await locationRepository
        .fetchLocationOfCity(countryName: event.countryName);

    final WeatherModel weatherModel =
        await weatherRepository.fetchWeatherOfCity(
      latitude: locationModel.latitude,
      longitude: locationModel.longitude,
    );

    emit(
      FetchWeatherSuccessState(
        weatherModel: weatherModel,
        locationModel: locationModel,
      ),
    );
  }
  Future<void> _updateWeather(UpdateMapEvent event, Emitter emit) async {
    emit(TemperatureLoadingState(weatherModel: state.weatherModel));

    final LocationModel locationModel = await locationRepository
        .fetchLocationOfCity(countryName: event.countryName);

    final WeatherModel weatherModel =
    await weatherRepository.fetchWeatherOfCity(
      latitude: locationModel.latitude,
      longitude: locationModel.longitude,
    );

    emit(
      FetchWeatherSuccessState(
        weatherModel: weatherModel,
        locationModel: locationModel,
      ),
    );
  }
}
