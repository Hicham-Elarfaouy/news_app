import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app5/modules/webview_screen.dart';
import 'package:intl/intl.dart';

Widget ListArticle ({
  required List<dynamic> list,
  bool isSearch = false,
}) => ConditionalBuilder(
  condition: isSearch ? true : list.length > 0,
  fallback: (context) => Center(child: CircularProgressIndicator()),
  builder: (context) => ListView.separated(
    physics: BouncingScrollPhysics(),
    itemCount: list.length,
    separatorBuilder: (context, index) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey,
      ),
    ),
    itemBuilder: (context, index) => InkWell(
      onTap: (){
        navigateTo(context, WebViewScreen(list[index]['url']));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(10),
                image: DecorationImage(
                  image: NetworkImage('${list[index]['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${list[index]['title']}',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${DateFormat('yyyy-MM-dd   hh:mm').format(DateTime.parse(list[index]['publishedAt']))}',
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ),
);

void navigateTo(context, widget){
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => widget,
    ),
  );
}