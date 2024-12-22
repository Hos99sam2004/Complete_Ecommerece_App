import 'package:collection/collection.dart';

import 'data.dart';

class Search {
  bool? status;
  dynamic message;
  Data? data;

  Search({this.status, this.message, this.data});

  factory Search.fromModel(Map<String, dynamic> json) => Search(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        data: json['data'] == null
            ? null
            : Data.fromModel(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toModel() => {
        'status': status,
        'message': message,
        'data': data?.toModel(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Search) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toModel(), toModel());
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}
