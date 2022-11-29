import 'dart:ui';

class Welcome {
  Image image;
  String _id;
  String name;
  Welcome(
    this.image,
    this._id,
    this.name,
  );
}

class Image {
  String public_Id;
  String secure_Url;

  Image(this.public_Id, this.secure_Url);
}
