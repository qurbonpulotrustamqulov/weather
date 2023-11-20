class LocationModel {
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final double elevation;
  final String featureCode;
  final String countryCode;
  final int admin1Id;
  final int? admin2Id;
  final int? admin3Id;
  final String timezone;
  final int population;
  final List<String> postcodes;
  final int countryId;
  final String country;
  final String admin1;
  final String? admin2;
  final String? admin3;

  const LocationModel({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.elevation,
    required this.featureCode,
    required this.countryCode,
    required this.admin1Id,
    required this.admin2Id,
    required this.admin3Id,
    required this.timezone,
    required this.population,
    required this.postcodes,
    required this.countryId,
    required this.country,
    required this.admin1,
    required this.admin2,
    required this.admin3,
  });

  factory LocationModel.fromJson(Map<String, Object?> json) {
    final int id = json['id'] as int;
    final String name = json['name'] as String;
    final double latitude = json['latitude'] as double;
    final double longitude = json['longitude'] as double;
    final double elevation = json['elevation'] as double;
    final String featureCode = json['feature_code'] as String;
    final String countryCode = json['country_code'] as String;
    final int admin1Id = json['admin1_id'] as int;
    final int? admin2Id = json['admin2_id'] as int?;
    final int? admin3Id = json['admin3_id'] as int?;
    final String timezone = json['timezone'] as String;
    final int population = json['population'] as int;
    final List<String> postcodes = List<String>.from(
        (json['postcodes'] != null) ? (json['postcodes'] as List) : []);
    final int countryId = json['country_id'] as int;
    final String country = json['country'] as String;
    final String admin1 = json['admin1'] as String;
    final String? admin2 = json['admin2'] as String?;
    final String? admin3 = json['admin3'] as String?;

    return LocationModel(
      id: id,
      name: name,
      latitude: latitude,
      longitude: longitude,
      elevation: elevation,
      featureCode: featureCode,
      countryCode: countryCode,
      admin1Id: admin1Id,
      admin2Id: admin2Id,
      admin3Id: admin3Id,
      timezone: timezone,
      population: population,
      postcodes: postcodes,
      countryId: countryId,
      country: country,
      admin1: admin1,
      admin2: admin2,
      admin3: admin3,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'elevation': elevation,
      'feature_code': featureCode,
      'country_code': countryCode,
      'admin1_id': admin1Id,
      'admin2_id': admin2Id,
      'admin3_id': admin3Id,
      'timezone': timezone,
      'population': population,
      'postcodes': postcodes,
      'country_id': countryId,
      'country': country,
      'admin1': admin1,
      'admin2': admin2,
      'admin3': admin3,
    };
  }

  @override
  String toString() {
    return 'LocationModel{id: $id, name: $name, latitude: $latitude, longitude: $longitude, elevation: $elevation, featureCode: $featureCode, countryCode: $countryCode, admin1Id: $admin1Id, admin2Id: $admin2Id, admin3Id: $admin3Id, timezone: $timezone, population: $population, postcodes: $postcodes, countryId: $countryId, country: $country, admin1: $admin1, admin2: $admin2, admin3: $admin3}';
  }
}

const json = {
  "id": 4887398,
  "name": "Chicago",
  "latitude": 41.85003,
  "longitude": -87.65005,
  "elevation": 179.0,
  "feature_code": "PPLA2",
  "country_code": "US",
  "admin1_id": 4896861,
  "admin2_id": 4888671,
  "admin3_id": 4887539,
  "timezone": "America/Chicago",
  "population": 2720546,
  "postcodes": [],
  "country_id": 6252001,
  "country": "United States",
  "admin1": "Illinois",
  "admin2": "Cook",
  "admin3": "Chicago"
};
