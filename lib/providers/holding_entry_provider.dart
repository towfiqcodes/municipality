import 'dart:convert';

import 'package:Pourosova/models/request/holdingEntryRequest/holding_entry_request.dart';
import 'package:Pourosova/models/request/holdingEntryRequest/house_holding_address.dart';
import 'package:Pourosova/models/request/holdingEntryRequest/house_holding_other_info.dart';
import 'package:Pourosova/models/request/holdingEntryRequest/house_holding_registration.dart';
import 'package:Pourosova/modules/home/new_designs/family_info/family_info_model.dart';
import 'package:Pourosova/shared/constants/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

import 'package:shared_preferences/shared_preferences.dart';

import '../modules/home/new_designs/dropdown_item_model.dart';
import '../shared/shared.dart';

class HoldingEntryProvider extends ChangeNotifier {
  HoldingEntryRequest _holdingEntryRequest = HoldingEntryRequest();
  List<DropdownItemModel> postOfficeList = [];
  List<DropdownItemModel> villageList = [];

  HoldingEntryRequest get holdingEntryRequest => _holdingEntryRequest;

  void updateHoldingEntryRequest({
    String? holdingType,
    bool? isNewHolding,
    String? name,
    String? guardianType,
    String? guardianName,
    String? guardianMotherName,
    String? gender,
    String? maritalStatus,
    String? dateOfBirth,
    String? identityType,
    String? identityNumber,
    String? mobile,
    String? religion,
    String? familyType,
    String? familyMemberMale,
    String? familyMemberFemale,
    String? registrationFee,
    String? paymentType,
    String? allowance,
    String? allowanceDescription,
    String? disabilityStatus,
    String? freedomFighterStatus,
    String? waterConnectivityStatus,
    int? numberOfBirthCertificate,
    String? annualTax,
    bool? isGovernmentHolding,
    String? govtOfficeName,
    String? govtOfficerName,
    String? govtOfficerMobileNo,
    String? govtOfficeLength,
    String? govtOfficeWidth,
    String? holdingNo,
    String? wardNo,
    String? village,
    String? postCode,
    String? postOffice,
    String? electricityState,
    String? sanitationState,
    String? houseType,
    String? totalRoom,
    String? length,
    String? width,
    String? occupation,
    String? fiscalYear,
    String? planApprovalStatus,
    List<FamilyInformationModel>? child,
  }) {
    _holdingEntryRequest = _holdingEntryRequest.copyWith(
        houseHoldingRegistrations: _holdingEntryRequest.houseHoldingRegistrations != null
            ? _holdingEntryRequest.houseHoldingRegistrations?.copyWith(
                holdingType: holdingType,
                isNewHolding: isNewHolding,
                name: name,
                guardianType: guardianType,
                guardianName: guardianName,
                guardianMotherName: guardianMotherName,
                gender: gender,
                maritalStatus: maritalStatus,
                dateOfBirth: dateOfBirth,
                identityType: identityType,
                identityNumber: identityNumber,
                mobile: mobile,
                religion: religion,
                familyType: familyType,
                familyMemberMale: familyMemberMale,
                familyMemberFemale: familyMemberFemale,
                registrationFee: registrationFee,
                paymentType: paymentType,
                allowance: allowance,
                allowanceDescription: allowanceDescription,
                disabilityStatus: disabilityStatus,
                freedomFighterStatus: freedomFighterStatus,
                waterConnectivityStatus: waterConnectivityStatus,
                numberOfBirthCertificate: numberOfBirthCertificate,
                annualTax: annualTax,
                isGovernmentHolding: isGovernmentHolding,
                govtOfficeName: govtOfficeName,
                govtOfficerName: govtOfficeName,
                govtOfficerMobileNo: govtOfficerMobileNo,
                govtOfficeLength: govtOfficeLength,
                govtOfficeWidth: govtOfficeWidth,
              )
            : HouseHoldingRegistrations(
                holdingType: holdingType,
                isNewHolding: isNewHolding,
                name: name,
                guardianType: guardianType,
                guardianName: guardianName,
                guardianMotherName: guardianMotherName,
                gender: gender,
                maritalStatus: maritalStatus,
                dateOfBirth: dateOfBirth,
                identityType: identityType,
                identityNumber: identityNumber,
                mobile: mobile,
                religion: religion,
                familyType: familyType,
                familyMemberMale: familyMemberMale,
                familyMemberFemale: familyMemberFemale,
                registrationFee: registrationFee,
                paymentType: paymentType,
                allowance: allowance,
                allowanceDescription: allowanceDescription,
                disabilityStatus: disabilityStatus,
                freedomFighterStatus: freedomFighterStatus,
                waterConnectivityStatus: waterConnectivityStatus,
                numberOfBirthCertificate: numberOfBirthCertificate,
                annualTax: annualTax,
                isGovernmentHolding: isGovernmentHolding,
                govtOfficeName: govtOfficeName,
                govtOfficerName: govtOfficeName,
                govtOfficerMobileNo: govtOfficerMobileNo,
                govtOfficeLength: govtOfficeLength,
                govtOfficeWidth: govtOfficeWidth,
              ),
        houseHoldingAddress: _holdingEntryRequest.houseHoldingAddress != null
            ? _holdingEntryRequest.houseHoldingAddress?.copyWith(
                holdingNo: holdingNo,
                wardNo: wardNo,
                village: village,
                postCode: postCode,
                postOffice: postOffice,
              )
            : HouseHoldingAddress(
                holdingNo: holdingNo,
                wardNo: wardNo,
                village: village,
                postCode: postCode,
                postOffice: postOffice,
              ),
        houseHoldingOtherInfo: _holdingEntryRequest.houseHoldingOtherInfo != null
            ? _holdingEntryRequest.houseHoldingOtherInfo?.copyWith(
                electricityState: electricityState,
                sanitationState: sanitationState,
                houseType: houseType,
                totalRoom: totalRoom,
                length: length,
                width: width,
                occupation: occupation,
                fiscalYear: fiscalYear,
                planApproveStatus: planApprovalStatus,
              )
            : HouseHoldingOtherInfo(
                electricityState: electricityState,
                sanitationState: sanitationState,
                houseType: houseType,
                totalRoom: totalRoom,
                length: length,
                width: width,
                occupation: occupation,
                fiscalYear: fiscalYear,
                planApproveStatus: planApprovalStatus
              ),
        child: child);
    notifyListeners();
  }

