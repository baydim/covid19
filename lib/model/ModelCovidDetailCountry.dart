// To parse this JSON data, do
//
//     final modelCovidDetailCountry = modelCovidDetailCountryFromMap(jsonString);

import 'dart:convert';

ModelCovidDetailCountry modelCovidDetailCountryFromMap(String str) =>
    ModelCovidDetailCountry.fromMap(json.decode(str));

String modelCovidDetailCountryToMap(ModelCovidDetailCountry data) =>
    json.encode(data.toMap());

class ModelCovidDetailCountry {
  ModelCovidDetailCountry({
    this.confirmed,
    this.recovered,
    this.deaths,
    this.lastUpdate,
  });

  Confirmed confirmed;
  Confirmed recovered;
  Confirmed deaths;
  DateTime lastUpdate;

  factory ModelCovidDetailCountry.fromMap(Map<String, dynamic> json) =>
      ModelCovidDetailCountry(
        confirmed: Confirmed.fromMap(json["confirmed"]),
        recovered: Confirmed.fromMap(json["recovered"]),
        deaths: Confirmed.fromMap(json["deaths"]),
        lastUpdate: DateTime.parse(json["lastUpdate"]),
      );

  Map<String, dynamic> toMap() => {
        "confirmed": confirmed.toMap(),
        "recovered": recovered.toMap(),
        "deaths": deaths.toMap(),
        "lastUpdate": lastUpdate == null ? null : lastUpdate.toIso8601String(),
      };
}

class Confirmed {
  Confirmed({
    this.value,
    this.detail,
  });

  int value;
  String detail;

  factory Confirmed.fromMap(Map<String, dynamic> json) => Confirmed(
        value: json["value"] == null ? null : json["value"],
        detail: json["detail"] == null ? null : json["detail"],
      );

  Map<String, dynamic> toMap() => {
        "value": value == null ? null : value,
        "detail": detail == null ? null : detail,
      };
}
