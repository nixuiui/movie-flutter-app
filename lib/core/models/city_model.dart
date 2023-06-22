import 'dart:convert';

CityResponse cityResponseFromJson(String str) => CityResponse.fromJson(json.decode(str));

String cityResponseToJson(CityResponse data) => json.encode(data.toJson());

class CityResponse {
    CityResponse({
        this.code,
        this.message,
        this.data,
        this.stack,
    });

    final int? code;
    final String? message;
    final List<City>? data;
    final String? stack;

    factory CityResponse.fromJson(Map<String, dynamic> json) => CityResponse(
        code: json["code"],
        message: json["message"],
        data: List<City>.from(json["data"].map((x) => City.fromJson(x))),
        stack: json["stack"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from((data ?? []).map((x) => x.toJson())),
        "stack": stack,
    };
}

class City {
    City({
        this.type,
        this.postalCode,
        this.id,
        this.cityId,
        this.provinceId,
        this.provinceName,
        this.cityName,
    });

    final Type? type;
    final String? postalCode;
    final String? id;
    final int? cityId;
    final int? provinceId;
    final String? provinceName;
    final String? cityName;

    factory City.fromJson(Map<String, dynamic> json) => City(
        type: json["type"],
        postalCode: json["postalCode"],
        id: json["_id"],
        cityId: json["cityId"],
        provinceId: json["provinceId"],
        provinceName: json["provinceName"],
        cityName: json["cityName"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "postalCode": postalCode,
        "_id": id,
        "cityId": cityId,
        "provinceId": provinceId,
        "provinceName": provinceName,
        "cityName": cityName,
    };
}