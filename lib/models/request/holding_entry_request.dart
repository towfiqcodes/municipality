import 'dart:convert';

HoldingEntryRequest holdingEntryRequestFromJson(String str) => HoldingEntryRequest.fromJson(json.decode(str));

String holdingEntryRequestToJson(HoldingEntryRequest data) => json.encode(data.toJson());

class HoldingEntryRequest {
  String? holdingType;
  bool? isNewHolding;
  String? name;
  String? guardianType;
  String? guardianName;
  String? guardianMotherName;
  String? gender;
  String? maritalStatus;
  String? dateOfBirth;
  String? identityType;
  String? identityNumber;
  String? mobile;
  String? religion;
  String? familyType;
  String? familyMemberMale;
  String? familyMemberFemale;
  String? registrationFee;
  String? paymentType;
  String? allowance;
  String? allowanceDescription;
  String? disabilityStatus;
  String? freedomFighterStatus;
  String? waterConnectivityStatus;
  int? numberOfBirthCertificate;
  String? annualTax;
  bool? isGovernmentHolding;
  String? govtOfficeName;
  String? govtOfficerName;
  String? govtOfficerMobileNo;
  String? govtOfficeLength;
  String? govtOfficeWidth;
  String? holdingNo;
  String? wardNo;
  String? village;
  String? postCode;
  String? postOffice;
  String? electricityState;
  String? sanitationState;
  String? houseType;
  String? totalRoom;
  String? length;
  String? width;
  String? occupation;
  String? fiscalYear;

  HoldingEntryRequest({
    this.holdingType,
    this.isNewHolding,
    this.name,
    this.guardianType,
    this.guardianName,
    this.guardianMotherName,
    this.gender,
    this.maritalStatus,
    this.dateOfBirth,
    this.identityType,
    this.identityNumber,
    this.mobile,
    this.religion,
    this.familyType,
    this.familyMemberMale,
    this.familyMemberFemale,
    this.registrationFee,
    this.paymentType,
    this.allowance,
    this.allowanceDescription,
    this.disabilityStatus,
    this.freedomFighterStatus,
    this.waterConnectivityStatus,
    this.numberOfBirthCertificate,
    this.annualTax,
    this.isGovernmentHolding,
    this.govtOfficeName,
    this.govtOfficerName,
    this.govtOfficerMobileNo,
    this.govtOfficeLength,
    this.govtOfficeWidth,
    this.holdingNo,
    this.wardNo,
    this.village,
    this.postCode,
    this.postOffice,
    this.electricityState,
    this.sanitationState,
    this.houseType,
    this.totalRoom,
    this.length,
    this.width,
    this.occupation,
    this.fiscalYear,
  });

  HoldingEntryRequest copyWith({
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
  }) =>
      HoldingEntryRequest(
        holdingType: holdingType ?? this.holdingType,
        isNewHolding: isNewHolding ?? this.isNewHolding,
        name: name ?? this.name,
        guardianType: guardianType ?? this.guardianType,
        guardianName: guardianName ?? this.guardianName,
        guardianMotherName: guardianMotherName ?? this.guardianMotherName,
        gender: gender ?? this.gender,
        maritalStatus: maritalStatus ?? this.maritalStatus,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        identityType: identityType ?? this.identityType,
        identityNumber: identityNumber ?? this.identityNumber,
        mobile: mobile ?? this.mobile,
        religion: religion ?? this.religion,
        familyType: familyType ?? this.familyType,
        familyMemberMale: familyMemberMale ?? this.familyMemberMale,
        familyMemberFemale: familyMemberFemale ?? this.familyMemberFemale,
        registrationFee: registrationFee ?? this.registrationFee,
        paymentType: paymentType ?? this.paymentType,
        allowance: allowance ?? this.allowance,
        allowanceDescription: allowanceDescription ?? this.allowanceDescription,
        disabilityStatus: disabilityStatus ?? this.disabilityStatus,
        freedomFighterStatus: freedomFighterStatus ?? this.freedomFighterStatus,
        waterConnectivityStatus: waterConnectivityStatus ?? this.waterConnectivityStatus,
        numberOfBirthCertificate: numberOfBirthCertificate ?? this.numberOfBirthCertificate,
        annualTax: annualTax ?? this.annualTax,
        isGovernmentHolding: isGovernmentHolding ?? this.isGovernmentHolding,
        govtOfficeName: govtOfficeName ?? this.govtOfficeName,
        govtOfficerName: govtOfficerName ?? this.govtOfficerName,
        govtOfficerMobileNo: govtOfficerMobileNo ?? this.govtOfficerMobileNo,
        govtOfficeLength: govtOfficeLength ?? this.govtOfficeLength,
        govtOfficeWidth: govtOfficeWidth ?? this.govtOfficeWidth,
        holdingNo: holdingNo ?? this.holdingNo,
        wardNo: wardNo ?? this.wardNo,
        village: village ?? this.village,
        postCode: postCode ?? this.postCode,
        postOffice: postOffice ?? this.postOffice,
        electricityState: electricityState ?? this.electricityState,
        sanitationState: sanitationState ?? this.sanitationState,
        houseType: houseType ?? this.houseType,
        totalRoom: totalRoom ?? this.totalRoom,
        length: length ?? this.length,
        width: width ?? this.width,
        occupation: occupation ?? this.occupation,
        fiscalYear: fiscalYear ?? this.fiscalYear,
      );

