// To parse this JSON data, do
//
//     final getSystemConfig = getSystemConfigFromJson(jsonString);

import 'dart:convert';

GetSystemConfig getSystemConfigFromJson(String str) => GetSystemConfig.fromJson(json.decode(str));

String getSystemConfigToJson(GetSystemConfig data) => json.encode(data.toJson());

class GetSystemConfig {
  bool? error;
  String? errorMessage;
  GetSystemConfigData? data;

  GetSystemConfig({
    this.error,
    this.errorMessage,
    this.data,
  });

  GetSystemConfig copyWith({
    bool? error,
    String? errorMessage,
    GetSystemConfigData? data,
  }) =>
      GetSystemConfig(
        error: error ?? this.error,
        errorMessage: errorMessage ?? this.errorMessage,
        data: data ?? this.data,
      );

  factory GetSystemConfig.fromJson(Map<String, dynamic> json) => GetSystemConfig(
        error: json["error"],
        errorMessage: json["errorMessage"],
        data: json["data"] == null ? null : GetSystemConfigData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "errorMessage": errorMessage,
        "data": data?.toJson(),
      };
}

class GetSystemConfigData {
  int? appsVersion;
  Map<String, String>? holdingType;
  Map<String, String>? guardianType;
  Map<String, String>? gender;
  Map<String, String>? maritalStatus;
  Map<String, String>? identityType;
  Map<String, String>? familyType;
  Map<String, String>? paymentType;
  Map<String, String>? allowance;
  Map<String, String>? disabilityStatus;
  Map<String, String>? freedomFighterStatus;
  Map<String, String>? waterConnectivityStatus;
  Map<String, String>? wardNo;
  Map<String, String>? postCode;
  Map<String, String>? electricityState;
  Map<String, String>? sanitationState;
  Map<String, String>? houseType;
  Map<String, String>? occupation;
  Map<String, String>? fiscalYear;
  Map<String, String>? relation;
  Map<String, String>? disability;
  Map<String, String>? religion;
  PlanApproveStatus? planApproveStatus;

  GetSystemConfigData({
    this.appsVersion,
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
    this.religion,
    this.planApproveStatus,
  });

  GetSystemConfigData copyWith({
    int? appsVersion,
    Map<String, String>? holdingType,
    Map<String, String>? guardianType,
    Map<String, String>? gender,
    Map<String, String>? maritalStatus,
    Map<String, String>? identityType,
    Map<String, String>? familyType,
    Map<String, String>? paymentType,
    Map<String, String>? allowance,
    Map<String, String>? disabilityStatus,
    Map<String, String>? freedomFighterStatus,
    Map<String, String>? waterConnectivityStatus,
    Map<String, String>? wardNo,
    Map<String, String>? postCode,
    Map<String, String>? electricityState,
    Map<String, String>? sanitationState,
    Map<String, String>? houseType,
    Map<String, String>? occupation,
    Map<String, String>? fiscalYear,
    Map<String, String>? relation,
    Map<String, String>? disability,
    Map<String, String>? religion,
    PlanApproveStatus? planApproveStatus,
  }) =>
      GetSystemConfigData(
        appsVersion: appsVersion ?? this.appsVersion,
        holdingType: holdingType ?? this.holdingType,
        guardianType: guardianType ?? this.guardianType,
        gender: gender ?? this.gender,
        maritalStatus: maritalStatus ?? this.maritalStatus,
        identityType: identityType ?? this.identityType,
        familyType: familyType ?? this.familyType,
        paymentType: paymentType ?? this.paymentType,
        allowance: allowance ?? this.allowance,
        disabilityStatus: disabilityStatus ?? this.disabilityStatus,
        freedomFighterStatus: freedomFighterStatus ?? this.freedomFighterStatus,
        waterConnectivityStatus: waterConnectivityStatus ?? this.waterConnectivityStatus,
        wardNo: wardNo ?? this.wardNo,
        postCode: postCode ?? this.postCode,
        electricityState: electricityState ?? this.electricityState,
        sanitationState: sanitationState ?? this.sanitationState,
        houseType: houseType ?? this.houseType,
        occupation: occupation ?? this.occupation,
        fiscalYear: fiscalYear ?? this.fiscalYear,
        relation: relation ?? this.relation,
        disability: disability ?? this.disability,
        religion: religion ?? this.religion,
        planApproveStatus: planApproveStatus ?? this.planApproveStatus,
      );

