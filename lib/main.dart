import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notsy/pages/setup_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          button: TextStyle(color: Colors.white),
          subtitle2: TextStyle(color: Colors.black),
          subtitle1: TextStyle(color: Colors.black),
          overline: TextStyle(color: Colors.black),
          caption: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black),
          bodyText1: TextStyle(color: Colors.black),
          headline4: TextStyle(color: Colors.black),
          headline1: TextStyle(color: Colors.black),
          headline2: TextStyle(color: Colors.black),
          headline3: TextStyle(color: Colors.black),
          headline5: TextStyle(color: Colors.black),
          headline6: TextStyle(color: Colors.black),
        ),
        appBarTheme: AppBarTheme(
            toolbarHeight: 70,
            elevation: 0,
            titleSpacing: 0,
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            // titleTextStyle: TextStyle(
            //     color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            iconTheme: IconThemeData( size: 35)
            ),
        primarySwatch: MaterialColor(0xff010101, {
          50: Color(0xff010101).withOpacity(.1),
          100: Color(0xff010101).withOpacity(.2),
          200: Color(0xff010101).withOpacity(.3),
          300: Color(0xff010101).withOpacity(.4),
          400: Color(0xff010101).withOpacity(.5),
          500: Color(0xff010101).withOpacity(.6),
          600: Color(0xff010101).withOpacity(.7),
          700: Color(0xff010101).withOpacity(.8),
          800: Color(0xff010101).withOpacity(.9),
          900: Color(0xff010101),
        }),
      ),
      debugShowCheckedModeBanner: false,
      home: SetupPage(),
    );
  }
}
