import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_level.g.dart';

@JsonSerializable()
class RequestLevel {
  final String name;

  RequestLevel({required this.name});
  factory RequestLevel.fromJson(Map<String,dynamic>json)=>_$RequestLevelFromJson(json);
  Map<String,dynamic>toJson()=>_$RequestLevelToJson(this);
}
