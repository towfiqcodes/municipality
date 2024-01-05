// To parse this JSON data, do
//
//     final holdingEntryRequest = holdingEntryRequestFromJson(jsonString);

import 'dart:convert';

import 'package:Pourosova/modules/home/new_designs/family_info/family_info_model.dart';

import 'house_holding_address.dart';
import 'house_holding_other_info.dart';
import 'house_holding_registration.dart';

HoldingEntryRequest holdingEntryRequestFromJson(String str) => HoldingEntryRequest.fromJson(json.decode(str));

String holdingEntryRequestToJson(HoldingEntryRequest data) => json.encode(data.toJson());

class HoldingEntryRequest {
  HouseHoldingRegistrations? houseHoldingRegistrations;
  HouseHoldingAddress? houseHoldingAddress;
  HouseHoldingOtherInfo? houseHoldingOtherInfo;
  List<FamilyInformationModel>? child;

  HoldingEntryRequest({
    this.houseHoldingRegistrations,
    this.houseHoldingAddress,
    this.houseHoldingOtherInfo,
    this.child,
  });

  HoldingEntryRequest copyWith({
    HouseHoldingRegistrations? houseHoldingRegistrations,
    HouseHoldingAddress? houseHoldingAddress,
    HouseHoldingOtherInfo? houseHoldingOtherInfo,
    List<FamilyInformationModel>? child,
  }) =>
      HoldingEntryRequest(
        houseHoldingRegistrations: houseHoldingRegistrations ?? this.houseHoldingRegistrations,
        houseHoldingAddress: houseHoldingAddress ?? this.houseHoldingAddress,
        houseHoldingOtherInfo: houseHoldingOtherInfo ?? this.houseHoldingOtherInfo,
        child: child ?? this.child,
      );

  factory HoldingEntryRequest.fromJson(Map<String, dynamic> json) => HoldingEntryRequest(
    houseHoldingRegistrations: json["house_holding_registrations"] == null ? null : HouseHoldingRegistrations.fromJson(json["house_holding_registrations"]),
    houseHoldingAddress: json["house_holding_address"] == null ? null : HouseHoldingAddress.fromJson(json["house_holding_address"]),
    houseHoldingOtherInfo: json["house_holding_other_info"] == null ? null : HouseHoldingOtherInfo.fromJson(json["house_holding_other_info"]),
    child: json["child"] == null ? [] : List<FamilyInformationModel>.from(json["child"]!.map((x) => FamilyInformationModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "house_holding_registrations": houseHoldingRegistrations?.toJson(),
    "house_holding_address": houseHoldingAddress?.toJson(),
    "house_holding_other_info": houseHoldingOtherInfo?.toJson(),
    "child": child == null ? [] : List<dynamic>.from(child!.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'HoldingEntryRequest{houseHoldingRegistrations: $houseHoldingRegistrations, houseHoldingAddress: $houseHoldingAddress, houseHoldingOtherInfo: $houseHoldingOtherInfo, child: $child}';
  }
}




