class HouseHoldingAddress {
  String? holdingNo;
  String? wardNo;
  String? village;
  String? postCode;
  String? postOffice;

  HouseHoldingAddress({
    this.holdingNo,
    this.wardNo,
    this.village,
    this.postCode,
    this.postOffice,
  });

  HouseHoldingAddress copyWith({
    String? holdingNo,
    String? wardNo,
    String? village,
    String? postCode,
    String? postOffice,
  }) =>
      HouseHoldingAddress(
        holdingNo: holdingNo ?? this.holdingNo,
        wardNo: wardNo ?? this.wardNo,
        village: village ?? this.village,
        postCode: postCode ?? this.postCode,
        postOffice: postOffice ?? this.postOffice,
      );

  factory HouseHoldingAddress.fromJson(Map<String, dynamic> json) => HouseHoldingAddress(
    holdingNo: json["holdingNo"],
    wardNo: json["wardNo"],
    village: json["village"],
    postCode: json["postCode"],
    postOffice: json["postOffice"],
  );

  Map<String, dynamic> toJson() => {
    "holdingNo": holdingNo,
    "wardNo": wardNo,
    "village": village,
    "postCode": postCode,
    "postOffice": postOffice,
  };

  @override
  String toString() {
    return 'HouseHoldingAddress{holdingNo: $holdingNo, wardNo: $wardNo, village: $village, postCode: $postCode, postOffice: $postOffice}';
  }
}