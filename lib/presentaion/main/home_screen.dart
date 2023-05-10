import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marvel_app/presentaion/common/widgets/custom_marvel_navigation_bar.dart';
import 'package:marvel_app/shared/cubits/home_cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('build');
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
