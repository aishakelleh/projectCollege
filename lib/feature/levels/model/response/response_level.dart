import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_level.g.dart';
@JsonSerializable()
class ResponseLevel {
  final String name;
  final int id;

  ResponseLevel({required this.name, required this.id});
  factory ResponseLevel.fromJson(Map<String,dynamic>json)=>_$ResponseLevelFromJson(json);
  Map<String,dynamic>toJson()=>_$ResponseLevelToJson(this);
}