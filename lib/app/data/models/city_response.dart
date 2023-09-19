// To parse this JSON data, do
//
//     final cityResponse = cityResponseFromJson(jsonString);

import 'dart:convert';

CityResponse cityResponseFromJson(String str) =>
    CityResponse.fromJson(json.decode(str));

class CityResponse {
  bool? status;
  List<GymCity>? gymCity;

  CityResponse({
    this.status,
    this.gymCity,
  });

  factory CityResponse.fromJson(Map<String, dynamic> json) => CityResponse(
        status: json["status"],
        gymCity: json["data"] == null
            ? []
            : List<GymCity>.from(json["data"].map((x) => GymCity.fromJson(x))),
      );
}

class GymCity {
  String? id;
  String? uid;
  String? city;
  String? dateAdded;
  String? status;
  List<PopularLocation>? popularLocations;
  String? image;
  String? lastUpdated;

  GymCity({
    this.id,
    this.uid,
    this.city,
    this.dateAdded,
    this.status,
    this.popularLocations,
    this.image,
    this.lastUpdated,
  });

  factory GymCity.fromJson(Map<String, dynamic> json) => GymCity(
        id: json["id"],
        uid: json["uid"],
        city: json["city"],
        dateAdded: json["date_added"],
        status: json["status"],
        popularLocations: json["popular_locations"] == null
            ? []
            : List<PopularLocation>.from(json["popular_locations"]
                .map((x) => PopularLocation.fromJson(x))),
        image: json["image"],
        lastUpdated: json["last_updated"],
      );
}

class PopularLocation {
  String? location;
  String? address2;
  String? pin;
  String? country;

  PopularLocation({
    this.location,
    this.address2,
    this.pin,
    this.country,
  });

  factory PopularLocation.fromJson(Map<String, dynamic> json) =>
      PopularLocation(
        location: json["location"],
        address2: json["address2"],
        pin: json["pin"],
        country: json["country"],
      );
}
