import 'package:json_annotation/json_annotation.dart';

part 'invidiousServerSoftware.g.dart';

@JsonSerializable()
class InvidiousServerSoftware {
  String name;
  String version;
  String branch;

  InvidiousServerSoftware(this.name, this.version, this.branch);

  factory InvidiousServerSoftware.fromJson(Map<String, dynamic> json) =>
      _$InvidiousServerSoftwareFromJson(json);

  Map<String, dynamic> toJson() => _$InvidiousServerSoftwareToJson(this);
}
