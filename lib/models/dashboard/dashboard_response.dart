// To parse this JSON data, do
//
//     final dashboardResponse = dashboardResponseFromJson(jsonString);

import 'dart:convert';

DashboardResponse dashboardResponseFromJson(String str) => DashboardResponse.fromJson(json.decode(str));

String dashboardResponseToJson(DashboardResponse data) => json.encode(data.toJson());

class DashboardResponse {
  DashboardResponse({
    this.error=false,
    this.errorMessage='',
    this.data,
  });

  bool error;
  String errorMessage;
  DashboardData? data;

  factory DashboardResponse.fromRawJson(String str) =>
      DashboardResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DashboardResponse.fromJson(Map<String, dynamic> json) => DashboardResponse(
    error: json["error"] == null ? null : json["error"],
    errorMessage: json["errorMessage"] == null ? null : json["errorMessage"],
    data: json["data"] == null ? null : DashboardData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error == null ? null : error,
    "errorMessage": errorMessage == null ? null : errorMessage,
    "data": data == null ? null : data?.toJson(),
  };
}


class DashboardData {
  DashboardData({
    this.holdingAgeMan = '',
    this.holdingAgeWoman = '',
    this.totalHolding = 0,
    this.activeHolding = 0,
    this.familyMemberMale = 0,
    this.familyMemberFemale = 0,
    this.numberOfBirthCertificate = 0,
    this.tradeLicenses = 0,
    this.activeTrade = 0,
    this.userInfo,
    this.companyInfo,
  });

  String holdingAgeMan;
  String holdingAgeWoman;
  int totalHolding;
  int activeHolding;
  int familyMemberMale;
  int familyMemberFemale;
  int numberOfBirthCertificate;
  int tradeLicenses;
  int activeTrade;
  UserInfo? userInfo;
  CompanyInfo? companyInfo;


  factory DashboardData.fromRawJson(String str) => DashboardData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DashboardData.fromJson(Map<String, dynamic> json) =>
      DashboardData(
        holdingAgeMan: json["holdingAgeMan"] ?? '',
        holdingAgeWoman: json["holdingAgeWoman"] ?? '',
        totalHolding: json["totalHolding"] ?? 0,
        activeHolding: json["activeHolding"] ?? 0,
        familyMemberMale: json["familyMemberMale"] ?? 0,
        familyMemberFemale: json["familyMemberFemale"] ?? 0,
        numberOfBirthCertificate: json["numberOfBirthCertificate"] ?? 0,
        tradeLicenses: json["tradeLicenses"] ?? 0,
        activeTrade: json["activeTrade"] ?? 0,
        userInfo: json["userInfo"] == null ? null : UserInfo.fromJson(json["userInfo"]),
        companyInfo: json["CompanyInfo"] == null ? null : CompanyInfo.fromJson(json["CompanyInfo"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "holdingAgeMan": holdingAgeMan == null ? null : holdingAgeMan,
        "holdingAgeWoman": holdingAgeWoman == null ? null : holdingAgeWoman,
        "totalHolding": totalHolding == null ? null : totalHolding,
        "activeHolding": activeHolding == null ? null : activeHolding,
        "familyMemberMale": familyMemberMale == null ? null : familyMemberMale,
        "familyMemberFemale": familyMemberFemale == null
            ? null
            : familyMemberFemale,
        "numberOfBirthCertificate": numberOfBirthCertificate == null
            ? null
            : numberOfBirthCertificate,
        "tradeLicenses": tradeLicenses == null ? null : tradeLicenses,
        "activeTrade": activeTrade == null ? null : activeTrade,
        "userInfo": userInfo == null ? null : userInfo?.toJson(),
        "CompanyInfo": companyInfo == null ? null : companyInfo?.toJson(),
      };

}
  class CompanyInfo {
  CompanyInfo({
  this.name='',
  this.address='',
  this.logo='',
  this.subdomain='',
  this.pinCode='',
  this.districtName,
  });

  String name;
  String address;
  String logo;
  String subdomain;
  String pinCode;
  dynamic districtName;

  factory CompanyInfo.fromJson(Map<String, dynamic> json) => CompanyInfo(
  name: json["name"] == null ? null : json["name"],
  address: json["address"] == null ? null : json["address"],
  logo: json["logo"] == null ? null : json["logo"],
  subdomain: json["subdomain"] == null ? null : json["subdomain"],
  pinCode: json["pinCode"] == null ? null : json["pinCode"],
  districtName: json["districtName"],
  );

  Map<String, dynamic> toJson() => {
  "name": name == null ? null : name,
  "address": address == null ? null : address,
  "logo": logo == null ? null : logo,
  "subdomain": subdomain == null ? null : subdomain,
  "pinCode": pinCode == null ? null : pinCode,
  "districtName": districtName,
  };
  }

  class UserInfo {
  UserInfo({
  this.username='',
  this.fullName='',
  this.email='',
  this.phone='',
  });

  String username;
  String fullName;
  String email;
  String phone;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
  username: json["username"] == null ? '' : json["username"],
  fullName: json["full_name"] == null ? '' : json["full_name"],
  email: json["email"] == null ? '': json["email"],
  phone: json["phone"] == null ? '' : json["phone"],
  );

  Map<String, dynamic> toJson() => {
  "username": username == null ? null : username,
  "full_name": fullName == null ? null : fullName,
  "email": email == null ? null : email,
  "phone": phone == null ? null : phone,
  };

}