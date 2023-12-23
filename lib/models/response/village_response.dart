import 'dart:convert';

VillageResponse villageResponseFromJson(String str) => VillageResponse.fromJson(json.decode(str));

String villageResponseToJson(VillageResponse data) => json.encode(data.toJson());

class VillageResponse {
  bool? error;
  String? errorMessage;
  Map<String, Village>? data;

  VillageResponse({
    this.error,
    this.errorMessage,
    this.data,
  });

  VillageResponse copyWith({
    bool? error,
    String? errorMessage,
    Map<String, Village>? data,
  }) =>
      VillageResponse(
        error: error ?? this.error,
        errorMessage: errorMessage ?? this.errorMessage,
        data: data ?? this.data,
      );

  factory VillageResponse.fromJson(Map<String, dynamic> json) => VillageResponse(
    error: json["error"],
    errorMessage: json["errorMessage"],
    data: Map.from(json["data"]!).map((k, v) => MapEntry<String, Village>(k, Village.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "errorMessage": errorMessage,
    "data": Map.from(data!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class Village {
  int? id;
  String? name;

  Village({
    this.id,
    this.name,
  });

  Village copyWith({
    int? id,
    String? name,
  }) =>
      Village(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Village.fromJson(Map<String, dynamic> json) => Village(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
