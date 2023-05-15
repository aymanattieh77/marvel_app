part of 'marvel_cubit.dart';

abstract class MarvelState extends Equatable {
  const MarvelState();

  @override
  List<Object> get props => [];
}

class MarvelInitial extends MarvelState {}

class CharacterComicsTabIndexChange extends MarvelState {}

class CharacterComicsLoaded extends MarvelState {}

// class ComicsLoading extends MarvelState {}

// class ComicsFailure extends MarvelState {
//   final String message;
//   const ComicsFailure(this.message);
// }

// class ComicsSuccess extends MarvelState {
//   final List<ComicsModel> comics;
//   const ComicsSuccess(this.comics);
// }

// class CharactersLoading extends MarvelState {}

// class CharactersFailure extends MarvelState {
//   final String message;
//   const CharactersFailure(this.message);
// }

// class CharactersSuccess extends MarvelState {
//   final List<CharacterModel> characters;
//   const CharactersSuccess(this.characters);
// }

class CharactersComicsLoading extends MarvelState {}

class CharactersComicsFailure extends MarvelState {
  final String message;
  const CharactersComicsFailure(this.message);
}

class CharactersComicsSuccess<T> extends MarvelState {
  final List<T> items;
  const CharactersComicsSuccess(this.items);
}
