// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
    Welcome({
        required this.status,
        required this.customerId,
        required this.message,
    });

    String status;
    int customerId;
    String message;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        status: json["Status"],
        customerId: json["customerId"],
        message: json["Message"],
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
        "customerId": customerId,
        "Message": message,
    };
}
