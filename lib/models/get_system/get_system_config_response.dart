// To parse this JSON data, do
//
//     final getSystemConfig = getSystemConfigFromJson(jsonString);

import 'dart:convert';

GetSystemConfig getSystemConfigFromJson(String str) => GetSystemConfig.fromJson(json.decode(str));

String getSystemConfigToJson(GetSystemConfig data) => json.encode(data.toJson());

class GetSystemConfig {
  GetSystemConfig({
    this.error=false,
    this.errorMessage='',
    this.data,
  });

  bool error;
  String errorMessage;
  GetSystemConfigData? data;

  factory GetSystemConfig.fromJson(Map<String, dynamic> json) => GetSystemConfig(
    error: json["error"] == null ? null : json["error"],
    errorMessage: json["errorMessage"] == null ? null : json["errorMessage"],
    data: json["data"] == null ? null : GetSystemConfigData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error == null ? null : error,
    "errorMessage": errorMessage == null ? null : errorMessage,
    "data": data == null ? null : data?.toJson(),
  };
}

class GetSystemConfigData {
  GetSystemConfigData({
    this.holdingType,
    this.guardianType,
    this.gender,
    this.maritalStatus,
    this.identityType,
    this.familyType,
    this.paymentType,
    this.allowance,
    this.disabilityStatus,
    this.freedomFighterStatus,
    this.waterConnectivityStatus,
    this.wardNo,
    this.postCode,
    this.electricityState,
    this.sanitationState,
    this.houseType,
    this.occupation,
    this.fiscalYear,
    this.relation,
    this.disability,
  });

  Map<String, String>? holdingType;
  Map<String, String>? guardianType;
  Map<String, String>? gender;
  Map<String, String>? maritalStatus;
  Map<String, String>? identityType;
  Map<String, String>? familyType;
  Map<String, String>? paymentType;
  List<dynamic>? allowance;
  Map<String, String>? disabilityStatus;
  Map<String, String>? freedomFighterStatus;
  Map<String, String>? waterConnectivityStatus;
  List<dynamic>? wardNo;
  List<dynamic>? postCode;
  Map<String, String>? electricityState;
  Map<String, String>? sanitationState;
  List<dynamic>? houseType;
  List<dynamic>? occupation;
  Map<String, String>? fiscalYear;
  Map<String, String>? relation;
  List<dynamic>? disability;

  factory GetSystemConfigData.fromJson(Map<String, dynamic> json) => GetSystemConfigData(
    holdingType: json["holdingType"] == null ? {} : Map.from(json["holdingType"]).map((k, v) => MapEntry<String, String>(k, v)),
    guardianType: json["guardianType"] == null ? {} : Map.from(json["guardianType"]).map((k, v) => MapEntry<String, String>(k, v)),
    gender: json["gender"] == null ? {} : Map.from(json["gender"]).map((k, v) => MapEntry<String, String>(k, v)),
    maritalStatus: json["maritalStatus"] == null ? {} : Map.from(json["maritalStatus"]).map((k, v) => MapEntry<String, String>(k, v)),
    identityType: json["identityType"] == null ? {} : Map.from(json["identityType"]).map((k, v) => MapEntry<String, String>(k, v)),
    familyType: json["familyType"] == null ? {} : Map.from(json["familyType"]).map((k, v) => MapEntry<String, String>(k, v)),
    paymentType: json["paymentType"] == null ? {} : Map.from(json["paymentType"]).map((k, v) => MapEntry<String, String>(k, v)),
    allowance: json["allowance"] == null ? [] : List<dynamic>.from(json["allowance"].map((x) => x)),
    disabilityStatus: json["disabilityStatus"] == null ? {} : Map.from(json["disabilityStatus"]).map((k, v) => MapEntry<String, String>(k, v)),
    freedomFighterStatus: json["freedomFighterStatus"] == null ? {} : Map.from(json["freedomFighterStatus"]).map((k, v) => MapEntry<String, String>(k, v)),
    waterConnectivityStatus: json["waterConnectivityStatus"] == null ? {} : Map.from(json["waterConnectivityStatus"]).map((k, v) => MapEntry<String, String>(k, v)),
    wardNo: json["wardNo"] == null ? [] : List<dynamic>.from(json["wardNo"].map((x) => x)),
    postCode: json["postCode"] == null ? [] : List<dynamic>.from(json["postCode"].map((x) => x)),
    electricityState: json["electricityState"] == null ? {} : Map.from(json["electricityState"]).map((k, v) => MapEntry<String, String>(k, v)),
    sanitationState: json["sanitationState"] == null ? {} : Map.from(json["sanitationState"]).map((k, v) => MapEntry<String, String>(k, v)),
    houseType: json["houseType"] == null ? [] : List<dynamic>.from(json["houseType"].map((x) => x)),
    occupation: json["occupation"] == null ? [] : List<dynamic>.from(json["occupation"].map((x) => x)),
    fiscalYear: json["fiscalYear"] == null ? {} : Map.from(json["fiscalYear"]).map((k, v) => MapEntry<String, String>(k, v)),
    relation: json["relation"] == null ? {} : Map.from(json["relation"]).map((k, v) => MapEntry<String, String>(k, v)),
    disability: json["disability"] == null ? [null] : List<dynamic>.from(json["disability"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "holdingType": holdingType == null ? null : Map.from(holdingType!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "guardianType": guardianType == null ? null : Map.from(guardianType!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "gender": gender == null ? null : Map.from(gender!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "maritalStatus": maritalStatus == null ? null : Map.from(maritalStatus!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "identityType": identityType == null ? null : Map.from(identityType!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "familyType": familyType == null ? null : Map.from(familyType!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "paymentType": paymentType == null ? null : Map.from(paymentType!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "allowance": allowance == null ? null : List<dynamic>.from(allowance!.map((x) => x)),
    "disabilityStatus": disabilityStatus == null ? null : Map.from(disabilityStatus!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "freedomFighterStatus": freedomFighterStatus == null ? null : Map.from(freedomFighterStatus!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "waterConnectivityStatus": waterConnectivityStatus == null ? null : Map.from(waterConnectivityStatus!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "wardNo": wardNo == null ? null : List<dynamic>.from(wardNo!.map((x) => x)),
    "postCode": postCode == null ? null : List<dynamic>.from(postCode!.map((x) => x)),
    "electricityState": electricityState == null ? null : Map.from(electricityState!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "sanitationState": sanitationState == null ? null : Map.from(sanitationState!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "houseType": houseType == null ? null : List<dynamic>.from(houseType!.map((x) => x)),
    "occupation": occupation == null ? null : List<dynamic>.from(occupation!.map((x) => x)),
    "fiscalYear": fiscalYear == null ? null : Map.from(fiscalYear!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "relation": relation == null ? null : Map.from(relation!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "disability": disability == null ? null : List<dynamic>.from(disability!.map((x) => x)),
  };
}


