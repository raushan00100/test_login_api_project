// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  bool? status;
  String? message;
  Data? data;

  SignUpModel({this.status, this.message, this.data});

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String? firstName;
  String? lastName;
  String? email;
  String? number;
  String? gender;
  String? address;
  String? agentId;
  String? referralCode;
  String? otherReferralCode;
  String? fcmToken;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? userId;

  Data({
    this.firstName,
    this.lastName,
    this.email,
    this.number,
    this.gender,
    this.address,
    this.agentId,
    this.referralCode,
    this.otherReferralCode,
    this.fcmToken,
    this.updatedAt,
    this.createdAt,
    this.userId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    number: json["number"],
    gender: json["gender"],
    address: json["address"],
    agentId: json["agent_id"],
    referralCode: json["referral_code"],
    otherReferralCode: json["other_referral_code"],
    fcmToken: json["fcm_token"],
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "number": number,
    "gender": gender,
    "address": address,
    "agent_id": agentId,
    "referral_code": referralCode,
    "other_referral_code": otherReferralCode,
    "fcm_token": fcmToken,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "user_id": userId,
  };
}
