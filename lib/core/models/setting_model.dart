import 'dart:convert';

List<SettingModel> settingModelFromJson(String str) => List<SettingModel>.from(json.decode(str).map((x) => SettingModel.fromJson(x)));

String settingModelToJson(List<SettingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SettingModel {
    SettingModel({
        this.settingName,
        this.data,
    });

    final String? settingName;
    final dynamic data;

    factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
        settingName: json["settingName"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "settingName": settingName,
        "data": data,
    };
}

class AppVersionModel {
    AppVersionModel({
        this.androidVersion,
        this.androidVersionCode,
        this.androidMinimumVersion,
        this.playstore,
        this.iosVersion,
        this.iosVersionCode,
        this.iosMinimumVersion,
        this.appstore,
    });

    final String? androidVersion;
    final int? androidVersionCode;
    final int? androidMinimumVersion;
    final String? playstore;
    final String? iosVersion;
    final int? iosVersionCode;
    final int? iosMinimumVersion;
    final String? appstore;

    factory AppVersionModel.fromJson(Map<String, dynamic> json) => AppVersionModel(
        androidVersion: json["androidVersion"],
        androidVersionCode: json["androidVersionCode"],
        androidMinimumVersion: json["androidMinimumVersion"],
        playstore: json["playstore"],
        iosVersion: json["iosVersion"],
        iosVersionCode: json["iosVersionCode"],
        iosMinimumVersion: json["iosMinimumVersion"],
        appstore: json["appstore"],
    );

    Map<String, dynamic> toJson() => {
        "androidVersion": androidVersion,
        "androidVersionCode": androidVersionCode,
        "androidMinimumVersion": androidMinimumVersion,
        "playstore": playstore,
        "iosVersion": iosVersion,
        "iosVersionCode": iosVersionCode,
        "iosMinimumVersion": iosMinimumVersion,
        "appstore": appstore,
    };
}
