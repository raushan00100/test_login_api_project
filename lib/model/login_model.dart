// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  bool? status;
  String? message;
  String? accessToken;
  String? tokenType;
  Data? data;

  LoginModel({
    this.status,
    this.message,
    this.accessToken,
    this.tokenType,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    message: json["message"],
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "access_token": accessToken,
    "token_type": tokenType,
    "data": data?.toJson(),
  };
}

class Data {
  int? userId;
  String? address;
  String? agentId;
  String? email;
  String? fcmToken;
  String? firstName;
  String? lastName;
  String? gender;
  int? newUser;
  String? number;
  String? otherReferralCode;
  String? referralCode;
  int? status;
  String? type;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.userId,
    this.address,
    this.agentId,
    this.email,
    this.fcmToken,
    this.firstName,
    this.lastName,
    this.gender,
    this.newUser,
    this.number,
    this.otherReferralCode,
    this.referralCode,
    this.status,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"],
    address: json["address"],
    agentId: json["agent_id"],
    email: json["email"],
    fcmToken: json["fcm_token"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    gender: json["gender"],
    newUser: json["new_user"],
    number: json["number"],
    otherReferralCode: json["other_referral_code"],
    referralCode: json["referral_code"],
    status: json["status"],
    type: json["type"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "address": address,
    "agent_id": agentId,
    "email": email,
    "fcm_token": fcmToken,
    "first_name": firstName,
    "last_name": lastName,
    "gender": gender,
    "new_user": newUser,
    "number": number,
    "other_referral_code": otherReferralCode,
    "referral_code": referralCode,
    "status": status,
    "type": type,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
