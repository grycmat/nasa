import 'package:json_annotation/json_annotation.dart';

part 'apod.g.dart';

@JsonSerializable()
class Apod {
  Apod(this.date, this.copyright, this.explanation, this.hdurl, this.media_type,
      this.service_version, this.title, this.url);
  String date;
  String copyright;
  String explanation;
  String hdurl;
  String media_type;
  String service_version;
  String title;
  String url;

  factory Apod.fromJson(Map<String, dynamic> json) => _$ApodFromJson(json);

  Map<String, dynamic> toJson() => _$ApodToJson(this);
}