  factory GetSystemConfigData.fromJson(Map<String, dynamic> json) => GetSystemConfigData(
        appsVersion: json["appsVersion"],
        holdingType: Map.from(json["holdingType"]!).map((k, v) => MapEntry<String, String>(k, v)),
        guardianType: Map.from(json["guardianType"]!).map((k, v) => MapEntry<String, String>(k, v)),
        gender: Map.from(json["gender"]!).map((k, v) => MapEntry<String, String>(k, v)),
        maritalStatus:
            Map.from(json["maritalStatus"]!).map((k, v) => MapEntry<String, String>(k, v)),
        identityType: Map.from(json["identityType"]!).map((k, v) => MapEntry<String, String>(k, v)),
        familyType: Map.from(json["familyType"]!).map((k, v) => MapEntry<String, String>(k, v)),
        paymentType: Map.from(json["paymentType"]!).map((k, v) => MapEntry<String, String>(k, v)),
        allowance: Map.from(json["allowance"]!).map((k, v) => MapEntry<String, String>(k, v)),
        disabilityStatus:
            Map.from(json["disabilityStatus"]!).map((k, v) => MapEntry<String, String>(k, v)),
        freedomFighterStatus:
            Map.from(json["freedomFighterStatus"]!).map((k, v) => MapEntry<String, String>(k, v)),
        waterConnectivityStatus: Map.from(json["waterConnectivityStatus"]!)
            .map((k, v) => MapEntry<String, String>(k, v)),
        wardNo: Map.from(json["wardNo"]!).map((k, v) => MapEntry<String, String>(k, v)),
        postCode: Map.from(json["postCode"]!).map((k, v) => MapEntry<String, String>(k, v)),
        electricityState:
            Map.from(json["electricityState"]!).map((k, v) => MapEntry<String, String>(k, v)),
        sanitationState:
            Map.from(json["sanitationState"]!).map((k, v) => MapEntry<String, String>(k, v)),
        houseType: Map.from(json["houseType"]!).map((k, v) => MapEntry<String, String>(k, v)),
        occupation: Map.from(json["occupation"]!).map((k, v) => MapEntry<String, String>(k, v)),
        fiscalYear: Map.from(json["fiscalYear"]!).map((k, v) => MapEntry<String, String>(k, v)),
        relation: Map.from(json["relation"]!).map((k, v) => MapEntry<String, String>(k, v)),
        disability: Map.from(json["disability"]!).map((k, v) => MapEntry<String, String>(k, v)),
        religion: Map.from(json["religion"]!).map((k, v) => MapEntry<String, String>(k, v)),
        planApproveStatus: json["planApproveStatus"] == null
            ? null
            : PlanApproveStatus.fromJson(json["planApproveStatus"]),
      );

  Map<String, dynamic> toJson() => {
        "appsVersion": appsVersion,
        "holdingType": Map.from(holdingType!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "guardianType": Map.from(guardianType!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "gender": Map.from(gender!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "maritalStatus": Map.from(maritalStatus!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "identityType": Map.from(identityType!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "familyType": Map.from(familyType!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "paymentType": Map.from(paymentType!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "allowance": Map.from(allowance!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "disabilityStatus":
            Map.from(disabilityStatus!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "freedomFighterStatus":
            Map.from(freedomFighterStatus!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "waterConnectivityStatus":
            Map.from(waterConnectivityStatus!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "wardNo": Map.from(wardNo!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "postCode": Map.from(postCode!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "electricityState":
            Map.from(electricityState!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "sanitationState":
            Map.from(sanitationState!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "houseType": Map.from(houseType!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "occupation": Map.from(occupation!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "fiscalYear": Map.from(fiscalYear!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "relation": Map.from(relation!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "disability": Map.from(disability!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "religion": Map.from(religion!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "planApproveStatus": planApproveStatus?.toJson(),
      };
}

class PostCode {
  String? the7;

  PostCode({
    this.the7,
  });

  PostCode copyWith({
    String? the7,
  }) =>
      PostCode(
        the7: the7 ?? this.the7,
      );

  factory PostCode.fromJson(Map<String, dynamic> json) => PostCode(
        the7: json["7"],
      );

  Map<String, dynamic> toJson() => {
        "7": the7,
      };
}

class PlanApproveStatus {
  String? the1;
  String? the2;
  String? empty;

  PlanApproveStatus({
    this.the1,
    this.the2,
    this.empty,
  });

  PlanApproveStatus copyWith({
    String? the1,
    String? the2,
    String? empty,
  }) =>
      PlanApproveStatus(
        the1: the1 ?? this.the1,
        the2: the2 ?? this.the2,
        empty: empty ?? this.empty,
      );

  factory PlanApproveStatus.fromJson(Map<String, dynamic> json) => PlanApproveStatus(
        the1: json["1"],
        the2: json["2"],
        empty: json[""],
      );

  Map<String, dynamic> toJson() => {
        "1": the1,
        "2": the2,
        "": empty,
      };
}
