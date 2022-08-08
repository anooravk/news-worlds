import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'screens/chipsrow.dart';

void main() =>
    runApp(MediaQuery(data: new MediaQueryData(), child: new MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF7489A1),
        body: MySplash(),
      ),
    );
  }
}

class MySplash extends StatefulWidget {
  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> with TickerProviderStateMixin {
  AnimationController? _controller;
  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(seconds: (5)),
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Lottie.asset(
        'asset/news.json',
        controller: _controller,
        height: MediaQuery.of(context).size.height * 1,
        animate: true,
        onLoaded: (composition) {
          _controller!
            ..duration = composition.duration
            ..forward().whenComplete(() => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()),
                ));
        },
      ),
    );
  }
}

final List<FlexSchemeData> myFlexSchemes = <FlexSchemeData>[
  ...FlexColor.schemesList,
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int themeIndex = 6;
  ThemeMode themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: FlexColorScheme.light(
          colors: myFlexSchemes[themeIndex].light,
          surfaceStyle: FlexSurface.medium,
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          fontFamily: 'Montserrat',
        ).toTheme,
        darkTheme: FlexColorScheme.dark(
          colors: myFlexSchemes[themeIndex].dark,
          surfaceStyle: FlexSurface.medium,
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          fontFamily: 'Montserrat',
        ).toTheme,
        themeMode: themeMode,
        home: ChipsRow(
            themeMode: themeMode,
            onThemeModeChanged: (ThemeMode mode) {
              setState(() {
                themeMode = mode;
              });
            },
            schemeIndex: themeIndex,
            onSchemeChanged: (int index) {
              setState(() {
                themeIndex = index;
              });
            },
            flexSchemeData: FlexColor.schemesList[themeIndex]));
  }
}
