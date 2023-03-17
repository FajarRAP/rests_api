class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinates coordinates;
  final LocationTimezone timezone;
  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.street,
    required this.coordinates,
    required this.timezone,
  });

  factory UserLocation.fromMap(Map<String, dynamic> e) {
    return UserLocation(
      city: e["city"],
      state: e["state"],
      country: e["country"],
      postcode: e["postcode"].toString(),
      street: LocationStreet.fromMap(e["street"]),
      coordinates: LocationCoordinates.fromMap(e["coordinates"]),
      timezone: LocationTimezone.fromMap(e["timezone"]),
    );
  }
}

class LocationStreet {
  final String number;
  final String name;

  LocationStreet({
    required this.number,
    required this.name,
  });

  factory LocationStreet.fromMap(Map<String, dynamic> e) {
    return LocationStreet(
      number: e["number"].toString(),
      name: e["name"],
    );
  }
}

class LocationCoordinates {
  final String latitude;
  final String longitude;

  LocationCoordinates({
    required this.latitude,
    required this.longitude,
  });

  factory LocationCoordinates.fromMap(Map<String, dynamic> e) {
    return LocationCoordinates(
      latitude: e["latitude"],
      longitude: e["longitude"],
    );
  }
}

class LocationTimezone {
  final String offset;
  final String description;

  LocationTimezone({
    required this.offset,
    required this.description,
  });

  factory LocationTimezone.fromMap(Map<String, dynamic> e) {
    return LocationTimezone(
      offset: e["offset"],
      description: e["description"],
    );
  }
}
