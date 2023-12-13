import 'package:find_test/model/character_model.dart';
import 'package:find_test/repositories/api_repository.dart';

class ApiService {
  final repository = ApiRepository();

  Future<List<Results>> fetchCharacters() async {
    var result = await repository.fetchApi("/v1/public/characters?");
    return CharacterModel.fromMap(result).data.results;
  }

  Future<List<Results>> fetchSpecificCharacter(String name) async {
    var result = await repository.fetchApi("/v1/public/characters?name=$name&");
    return CharacterModel.fromMap(result).data.results;
  }
}
