import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  int? nItemGrpId;
  String? cGrpName;
  String? cGroupImage;

  Datum({this.nItemGrpId, this.cGrpName, this.cGroupImage});

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
