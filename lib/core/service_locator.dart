import 'package:weather_app/data/network_service.dart';
import 'package:weather_app/domain/repositories/location_repository.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

late final LocationRepository locationRepository;
late final WeatherRepository weatherRepository;

void serviceLocator() {
  locationRepository = LocationRepositoryImplementation(
    network: HttpNetwork(),
  );

  weatherRepository = WeatherRepositoryImplementation(
    network: HttpNetwork(),
  );
}
