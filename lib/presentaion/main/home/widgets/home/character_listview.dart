import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/domain/models/marvel/character.dart';

class CharacterListview extends StatelessWidget {
  const CharacterListview({
    super.key,
    required this.items,
  });
  final List<CharacterModel> items;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 16),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: AspectRatio(
              aspectRatio: 2 / 3,
              child: SizedBox(
                child: CachedNetworkImage(
                  imageUrl: items[index].thumbnail,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 12),
      ),
    );
  }
}
