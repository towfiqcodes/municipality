class FamilyInformationModel {
  String? id;
  String? name;
  String? gender;
  String? disability;
  String? nid;

  FamilyInformationModel({
    this.id,
    this.name,
    this.gender,
    this.disability,
    this.nid,
  });

  FamilyInformationModel copyWith({
    String? id,
    String? name,
    String? gender,
    String? disability,
    String? nid,
  }) =>
      FamilyInformationModel(
        id: id ?? this.id,
        name: name ?? this.name,
        gender: gender ?? this.gender,
        disability: disability ?? this.disability,
        nid: nid ?? this.nid,
      );

  factory FamilyInformationModel.fromJson(Map<String, dynamic> json) => FamilyInformationModel(
    name: json["name"],
    gender: json["gender"],
    disability: json["disability"],
    nid: json["nid"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "gender": gender,
    "disability": disability,
    "nid": nid,
  };

  @override
  String toString() {
    return 'FamilyInformationModel{id: $id, name: $name, gender: $gender, disability: $disability, nid: $nid}';
  }
}
