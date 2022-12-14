import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsworlds/screens/screen2cip.dart';

import '../models/mymodels.dart';

class DetailedComponents {
  String? title;
  String? description;
  String? urlToImage;

  Future<Autogenerated> getData(recievedQuery) async {
    http.Response data = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=${recievedQuery}&from=2021-10-16&sortBy=popularity&apiKey=4247934768314a6eb9606ece3e4c8b8d'));

    print("mycode is ${data.statusCode.toString()}");

    var jsonData = jsonDecode(data.body);
    return Autogenerated.fromJson(jsonData);
  }

  FutureBuilder<Autogenerated> buildDetailFutureBuilder(recievedQuery) {
    return FutureBuilder(
      future: getData(recievedQuery),
      builder: (BuildContext context, AsyncSnapshot<Autogenerated> snapshot) {
        if (snapshot.data == null) {
          return Container(
            height: 800,
            width: 600,
            child: Center(child: CircularProgressIndicator()),
          );
        } else {
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data!.articles!.length,
            itemBuilder: (BuildContext context, int index) {
              final ThemeData theme = Theme.of(context);
              final TextTheme textTheme = theme.textTheme;
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ChipsDetailScreen(index, recievedQuery)),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: theme.secondaryHeaderColor),
                  constraints: BoxConstraints(maxHeight: 300.0),
                  child: Stack(
                    children: [
                      Image.network(
                        snapshot.data!.articles![index].urlToImage.toString(),
                        fit: BoxFit.cover,
                        height: 180.0,
                        width: 400.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            snapshot.data!.articles![index].title.toString(),
                            style: textTheme.headline6!.copyWith(
                                fontWeight: FontWeight.w700, fontSize: 17.0),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Text(
                            snapshot.data!.articles![index].description
                                .toString(),
                            style: textTheme.headline6!.copyWith(
                                fontWeight: FontWeight.w300, fontSize: 14.0),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
