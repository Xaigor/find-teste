import 'package:find_test/model/character_model.dart';
import 'package:find_test/repositories/api_repository.dart';

class ApiService {
  final repository = ApiRepository();
  var teste;

  Future<List<Results>> fetchCharacters() async {
    teste = await repository.fetchApi("/v1/public/characters?");
    var teste2 = CharacterModel.fromMap(teste);
    return teste2.data.results;
  }

  Future<List<Results>> fetchSpecificCharacter(String name) async {
    teste = await repository.fetchApi("/v1/public/characters?name=$name&");
    var teste2 = CharacterModel.fromMap(teste);
    return teste2.data.results;
  }
}
