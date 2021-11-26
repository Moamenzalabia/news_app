import 'package:flutter/material.dart';
import 'package:news_app/modules/news_app/web_view/WebView.dart';
import 'package:news_app/shared/components/app_navigator.dart';

class NewsItemWidget extends StatelessWidget {
  dynamic newsData;
  NewsItemWidget({
    required this.newsData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        var nav = AppNavigator(context: context, nextScreen: WebViewScreen('${newsData['url']}'));
        nav.navigateToNext();
      },
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                      '${newsData['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${newsData['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${newsData['publishedAt']}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
