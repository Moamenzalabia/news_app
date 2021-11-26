import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'news_item_widget.dart';

class NewsItemBuilder extends StatelessWidget {
  dynamic newsList;
  bool isSearch;

  NewsItemBuilder({
    required this.newsList,
    this.isSearch = false,
  });

  @override
  Widget build(BuildContext context) {
    return Conditional.single(
      context: context,
      conditionBuilder: (context) => newsList.length > 0,
      widgetBuilder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => NewsItemWidget(newsData: newsList[index]),
        separatorBuilder: (context, index) => Padding(
          padding: EdgeInsetsDirectional.only(start: 20),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[300],
          ),
        ),
        itemCount: newsList.length,
      ),
      fallbackBuilder: (context) =>
          isSearch ? Container() : const Center(child: CircularProgressIndicator()),
    );
  }
}
