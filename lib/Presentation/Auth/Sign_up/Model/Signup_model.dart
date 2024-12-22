/// status : true
/// message : "تم التسجيل بنجاح"
/// data : {"name":"null","phone":"145515787","email":"Hossamnasr@gmail.com","id":69356,"image":"https://student.valuxapps.com/storage/assets/defaults/user.jpg","token":"yGjZ9b2BosQ6t2k1EpoIaDXTNOONtvLKCA87nDcDvGcaMcyIRx60aybtc3uZdsN2L993O8"}

class SignupModel {
  SignupModel({
    bool? status,
    String? message,
    SignData? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  SignupModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? SignData.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  SignData? _data;

  bool? get status => _status;
  String? get message => _message;
  SignData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// name : "null"
/// phone : "145515787"
/// email : "Hossamnasr@gmail.com"
/// id : 69356
/// image : "https://student.valuxapps.com/storage/assets/defaults/user.jpg"
/// token : "yGjZ9b2BosQ6t2k1EpoIaDXTNOONtvLKCA87nDcDvGcaMcyIRx60aybtc3uZdsN2L993O8"

class SignData {
  SignData({
    String? name,
    String? phone,
    String? email,
    num? id,
    String? image,
    String? token,
  }) {
    _name = name;
    _phone = phone;
    _email = email;
    _id = id;
    _image = image;
    _token = token;
  }

  SignData.fromJson(dynamic json) {
    _name = json['name'];
    _phone = json['phone'];
    _email = json['email'];
    _id = json['id'];
    _image = json['image'];
    _token = json['token'];
  }
  String? _name;
  String? _phone;
  String? _email;
  num? _id;
  String? _image;
  String? _token;

  String? get name => _name;
  String? get phone => _phone;
  String? get email => _email;
  num? get id => _id;
  String? get image => _image;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['phone'] = _phone;
    map['email'] = _email;
    map['id'] = _id;
    map['image'] = _image;
    map['token'] = _token;
    return map;
  }
}
