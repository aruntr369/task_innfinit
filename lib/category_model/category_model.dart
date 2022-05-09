import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  @JsonKey(name: 'Status')
  String? status;
  @JsonKey(name: 'Data')
  List<Datum>? data;
  @JsonKey(name: 'Message')
  String? message;

  CategoryModel({this.status, this.data, this.message});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return _$CategoryModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
