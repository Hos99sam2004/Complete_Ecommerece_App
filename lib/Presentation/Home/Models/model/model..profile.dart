import 'data..profile.dart';

class Model {
  bool? status;
  dynamic message;
  Data? data;

  Model({this.status, this.message, this.data});

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
