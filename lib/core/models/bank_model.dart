import 'dart:convert';

BankResponse bankResponseFromJson(String str) => BankResponse.fromJson(json.decode(str));

String bankResponseToJson(BankResponse data) => json.encode(data.toJson());

class BankResponse {
    BankResponse({
        this.code,
        this.message,
        this.data,
        this.stack,
    });

    final int? code;
    final String? message;
    final List<Bank>? data;
    final String? stack;

    factory BankResponse.fromJson(Map<String, dynamic> json) => BankResponse(
        code: json["code"],
        message: json["message"],
        data: List<Bank>.from(json["data"].map((x) => Bank.fromJson(x))),
        stack: json["stack"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from((data ?? []).map((x) => x.toJson())),
        "stack": stack,
    };
}

class Bank {
    Bank({
        this.code,
        this.bankCode,
        this.name,
        this.id,
    });

    final String? code;
    final String? bankCode;
    final String? name;
    final String? id;

    factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        code: json["code"],
        bankCode: json["bankCode"],
        name: json["name"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "bankCode": bankCode,
        "name": name,
        "id": id,
    };
}
