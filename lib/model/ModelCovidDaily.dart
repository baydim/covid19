// To parse this JSON data, do
//
//     final modelCovidDaily = modelCovidDailyFromMap(jsonString);

import 'dart:convert';

List<ModelCovidDaily> modelCovidDailyFromMap(String str) =>
    List<ModelCovidDaily>.from(
        json.decode(str).map((x) => ModelCovidDaily.fromMap(x)));

String modelCovidDailyToMap(List<ModelCovidDaily> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ModelCovidDaily {
  ModelCovidDaily({
    this.provinceState,
    this.countryRegion,
    this.lastUpdate,
    this.confirmed,
    this.deaths,
    this.recovered,
  });

  String provinceState;
  String countryRegion;
  DateTime lastUpdate;
  String confirmed;
  String deaths;
  String recovered;

  factory ModelCovidDaily.fromMap(Map<String, dynamic> json) => ModelCovidDaily(
        provinceState: json["provinceState"],
        countryRegion: json["countryRegion"],
        lastUpdate: json["lastUpdate"] == null
            ? null
            : DateTime.parse(json["lastUpdate"]),
        confirmed: json["confirmed"],
        deaths: json["deaths"],
        recovered: json["recovered"],
      );

  Map<String, dynamic> toMap() => {
        "provinceState": provinceState,
        "countryRegion": countryRegion,
        "lastUpdate": lastUpdate.toIso8601String(),
        "confirmed": confirmed,
        "deaths": deaths,
        "recovered": recovered,
      };
}
