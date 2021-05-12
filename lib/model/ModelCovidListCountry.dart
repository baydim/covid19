// To parse this JSON data, do
//
//     final modelCovidListCountry = modelCovidListCountryFromMap(jsonString);

import 'dart:convert';

ModelCovidListCountry modelCovidListCountryFromMap(String str) => ModelCovidListCountry.fromMap(json.decode(str));

String modelCovidListCountryToMap(ModelCovidListCountry data) => json.encode(data.toMap());

class ModelCovidListCountry {
    ModelCovidListCountry({
        this.countries,
    });

    List<Country> countries;

    factory ModelCovidListCountry.fromMap(Map<String, dynamic> json) => ModelCovidListCountry(
        countries: List<Country>.from(json["countries"].map((x) => Country.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "countries": List<dynamic>.from(countries.map((x) => x.toMap())),
    };
}

class Country {
    Country({
        this.name,
        this.iso2,
        this.iso3,
    });

    String name;
    String iso2;
    String iso3;

    factory Country.fromMap(Map<String, dynamic> json) => Country(
        name: json["name"] == null ? null : json["name"],
        iso2: json["iso2"] == null ? null : json["iso2"],
        iso3: json["iso3"] == null ? null : json["iso3"],
    );

    Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "iso2": iso2 == null ? null : iso2,
        "iso3": iso3 == null ? null : iso3,
    };
}
