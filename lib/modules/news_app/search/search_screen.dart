import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/modules/news_app/components/news_item_builder.dart';
import 'package:news_app/shared/components/outline_textfield_border.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var newsList = NewsCubit.getNewsCubit(context).newsSearchList;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: OutlineTextfieldBorder(
                    controller: searchController,
                    textInputType: TextInputType.text,
                    labelText: 'Search',
                    prefixIcon: Icons.search,
                    onChange: (value) {
                      NewsCubit.getNewsCubit(context).getNewsData(
                        category: '',
                        searchKey: value!,
                      );
                    },
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter search key';
                      } else {
                        return '';
                      }
                    },
                  ),
                ),
                Expanded(
                  child: NewsItemBuilder(
                    newsList: newsList,
                    isSearch: true,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
