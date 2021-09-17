import 'dart:convert';

class CityModel {
  int? id;
  bool? top;
  String? name;
  String? content;
  double? latitude;
  double? longitude;
  String? coverImageUrl;
  CityModel(
      {this.id,
      this.top,
      this.name,
      this.content,
      this.latitude,
      this.longitude,
      this.coverImageUrl});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'top': top,
      'name': name,
      'content': content,
      'latitude': latitude,
      'longitude': longitude,
      'cover_image_url': coverImageUrl,
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
        id: map['id'],
        top: map['top'],
        name: map['name'],
        content: map['content'],
        latitude: map['latitude'],
        longitude: map['longitude'],
        coverImageUrl: map['cover_image_url']);
  }

  String toJson() => json.encode(toMap());

  factory CityModel.fromJson(String source) =>
      CityModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CountryModel(id: $id, top: $top, name: $name)';
  }
}
