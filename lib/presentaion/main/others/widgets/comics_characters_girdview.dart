import 'package:flutter/material.dart';

import 'package:marvel_app/domain/models/marvel/character.dart';
import 'package:marvel_app/domain/models/marvel/comics.dart';

import 'package:cached_network_image/cached_network_image.dart';

class ComicsCharactersGridview<T> extends StatelessWidget {
  const ComicsCharactersGridview({
    super.key,
    required this.items,
  });
  final List<T> items;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 23),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2.7 / 4),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {},
              child: CachedNetworkImage(
                imageUrl: getImageUrl(index),
                fit: BoxFit.cover,
              ));
        },
      ),
    );
  }

  String getImageUrl(int index) {
    if (items is List<ComicsModel>) {
      final res = items as List<ComicsModel>;
      return res[index].thumbnail;
    } else {
      final res = items as List<CharacterModel>;
      return res[index].thumbnail;
    }
  }
}
