import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:newsworlds/components/detailed_components.dart';

import '../models/mymodels.dart';
import 'chipsrow.dart';

class ChipsScreen extends StatefulWidget {
  final String? recievedQuery;

  ChipsScreen({
    Key? key,
    required this.schemeIndex,
    required this.onSchemeChanged,
    required this.themeMode,
    required this.onThemeModeChanged,
    required this.flexSchemeData,
    this.recievedQuery,
  }) : super(key: key);
  final int schemeIndex;
  final ValueChanged<int> onSchemeChanged;
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;
  final FlexSchemeData flexSchemeData;

  @override
  _ChipsScreenState createState() => _ChipsScreenState();
}

class _ChipsScreenState extends State<ChipsScreen> {
  List<String> choices = [];
  int defaultChoiceIndex = 0;
  String? query;
  String Screen = 'ChipsDetailScreen';

  Autogenerated? autogenerated;

  @override
  void initState() {
    super.initState();
    choices = ['All', 'Events', 'Politics', 'Sports', 'Weather'];
    detailedComponents
        .getData(widget.recievedQuery)
        .then((value) => autogenerated = value);
    setState(() {});
  }

  DetailedComponents detailedComponents = DetailedComponents();
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    // final TextStyle headline4 = textTheme.headline4!;
    return MaterialApp(
      theme: theme,
      home: Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: theme.primaryColor,
            title: Center(
              child: Text(
                widget.recievedQuery!,
                style: textTheme.subtitle1!
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 28.0),
              ),
            ),
            //  backgroundColor: Colors.purple[900],
          ),
          body: Column(
            children: [
              ChoiceChips(),
              Flexible(
                  child: detailedComponents
                      .tbuildDetailFutureBuilder(widget.recievedQuery)),
            ],
          )),
    );
  }

  Widget ChoiceChips() {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: choices.length,
        itemBuilder: (BuildContext context, int index) {
          return Wrap(children: [
            ChoiceChip(
              label: Text(
                choices[index],
                style: textTheme.headline6!
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 17.0),
              ),
              backgroundColor: theme.secondaryHeaderColor,
              selectedColor: theme.indicatorColor,
              padding: EdgeInsets.all(9.0),
              elevation: 6.0,
              selected: defaultChoiceIndex == index,
              onSelected: (bool isSelected) {
                setState(() {
                  defaultChoiceIndex = isSelected ? index : 0;
                  query = choices[index];
                  query == 'All'
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChipsRow(
                                    schemeIndex: widget.schemeIndex,
                                    onSchemeChanged: widget.onSchemeChanged,
                                    themeMode: widget.themeMode,
                                    onThemeModeChanged:
                                        widget.onThemeModeChanged,
                                    flexSchemeData: widget.flexSchemeData,
                                  )))
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChipsScreen(
                                    schemeIndex: widget.schemeIndex,
                                    onSchemeChanged: widget.onSchemeChanged,
                                    recievedQuery: query,
                                    themeMode: widget.themeMode,
                                    onThemeModeChanged:
                                        widget.onThemeModeChanged,
                                    flexSchemeData: widget.flexSchemeData,
                                  )));
                });
              },
              //   selectedColor: Colors.purple[900]),
            )
          ]);
        },
      ),
    );
  }
}
