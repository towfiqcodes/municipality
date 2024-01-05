class HouseHoldingOtherInfo {
  String? electricityState;
  String? sanitationState;
  String? houseType;
  String? totalRoom;
  String? length;
  String? width;
  String? occupation;
  String? fiscalYear;
  String? planApproveStatus;

  HouseHoldingOtherInfo({
    this.electricityState,
    this.sanitationState,
    this.houseType,
    this.totalRoom,
    this.length,
    this.width,
    this.occupation,
    this.fiscalYear,
    this.planApproveStatus,
  });

  HouseHoldingOtherInfo copyWith({
    String? electricityState,
    String? sanitationState,
    String? houseType,
    String? totalRoom,
    String? length,
    String? width,
    String? occupation,
    String? fiscalYear,
    String? planApproveStatus,
  }) =>
      HouseHoldingOtherInfo(
        electricityState: electricityState ?? this.electricityState,
        sanitationState: sanitationState ?? this.sanitationState,
        houseType: houseType ?? this.houseType,
        totalRoom: totalRoom ?? this.totalRoom,
        length: length ?? this.length,
        width: width ?? this.width,
        occupation: occupation ?? this.occupation,
        fiscalYear: fiscalYear ?? this.fiscalYear,
        planApproveStatus: planApproveStatus ?? this.fiscalYear,
      );

  factory HouseHoldingOtherInfo.fromJson(Map<String, dynamic> json) => HouseHoldingOtherInfo(
    electricityState: json["electricityState"],
    sanitationState: json["sanitationState"],
    houseType: json["houseType"],
    totalRoom: json["totalRoom"],
    length: json["length"],
    width: json["width"],
    occupation: json["occupation"],
    fiscalYear: json["fiscalYear"],
    planApproveStatus: json["planApproveStatus"],
  );

  Map<String, dynamic> toJson() => {
    "electricityState": electricityState,
    "sanitationState": sanitationState,
    "houseType": houseType,
    "totalRoom": totalRoom,
    "length": length,
    "width": width,
    "occupation": occupation,
    "fiscalYear": fiscalYear,
    "planApproveStatus": planApproveStatus,
  };

  @override
  String toString() {
    return 'HouseHoldingOtherInfo{electricityState: $electricityState, sanitationState: $sanitationState, houseType: $houseType, totalRoom: $totalRoom, length: $length, width: $width, occupation: $occupation, fiscalYear: $fiscalYear, planApproveStatus: $planApproveStatus}';
  }
}