  factory HoldingEntryRequest.fromJson(Map<String, dynamic> json) => HoldingEntryRequest(
    holdingType: json["holdingType"],
    isNewHolding: json["isNewHolding"],
    name: json["name"],
    guardianType: json["guardianType"],
    guardianName: json["guardianName"],
    guardianMotherName: json["guardianMotherName"],
    gender: json["gender"],
    maritalStatus: json["maritalStatus"],
    dateOfBirth: json["dateOfBirth"],
    identityType: json["identityType"],
    identityNumber: json["identityNumber"],
    mobile: json["mobile"],
    religion: json["religion"],
    familyType: json["familyType"],
    familyMemberMale: json["familyMemberMale"],
    familyMemberFemale: json["familyMemberFemale"],
    registrationFee: json["registrationFee"],
    paymentType: json["paymentType"],
    allowance: json["allowance"],
    allowanceDescription: json["allowanceDescription"],
    disabilityStatus: json["disabilityStatus"],
    freedomFighterStatus: json["freedomFighterStatus"],
    waterConnectivityStatus: json["waterConnectivityStatus"],
    numberOfBirthCertificate: json["numberOfBirthCertificate"],
    annualTax: json["annualTax"],
    isGovernmentHolding: json["isGovernmentHolding"],
    govtOfficeName: json["govtOfficeName"],
    govtOfficerName: json["govtOfficerName"],
    govtOfficerMobileNo: json["govtOfficerMobileNo"],
    govtOfficeLength: json["govtOfficeLength"],
    govtOfficeWidth: json["govtOfficeWidth"],
    holdingNo: json["holdingNo"],
    wardNo: json["wardNo"],
    village: json["village"],
    postCode: json["postCode"],
    postOffice: json["postOffice"],
    electricityState: json["electricityState"],
    sanitationState: json["sanitationState"],
    houseType: json["houseType"],
    totalRoom: json["totalRoom"],
    length: json["length"],
    width: json["width"],
    occupation: json["occupation"],
    fiscalYear: json["fiscalYear"],
  );

  Map<String, dynamic> toJson() => {
    "holdingType": holdingType,
    "isNewHolding": isNewHolding,
    "name": name,
    "guardianType": guardianType,
    "guardianName": guardianName,
    "guardianMotherName": guardianMotherName,
    "gender": gender,
    "maritalStatus": maritalStatus,
    "dateOfBirth": dateOfBirth,
    "identityType": identityType,
    "identityNumber": identityNumber,
    "mobile": mobile,
    "religion": religion,
    "familyType": familyType,
    "familyMemberMale": familyMemberMale,
    "familyMemberFemale": familyMemberFemale,
    "registrationFee": registrationFee,
    "paymentType": paymentType,
    "allowance": allowance,
    "allowanceDescription": allowanceDescription,
    "disabilityStatus": disabilityStatus,
    "freedomFighterStatus": freedomFighterStatus,
    "waterConnectivityStatus": waterConnectivityStatus,
    "numberOfBirthCertificate": numberOfBirthCertificate,
    "annualTax": annualTax,
    "isGovernmentHolding": isGovernmentHolding,
    "govtOfficeName": govtOfficeName,
    "govtOfficerName": govtOfficerName,
    "govtOfficerMobileNo": govtOfficerMobileNo,
    "govtOfficeLength": govtOfficeLength,
    "govtOfficeWidth": govtOfficeWidth,
    "holdingNo": holdingNo,
    "wardNo": wardNo,
    "village": village,
    "postCode": postCode,
    "postOffice": postOffice,
    "electricityState": electricityState,
    "sanitationState": sanitationState,
    "houseType": houseType,
    "totalRoom": totalRoom,
    "length": length,
    "width": width,
    "occupation": occupation,
    "fiscalYear": fiscalYear,
  };

  @override
  String toString() {
    return 'HoldingEntryRequest{holdingType: $holdingType, isNewHolding: $isNewHolding, name: $name, guardianType: $guardianType, guardianName: $guardianName, guardianMotherName: $guardianMotherName, gender: $gender, maritalStatus: $maritalStatus, dateOfBirth: $dateOfBirth, identityType: $identityType, identityNumber: $identityNumber, mobile: $mobile, religion: $religion, familyType: $familyType, familyMemberMale: $familyMemberMale, familyMemberFemale: $familyMemberFemale, registrationFee: $registrationFee, paymentType: $paymentType, allowance: $allowance, allowanceDescription: $allowanceDescription, disabilityStatus: $disabilityStatus, freedomFighterStatus: $freedomFighterStatus, waterConnectivityStatus: $waterConnectivityStatus, numberOfBirthCertificate: $numberOfBirthCertificate, annualTax: $annualTax, isGovernmentHolding: $isGovernmentHolding, govtOfficeName: $govtOfficeName, govtOfficerName: $govtOfficerName, govtOfficerMobileNo: $govtOfficerMobileNo, govtOfficeLength: $govtOfficeLength, govtOfficeWidth: $govtOfficeWidth, holdingNo: $holdingNo, wardNo: $wardNo, village: $village, postCode: $postCode, postOffice: $postOffice, electricityState: $electricityState, sanitationState: $sanitationState, houseType: $houseType, totalRoom: $totalRoom, length: $length, width: $width, occupation: $occupation, fiscalYear: $fiscalYear}';
  }
}
