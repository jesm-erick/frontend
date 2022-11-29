import 'dart:ui';

class Figura {
  Image image;
  String id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  Figura(
      {required this.image,
      required this.id,
      required this.name,
      required this.createdAt,
      required this.updatedAt});
  factory Figura.fromJson(Map<String, dynamic> json) => Figura(
      image: Image.fromJson(json["image"]),
      id: json["_id"],
      name: json["name"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]));

  Map<String, dynamic> toJson() => {
        "image": image.toJson(),
        "_id": id,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
//

class Image {
  Image({
    required this.publicId,
    required this.secureUrl,
  });

  String publicId;
  String secureUrl;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        publicId: json["public_id"],
        secureUrl: json["secure_url"],
      );

  Map<String, dynamic> toJson() => {
        "public_id": publicId,
        "secure_url": secureUrl,
      };
}
