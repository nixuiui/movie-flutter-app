// To parse this JSON data, do
//
//     final provinceModelResponse = provinceModelResponseFromJson(jsonString);

import 'dart:convert';

ProvinceModelResponse provinceModelResponseFromJson(String str) => ProvinceModelResponse.fromJson(json.decode(str));

String provinceModelResponseToJson(ProvinceModelResponse data) => json.encode(data.toJson());

class ProvinceModelResponse {
    ProvinceModelResponse({
        this.code,
        this.message,
        this.data,
        this.stack,
    });

    final int? code;
    final String? message;
    final List<Province>? data;
    final String? stack;

    factory ProvinceModelResponse.fromJson(Map<String, dynamic> json) => ProvinceModelResponse(
        code: json["code"],
        message: json["message"],
        data: List<Province>.from(json["data"].map((x) => Province.fromJson(x))),
        stack: json["stack"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from((data ?? []).map((x) => x.toJson())),
        "stack": stack,
    };
}

class Province {
    Province({
        this.isSupportKirimant,
        this.id,
        this.provinceId,
        this.provinceName,
    });

    final bool? isSupportKirimant;
    final String? id;
    final int? provinceId;
    final String? provinceName;

    factory Province.fromJson(Map<String, dynamic> json) => Province(
        isSupportKirimant: json["isSupportKirimant"],
        id: json["_id"],
        provinceId: json["provinceId"],
        provinceName: json["provinceName"],
    );

    Map<String, dynamic> toJson() => {
        "isSupportKirimant": isSupportKirimant,
        "_id": id,
        "provinceId": provinceId,
        "provinceName": provinceName,
    };
}
