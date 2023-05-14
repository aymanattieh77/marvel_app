// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marvel_app/app/res/strings.dart';

import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/domain/models/marvel/character.dart';
import 'package:marvel_app/domain/models/marvel/comics.dart';
import 'package:marvel_app/presentaion/common/widgets/custom_animated_toggle.dart';
import 'package:marvel_app/presentaion/main/downloads/widgets/comics_characters_girdview.dart';

import 'package:marvel_app/shared/cubits/marvel_cubit/marvel_cubit.dart';

class ComicsCharacterPage extends StatelessWidget {
  const ComicsCharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAnimatedToggle(
          values: const [AppStrings.charcaters, AppStrings.comics],
          onPress: (index) {
            BlocProvider.of<MarvelCubit>(context).changeTabIndex(index);
          },
        ),
        const SizedBox(height: AppSizes.s20),
        const SizedBox(height: AppSizes.s12),
        BlocBuilder<MarvelCubit, MarvelState>(
          builder: (context, state) {
            if (state is CharactersComicsLoading) {
              return const CircularProgressIndicator();
            } else if (state is CharactersComicsFailure) {
              return Container(height: 20, color: Colors.red);
            } else if (state is CharactersComicsSuccess) {
              final items =
                  BlocProvider.of<MarvelCubit>(context).getComicsOrCharacters();
              if (items is List<ComicsModel>) {
                return ComicsCharactersGridview(items: items);
              } else {
                return ComicsCharactersGridview(
                    items: items as List<CharacterModel>);
              }
            } else {
              return Container(
                height: 20,
                color: Colors.yellowAccent,
              );
            }
          },
        ),
      ],
    );
  }
}
