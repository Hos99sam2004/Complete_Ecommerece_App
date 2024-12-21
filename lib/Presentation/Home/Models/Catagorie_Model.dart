class CatagorieModel {
  CatagorieModel({
    this.status,
    this.message,
    this.data,
  });

  CatagorieModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data =
        json['data'] != null ? CatagorieModelData.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  CatagorieModelData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class CatagorieModelData {
  CatagorieModelData({
    this.data,
  });

  CatagorieModelData.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CatagorieData.fromJson(v));
      });
    }
  }
  List<CatagorieData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CatagorieData {
  CatagorieData({
    this.id,
    this.name,
    this.image,
  });

  CatagorieData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
  num? id;
  String? name;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    return map;
  }
}
