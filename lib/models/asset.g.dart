// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Asset _$AssetFromJson(Map<String, dynamic> json) => Asset(
      Collection.fromJson(json['collection'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AssetToJson(Asset instance) => <String, dynamic>{
      'collection': instance.collection,
    };

Collection _$CollectionFromJson(Map<String, dynamic> json) => Collection(
      json['version'] as String,
      json['href'] as String,
      (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'version': instance.version,
      'href': instance.href,
      'items': instance.items,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      json['href'] as String,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'href': instance.href,
    };
