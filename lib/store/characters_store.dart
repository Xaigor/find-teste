import 'package:find_test/state/characters_state.dart';
import 'package:flutter/material.dart';

import '../services/api_service.dart';

class CharactersStore extends ValueNotifier<CharactersState> {
  final ApiService _apiService = ApiService();

  CharactersStore() : super(InitialCharactersState()) {
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    value = LoadingCharactersState();
    carregarDados();
  }

  Future<void> fetchSpecificCharacter(String name) async {
    value = LoadingCharactersState();
    try {
      var characters = await _apiService.fetchSpecificCharacter(name);
      value = SuccessCharactersState(characters: characters);
    } catch (e) {
      value = ErrorCharactersState(e.toString());
    }
  }

  Future<void> carregarDados() async {
    try {
      var characters = await _apiService.fetchCharacters();
      value = SuccessCharactersState(characters: characters);
    } catch (e) {
      value = ErrorCharactersState(e.toString());
    }
  }
}
