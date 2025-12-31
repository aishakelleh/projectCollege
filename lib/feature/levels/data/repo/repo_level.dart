import 'package:projectfourthyear/feature/levels/data/api/api_service_level.dart';
import 'package:projectfourthyear/feature/levels/model/request/request_level.dart';
import 'package:projectfourthyear/feature/levels/model/response/response_level.dart';

class RepoLevel {
  final ApiServiceLevel apiServiceLevel;

  RepoLevel({required this.apiServiceLevel});

  Future<List<ResponseLevel>> getLevels() async {
    return await apiServiceLevel.getLevel();
  }

  Future<ResponseLevel> createLevel(RequestLevel requestLevel) async {
    return await apiServiceLevel.postLevel(requestLevel);
  }

  Future<ResponseLevel> editLevel(RequestLevel requestLevel, int id) async {
    return await apiServiceLevel.putLevel(requestLevel, id);
  }

  Future<void> cancelLevel(int id) async {
    await apiServiceLevel.deleteLevel(id);
  }
}
