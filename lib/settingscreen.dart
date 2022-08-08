import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';
import 'settingdetails.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({
    Key? key,
    required this.schemeIndex,
    required this.onSchemeChanged,
    required this.themeMode,
    required this.onThemeModeChanged,
    required this.flexSchemeData,
  }) : super(key: key);
  final int schemeIndex;
  final ValueChanged<int> onSchemeChanged;
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;
  final FlexSchemeData flexSchemeData;
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String selectedTheme = 'money';
  @override
  // DropdownButton<String> dropDownMenuData() {
  //   List<DropdownMenuItem<String>> dropdownItems = [];
  //   for (String theme in availabeThemes) {
  //     var newItem = DropdownMenuItem(child: Text(theme), value: theme);
  //     dropdownItems.add(newItem);
  //   }
  //   return DropdownButton(
  //     value: selectedTheme,
  //     items: dropdownItems,
  //     onChanged: (value) {
  //       setState(() {
  //         selectedTheme = value!;
  //         Navigator.pop(context, selectedTheme);
  //       });
  //     },
  //   );
  // }

  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;
    final TextStyle headline4 = textTheme.headline4!;
    final bool isLight = Theme.of(context).brightness == Brightness.light;

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: theme.primaryColor,
          title: Center(
            child: Text(
              'Settings',
              style: textTheme.subtitle1!
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 26.0),
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(24.0),
          child: ListView(
            children: [
              SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.people_alt_sharp,
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'General',
                    style: textTheme.subtitle1!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 26.0),
                  ),
                ],
              ),
              Divider(thickness: 1, height: 20.0),
              SizedBox(
                height: 10.0,
              ),
              buildSettingOptions(
                  context, 'Change Language', textTheme, Icons.public),
              buildSettingOptions(
                  context, 'How to use', textTheme, Icons.description),
              buildSettingOptions(context, 'About us', textTheme,
                  Icons.assignment_late_outlined),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.palette_rounded, size: 35.0),
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(
                      'Themes',
                      style: textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 17.0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: FlexThemeModeSwitch(
                  themeMode: widget.themeMode,
                  onThemeModeChanged: widget.onThemeModeChanged,
                  flexSchemeData: widget.flexSchemeData,
                ),
              ),
              const Divider(),
              PopupMenuButton<int>(
                padding: EdgeInsets.zero,
                onSelected: widget.onSchemeChanged,
                itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                  for (int i = 0; i < myFlexSchemes.length; i++)
                    PopupMenuItem<int>(
                      value: i,
                      child: ListTile(
                        leading: Icon(Icons.lens,
                            color: isLight
                                ? myFlexSchemes[i].light.primary
                                : myFlexSchemes[i].dark.primary,
                            size: 35),
                        title: Text(myFlexSchemes[i].name),
                      ),
                    )
                ],
                child: ListTile(
                  title:
                      Text('${myFlexSchemes[widget.schemeIndex].name} theme'),
                  subtitle: Text(myFlexSchemes[widget.schemeIndex].description),
                  trailing: Icon(
                    Icons.lens,
                    color: colorScheme.primary,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildSettingOptions(
      BuildContext context, String title, textTheme, icon) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SettingDetails()));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 20.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, size: 35.0),
            SizedBox(width: 30.0),
            Text(
              title,
              style: textTheme.headline6!
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 17.0),
            ),
          ],
        ),
      ),
    );
  }
}
