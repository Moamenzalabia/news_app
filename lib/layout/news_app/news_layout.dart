import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/modules/news_app/search/search_screen.dart';
import 'package:news_app/shared/app_cubit/app_cubit.dart';
import 'package:news_app/shared/components/app_navigator.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.getNewsCubit(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions: [
              IconButton(
                onPressed: () {
                  var nav = AppNavigator(context: context, nextScreen: SearchScreen());
                nav.navigateToNext();
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  AppCubit.getAppCubit(context).changeAppMode();
                },
                icon: const Icon(Icons.brightness_4_outlined),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeCurrentIndex(index);
            },
            items: cubit.bottomItems,
          ),
        );
      },
    );
  }
}
