import 'package:json_annotation/json_annotation.dart';
part 'asset.g.dart';

@JsonSerializable()
class Asset {
  Collection collection;
  Asset(this.collection);

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);

  Map<String, dynamic> toJson() => _$AssetToJson(this);
}

@JsonSerializable()
class Collection {
  String version;
  String href;
  List<Item> items;

  Collection(this.version, this.href, this.items);

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}

@JsonSerializable()
class Item {
  String href;

  Item(this.href);

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
