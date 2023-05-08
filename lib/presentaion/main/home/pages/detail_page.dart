import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/presentaion/main/home/widgets/detail/download_watchlist_section.dart';

import '../widgets/detail/card_details_section.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
                const CardDetailsSection(),
                const SizedBox(height: 20),
                const DownloadWatchListSection(),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 150,
                  child: Text(
                    data,
                    style: AppStyles.textstyle14.copyWith(
                        color: AppColor.white, fontWeight: FontWeight.w400),
                    softWrap: true,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  color: AppColor.white15,
                  child: const TabBar(
                    indicatorColor: AppColor.red,
                    labelStyle: AppStyles.textstyle16,
                    unselectedLabelStyle: AppStyles.textstyle16,
                    unselectedLabelColor: AppColor.white,
                    // dividerColor: Colors.grey,

                    tabs: [
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
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//  Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 34, vertical: 8.0),
//                         color: AppColor.white15,
//                         child: const Text(
//                           AppStrings.cast,
//                           style: AppStyles.textstyle16,
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 34, vertical: 8.0),
//                         color: AppColor.white15,
//                         child: const Text(
//                           AppStrings.trailer,
//                           style: AppStyles.textstyle16,
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 34, vertical: 8.0),
//                         color: AppColor.white15,
//                         child: const Text(
//                           AppStrings.more,
//                           style: AppStyles.textstyle16,
//                         ),
//                       ),
//                     ),
//                   ],
//                 )