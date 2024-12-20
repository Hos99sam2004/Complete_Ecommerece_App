/// status : true
/// message : null
/// data : [{"id":11,"image":"https://student.valuxapps.com/storage/uploads/banners/1732402018qoY0L.banner1.png","category":null,"product":null},{"id":12,"image":"https://student.valuxapps.com/storage/uploads/banners/1732574054JUQcm.6.jpg","category":{"id":42,"image":"https://student.valuxapps.com/storage/uploads/categories/16445270619najK.6242655.jpg","name":"رياضة"},"product":null},{"id":27,"image":"https://student.valuxapps.com/storage/uploads/banners/1689106762vIpcq.photo_2023-07-11_23-07-38.png","category":null,"product":null}]

class BannerModel {
  BannerModel({
      bool? status, 
      dynamic message, 
      List<BannerData>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  BannerModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(BannerData.fromJson(v));
      });
    }
  }
  bool? _status;
  dynamic _message;
  List<BannerData>? _data;

  bool? get status => _status;
  dynamic get message => _message;
  List<BannerData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 11
/// image : "https://student.valuxapps.com/storage/uploads/banners/1732402018qoY0L.banner1.png"
/// category : null
/// product : null

class BannerData {
  BannerData({
      num? id, 
      String? image, 
      dynamic category, 
      dynamic product,}){
    _id = id;
    _image = image;
    _category = category;
    _product = product;
}

  BannerData.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
    _category = json['category'];
    _product = json['product'];
  }
  num? _id;
  String? _image;
  dynamic _category;
  dynamic _product;

  num? get id => _id;
  String? get image => _image;
  dynamic get category => _category;
  dynamic get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    map['category'] = _category;
    map['product'] = _product;
    return map;
  }

}