import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsworlds/components/detailed_components.dart';

import '../models/mymodels.dart';

class Search extends StatefulWidget {
  String? searchedData;
  Search(this.searchedData);
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int? outputtedIndex;

  Autogenerated? autogenerated;

  @override
  void initState() {
    super.initState();
    detailedComponents
        .getData(widget.searchedData)
        .then((value) => autogenerated = value);

    setState(() {});
  }

  DetailedComponents detailedComponents = DetailedComponents();
  @override
  String Screen = 'SearchScreen';
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: theme.primaryColor,
          title: Text(
            widget.searchedData!,
            style: textTheme.subtitle1!
                .copyWith(fontWeight: FontWeight.w700, fontSize: 26.0),
          ),
        ),
        body: detailedComponents.buildDetailFutureBuilder(widget.searchedData),
      ),
    );
  }
}
