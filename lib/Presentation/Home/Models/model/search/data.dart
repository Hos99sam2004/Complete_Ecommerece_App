import 'package:collection/collection.dart';

import 'datum.dart';

class Data {
  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Data.fromModel(Map<String, dynamic> json) => Data(
        currentPage: json['current_page'] as int?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromModel(e as Map<String, dynamic>))
            .toList(),
        firstPageUrl: json['first_page_url'] as String?,
        from: json['from'] as int?,
        lastPage: json['last_page'] as int?,
        lastPageUrl: json['last_page_url'] as String?,
        nextPageUrl: json['next_page_url'] as dynamic,
        path: json['path'] as String?,
        perPage: json['per_page'] as int?,
        prevPageUrl: json['prev_page_url'] as dynamic,
        to: json['to'] as int?,
        total: json['total'] as int?,
      );

  Map<String, dynamic> toModel() => {
        'current_page': currentPage,
        'data': data?.map((e) => e.toModel()).toList(),
        'first_page_url': firstPageUrl,
        'from': from,
        'last_page': lastPage,
        'last_page_url': lastPageUrl,
        'next_page_url': nextPageUrl,
        'path': path,
        'per_page': perPage,
        'prev_page_url': prevPageUrl,
        'to': to,
        'total': total,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Data) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toModel(), toModel());
  }

  @override
  int get hashCode =>
      currentPage.hashCode ^
      data.hashCode ^
      firstPageUrl.hashCode ^
      from.hashCode ^
      lastPage.hashCode ^
      lastPageUrl.hashCode ^
      nextPageUrl.hashCode ^
      path.hashCode ^
      perPage.hashCode ^
      prevPageUrl.hashCode ^
      to.hashCode ^
      total.hashCode;
}
