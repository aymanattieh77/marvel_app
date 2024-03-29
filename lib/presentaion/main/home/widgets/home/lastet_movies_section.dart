import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/app/res/strings.dart';

import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/app/utils/functions.dart';
import 'package:marvel_app/presentaion/common/state_renderer/custom_error_widget.dart';
import 'package:marvel_app/presentaion/common/state_renderer/lastet_movie_series_loading.dart';
import 'package:marvel_app/shared/cubits/home_cubit/home_cubit.dart';

import 'lastet_movies_series_listview.dart';

class LastetMoviesSection extends StatelessWidget {
  const LastetMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: AppPadding.p12),
          child: Text(AppStrings.lastetMovies, style: AppStyles.textstyle24),
        ),
        const SizedBox(height: AppSizes.s10),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is MovieSeriesLoading) {
              return const LastetMovieSeriesLoading();
            } else if (state is MovieSeriesFailure) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showCustomDialog(
                    context, CustomErrorWidget(message: state.message));
              });
              return Container();
            } else if (state is MovieSeriesLoaded) {
              final movies = BlocProvider.of<HomeCubit>(context).movies;
              return LastetMoviesSeriesListView(items: movies);
            } else {
              return Container();
            }
          },
        ),
        const SizedBox(height: AppSizes.s24),
      ],
    );
  }
}
