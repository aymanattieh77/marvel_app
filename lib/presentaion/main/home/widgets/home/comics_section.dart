import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/app/res/res.dart';
import 'package:marvel_app/app/utils/functions.dart';
import 'package:marvel_app/presentaion/common/state_renderer/custom_error_widget.dart';
import 'package:marvel_app/presentaion/common/state_renderer/trending_today_loading.dart';
import 'package:marvel_app/presentaion/main/home/widgets/home/comics_listview.dart';
import 'package:marvel_app/shared/cubits/marvel_cubit/marvel_cubit.dart';

class ComicsSection extends StatelessWidget {
  const ComicsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: AppPadding.p12),
          child: Text(AppStrings.comics, style: AppStyles.textstyle24),
        ),
        const SizedBox(height: AppSizes.s10),
        BlocBuilder<MarvelCubit, MarvelState>(builder: (context, state) {
          if (state is CharactersComicsLoading) {
            return const TrendingTodayLoading();
          } else if (state is CharactersComicsFailure) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showCustomDialog(
                  context, CustomErrorWidget(message: state.message));
            });
            return Container();
          } else if (state is CharactersComicsSuccess) {
            final comics = BlocProvider.of<MarvelCubit>(context).comics;
            return ComicsListview(items: comics);
          } else {
            return Container(height: 20, color: Colors.yellowAccent);
          }
        }),
        const SizedBox(height: AppSizes.s24),
      ],
    );
  }
}