  Future<http.Response?> getWordWiseVillages({required String wordNo}) async {
    try {
      final SharedPreferences sharedPreferences = await prefs;
      var response =
          await http.post(Uri.parse(ApiConstants.base_url + ApiConstants.villageData), body: {
        "ward_id": wordNo
      }, headers: {
        "authorization": "Bearer ${sharedPreferences.getString(StorageConstants.token)}",
      });
      developer.log(response.body);
      return response;
    } catch (e) {
      developer.log("getting village data failed - ${e.toString()}");
      return null;
    }
  }

  Future<http.Response?> getPostOffices({required String postalCode}) async {
    try {
      final SharedPreferences sharedPreferences = await prefs;
      var response =
          await http.post(Uri.parse(ApiConstants.base_url + ApiConstants.postOfficeData), body: {
        "post_code_id": postalCode
      }, headers: {
        "authorization": "Bearer ${sharedPreferences.getString(StorageConstants.token)}",
      });
      developer.log(response.body);
      return response;
    } catch (e) {
      developer.log("getting post office data failed - ${e.toString()}");
      return null;
    }
  }

  Future<http.Response?> createNewHouseHolding() async {
    try {
      final SharedPreferences sharedPreferences = await prefs;
      var response = await http.post(Uri.parse(ApiConstants.base_url + ApiConstants.create),
          body: jsonEncode(_holdingEntryRequest.toJson()),
          headers: {
            "authorization": "Bearer ${sharedPreferences.getString(StorageConstants.token)}",
            "Content-Type": "application/json"
          });
      developer.log(response.statusCode.toString());
      return response;
    } catch (e) {
      developer.log("create new holding failed - ${e.toString()}");
      return null;
    }
  }
}
