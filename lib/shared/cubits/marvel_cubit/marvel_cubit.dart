import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/domain/models/marvel/character.dart';
import 'package:marvel_app/domain/models/marvel/comics.dart';
import 'package:marvel_app/domain/repository/marvel_repository.dart';

part 'marvel_state.dart';

class MarvelCubit extends Cubit<MarvelState> {
  MarvelCubit(this._marvelRepository) : super(MarvelInitial());

  final MarvelRepository _marvelRepository;

  List<ComicsModel> comics = [];
  List<CharacterModel> characters = [];
  int tabIndex = 0;

  changeTabIndex(int index) {
    tabIndex = index;
    emit(CharacterComicsTabIndexChange());
    loadedCharcatersComics();
  }

  List<dynamic> getComicsOrCharacters() {
    if (tabIndex == 1) {
      return comics;
    } else {
      return characters;
    }
  }

  loadedCharcatersComics() {
    if (comics.isNotEmpty && characters.isNotEmpty) {
      emit(CharactersComicsSuccess(comics));
    } else {
      getCharacters();
      getComics();
    }
  }

  void getComics() async {
    emit(CharactersComicsLoading());

    (await _marvelRepository.getComics()).fold(
      (failure) {
        emit(CharactersComicsFailure(failure.message));
      },
      (comicsList) {
        comics = comicsList;
        emit(CharactersComicsSuccess<ComicsModel>(comics));
      },
    );
  }

  void getCharacters() async {
    emit(CharactersComicsLoading());

    (await _marvelRepository.getCharacter()).fold(
      (failure) {
        emit(CharactersComicsFailure(failure.message));
      },
      (charactersList) {
        characters = charactersList;
        emit(CharactersComicsSuccess<CharacterModel>(characters));
      },
    );
  }
}
