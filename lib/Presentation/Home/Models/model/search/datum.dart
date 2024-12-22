import 'package:collection/collection.dart';

class Datum {
  int? id;
  double? price;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  Datum({
    this.id,
    this.price,
    this.image,
    this.name,
    this.description,
    this.images,
    this.inFavorites,
    this.inCart,
  });

  factory Datum.fromModel(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        price: (json['price'] as num?)?.toDouble(),
        image: json['image'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        images: json['images'] as List<String>?,
        inFavorites: json['in_favorites'] as bool?,
        inCart: json['in_cart'] as bool?,
      );

  Map<String, dynamic> toModel() => {
        'id': id,
        'price': price,
        'image': image,
        'name': name,
        'description': description,
        'images': images,
        'in_favorites': inFavorites,
        'in_cart': inCart,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Datum) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toModel(), toModel());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      price.hashCode ^
      image.hashCode ^
      name.hashCode ^
      description.hashCode ^
      images.hashCode ^
      inFavorites.hashCode ^
      inCart.hashCode;
}
