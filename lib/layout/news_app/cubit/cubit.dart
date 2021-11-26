import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/modules/news_app/business/business.dart';
import 'package:news_app/modules/news_app/science/science.dart';
import 'package:news_app/modules/news_app/settings/settings_screen.dart';
import 'package:news_app/modules/news_app/sports/sports.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit getNewsCubit(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<dynamic> newsDataList = [];
  List<dynamic> newsSearchList = [];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: 'Settings',
    ),
  ];

  void changeCurrentIndex(int index) {
    currentIndex = index;
    if (index == 1) getNewsData(category: 'sports', searchKey: '');
    if (index == 2) getNewsData(category: 'science', searchKey: '');
    emit(NewsBottomNavState());
  }

  void getNewsData({String category = '', String searchKey = ''}) {
    emit(GetNewsLoadingState());
    newsDataList = [];
    Map<String, dynamic> query;
    String url;
    if (searchKey == '') {
      url = 'v2/top-headlines';
      query = {
        'country': 'eg',
        'category': '$category',
        'apiKey': 'd1e6537ad22f487a921c38829a98e9e1',
      };
    } else {
      url = 'v2/everything';
      query = {
        'q': '$searchKey',
        'apiKey': 'd1e6537ad22f487a921c38829a98e9e1',
      };
    }

    DioHelper.getData(url: url, query: query).then((value) {
      if (searchKey == '') {
        newsDataList = value.data['articles'];
      } else {
        newsSearchList = value.data['articles'];
      }
      emit(GetNewsSuccessState());
    }).catchError((error) {
      print('error ${error.toString()}');
      emit(GetNewsErrorState(error.toString()));
    });
  }
}
