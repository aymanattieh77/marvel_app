import 'package:flutter/material.dart';

import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/domain/models/move_series/movie_series_model.dart';
import 'package:marvel_app/presentaion/main/home/widgets/detail/cast_movie_series_listview.dart';
import 'package:marvel_app/presentaion/main/home/widgets/detail/download_watchlist_section.dart';
import 'package:marvel_app/presentaion/main/home/widgets/detail/more_movie_series_listview.dart';
import 'package:marvel_app/presentaion/main/home/widgets/detail/trailer_movie_series_card.dart';

import '../widgets/detail/card_details_section.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.movieSeriesModel});
  final MovieSeriesModel? movieSeriesModel;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int currnetTab = 0;

  @override
  Widget build(BuildContext context) {
    final data =
        'Super Hero partners Scott Lang and Hope Van Dyne return to continue their adventures as Ant-Man and The Wasp. Together, with Hope’s parents Hank Pym and Janet Van Dyne, the family finds themselves exploring the Quantum Realm, interacting with strange new creatures, and embarking on an adventure that will push them beyond the limits of what they thought was possible.';
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CardDetailsSection(
                    imageUrl: widget.movieSeriesModel!.coverUrl,
                    title: widget.movieSeriesModel!.title),
                const SizedBox(height: AppSizes.s20),
                const DownloadWatchListSection(),
                const SizedBox(height: AppSizes.s16),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                  height: AppSizes.s150,
                  child: Text(
                    data,
                    style: AppStyles.textstyle14.copyWith(
                        color: AppColor.white, fontWeight: FontWeight.w400),
                    softWrap: true,
                  ),
                ),
                const SizedBox(height: AppSizes.s16),
                Container(
                  color: AppColor.white15,
                  child: TabBar(
                    onTap: (value) {
                      setState(() {
                        currnetTab = value;
                      });
                    },
                    indicatorColor: AppColor.red,
                    labelStyle: AppStyles.textstyle16,
                    unselectedLabelStyle: AppStyles.textstyle16,
                    unselectedLabelColor: AppColor.white,
                    // dividerColor: Colors.grey,

                    tabs: const [
                      Tab(
                        text: AppStrings.trailer,
                      ),
                      Tab(
                        text: AppStrings.cast,
                      ),
                      Tab(
                        text: AppStrings.more,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSizes.s16),
                _tabManager(currnetTab),
                const SizedBox(height: 150),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _tabManager(int tab) {
    if (tab == 1) {
      return const CastMovieSeriesListview();
    } else if (tab == 2) {
      return const MoreMovieSeriesListview();
    } else {
      return const TrailerMovieSeriesCard();
    }
  }
}
