import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marvel_app/presentaion/common/widgets/custom_marvel_navigation_bar.dart';
import 'package:marvel_app/shared/cubits/home_cubit/home_cubit.dart';
import 'package:marvel_app/services/auth/authentication.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context)
      ..getMovies()
      ..getSeries();
    final user = getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child:
                IndexedStack(index: cubit.currnetIndex, children: cubit.pages),
          ),
          floatingActionButton: CustomMarvelNavigationBar(
              currentIndex: cubit.currnetIndex, onTap: cubit.changeIndex),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
