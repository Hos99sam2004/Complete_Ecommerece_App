/// status : true
/// message : "Login done successfully"
/// data : {"id":65436,"name":"Hossam nasr","email":"nasr.Hossam@gmail.com","phone":"01017783841","image":"https://student.valuxapps.com/storage/uploads/users/moY7fYRHPy_1723415586.jpeg","points":0,"credit":0,"token":"J7vaKNPWlFALe4x01dWpaqOS2djmDWiwotoYjAG5ebzr5hAZPSepXi0ke2dHEXZ0D4ATEd"}

class LoginModel {
  LoginModel({
      bool? status, 
      String? message, 
      LoginData? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  LoginModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  LoginData? _data;

  bool? get status => _status;
  String? get message => _message;
  LoginData? get data => _data;

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

/// id : 65436
/// name : "Hossam nasr"
/// email : "nasr.Hossam@gmail.com"
/// phone : "01017783841"
/// image : "https://student.valuxapps.com/storage/uploads/users/moY7fYRHPy_1723415586.jpeg"
/// points : 0
/// credit : 0
/// token : "J7vaKNPWlFALe4x01dWpaqOS2djmDWiwotoYjAG5ebzr5hAZPSepXi0ke2dHEXZ0D4ATEd"

class LoginData {
  LoginData({
      num? id, 
      String? name, 
      String? email, 
      String? phone, 
      String? image, 
      num? points, 
      num? credit, 
      String? token,}){
    _id = id;
    _name = name;
    _email = email;
    _phone = phone;
    _image = image;
    _points = points;
    _credit = credit;
    _token = token;
}

  LoginData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _image = json['image'];
    _points = json['points'];
    _credit = json['credit'];
    _token = json['token'];
  }
  num? _id;
  String? _name;
  String? _email;
  String? _phone;
  String? _image;
  num? _points;
  num? _credit;
  String? _token;

  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get phone => _phone;
  String? get image => _image;
  num? get points => _points;
  num? get credit => _credit;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['image'] = _image;
    map['points'] = _points;
    map['credit'] = _credit;
    map['token'] = _token;
    return map;
  }

}