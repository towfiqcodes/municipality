import 'dart:convert';

class FamilyInformationModel {
  String id;
  String name;
  String relation;
  bool isAutistic;
  String nidNo;

  FamilyInformationModel(
      {required this.id,
      this.name = "",
      this.relation = "",
      this.isAutistic = false,
      this.nidNo = ""});

  @override
  String toString() {
    return 'FamilyInformationModel{id: $id, name: $name, relation: $relation, isAutistic: $isAutistic, nidNo: $nidNo}';
  }

  factory FamilyInformationModel.fromJson(Map<String, dynamic> jsonData) {
    return FamilyInformationModel(
        id: jsonData['id'],
        name: jsonData['name'],
        relation: jsonData['relation'],
        isAutistic: jsonData['isAutistic'],
        nidNo: jsonData['nidNo']);
  }

  static Map<String, dynamic> toMap(FamilyInformationModel model) => {
        'id': model.id,
        'name': model.name,
        'relation': model.relation,
        'isAutistic': model.isAutistic,
        'nidNo': model.nidNo
      };

  static String encode(List<FamilyInformationModel> familyInformationModelList) => json.encode(
        familyInformationModelList
            .map<Map<String, dynamic>>((music) => FamilyInformationModel.toMap(music))
            .toList(),
      );

  static List<FamilyInformationModel> decode(String familyInfo) =>
      (json.decode(familyInfo) as List<dynamic>)
          .map<FamilyInformationModel>((item) => FamilyInformationModel.fromJson(item))
          .toList();
}
