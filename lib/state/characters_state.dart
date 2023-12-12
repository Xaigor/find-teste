import '../model/character_model.dart';

abstract class CharactersState {}

class InitialCharactersState extends CharactersState {}

class LoadingCharactersState extends CharactersState {}

class SuccessCharactersState extends CharactersState {
  final List<Results> characters;

  SuccessCharactersState({required this.characters});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SuccessCharactersState && other.characters == characters;
  }

  @override
  int get hashCode => characters.hashCode;
}

class ErrorCharactersState implements CharactersState {
  final String message;

  ErrorCharactersState(this.message);
}
