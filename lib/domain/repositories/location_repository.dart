import 'dart:convert';

import 'package:weather_app/data/network_service.dart';
import 'package:weather_app/domain/models/location_model.dart';

abstract class LocationRepository {
  Future<LocationModel> fetchLocationOfCity({required String countryName});
}

class LocationRepositoryImplementation extends LocationRepository {
  final Network network;

  LocationRepositoryImplementation({required this.network});

  @override
  Future<LocationModel> fetchLocationOfCity({
    required String countryName,
  }) async {
    String response =
        await network.locationSearch(countryName: countryName) ?? '{}';

    final Map<dynamic, dynamic> json = jsonDecode(response);
    final Map<dynamic, dynamic> data = json['results'][0];

    return LocationModel.fromJson(Map<String, Object?>.from(data));
  }
}
