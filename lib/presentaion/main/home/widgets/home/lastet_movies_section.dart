import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/app/res/strings.dart';

import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/shared/cubits/home_cubit/home_cubit.dart';

import 'lastet_movies_series_listview.dart';

class LastetMoviesSection extends StatefulWidget {
  const LastetMoviesSection({super.key});

  @override
  State<LastetMoviesSection> createState() => _LastetMoviesSectionState();
}

class _LastetMoviesSectionState extends State<LastetMoviesSection> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getMovies();
  }

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
        // lastet movies section
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is MovieSeriesLoading) {
              return const CircularProgressIndicator();
            } else if (state is MovieSeriesFailure) {
              return Container(height: 20, color: Colors.red);
            } else if (state is MovieSeriesLoaded) {
              final movies = BlocProvider.of<HomeCubit>(context).movies;
              return LastetMoviesSeriesListView(items: movies);
            } else {
              return Container(height: 20, color: Colors.yellowAccent);
            }
          },
        ),
        const SizedBox(height: AppSizes.s24),
      ],
    );
  }
}
