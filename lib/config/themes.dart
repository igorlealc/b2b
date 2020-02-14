import 'package:flutter/material.dart';

const brightness = Brightness.light;
const primaryColor = const Color(0xFF00C569);
const lightColor = const Color(0xFFFFFFFF);
const backgroundColor = const Color(0xFFF5F5F5);

ThemeData jcomTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
     textTheme: new TextTheme(
       //body1: new TextStyle(color: Colors.red),
       display1: new TextStyle(fontSize: 18),
       //button: new TextStyle(color: Colors.green),
       //headline: new TextStyle(color: Colors.deepPurple)
    ),
    // tabBarTheme:
    // accentIconTheme:
    // accentTextTheme:
    // appBarTheme:
    // bottomAppBarTheme:
     buttonTheme: new ButtonThemeData(
       buttonColor: Colors.blue,
       textTheme: ButtonTextTheme.primary,
     ),
    // cardTheme: CardTheme(
    //   elevation: 5,
    //   color: Colors.indigo,
    // ),
    // chipTheme:
    // dialogTheme:
    // floatingActionButtonTheme:
    // iconTheme:
    // inputDecorationTheme:
    // pageTransitionsTheme:
    // primaryIconTheme:
    // primaryTextTheme:
    // sliderTheme:
    primaryColor: Color(0xFF666666),
    accentColor: Color(0xFFe9e9e9),
    // fontFamily: 'Montserrat',
    buttonColor: Color(0xFF424242),

    // cardColor: Colors.white,
  );
}

ThemeData devTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    textTheme: new TextTheme(
      //body1: new TextStyle(color: Colors.red),
      display1: new TextStyle(fontSize: 18),
      //button: new TextStyle(color: Colors.green),
      //headline: new TextStyle(color: Colors.deepPurple)
    ),
    // tabBarTheme:
    // accentIconTheme:
    // accentTextTheme:
    // appBarTheme:
    // bottomAppBarTheme:
    buttonTheme: new ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
    ),
    // cardTheme: CardTheme(
    //   elevation: 5,
    //   color: Colors.indigo,
    // ),
    // chipTheme:
    // dialogTheme:
    // floatingActionButtonTheme:
    // iconTheme:
    // inputDecorationTheme:
    // pageTransitionsTheme:
    // primaryIconTheme:
    // primaryTextTheme:
    // sliderTheme:
    primaryColor: Color(0xFF01579b),
    accentColor: Color(0xFFe9e9e9),
    // fontFamily: 'Montserrat',
    buttonColor: Color(0xFF01579b),
    // // scaffoldBackgroundColor: backgroundColor,
    // cardColor: Colors.white,
  );
}

ThemeData maroniTheme() {
  return ThemeData(
  primarySwatch: Colors.green,
  brightness: Brightness.light,
  textTheme: new TextTheme(
  //body1: new TextStyle(color: Colors.red),
  display1: new TextStyle(fontSize: 18),
  //button: new TextStyle(color: Colors.green),
  //headline: new TextStyle(color: Colors.deepPurple)
  ),
  // tabBarTheme:
  // accentIconTheme:
  // accentTextTheme:
  // appBarTheme:
  // bottomAppBarTheme:
  buttonTheme: new ButtonThemeData(
  buttonColor: Colors.blue,
  textTheme: ButtonTextTheme.primary,
  ),
  // cardTheme: CardTheme(
  //   elevation: 5,
  //   color: Colors.indigo,
  // ),
  // chipTheme:
  // dialogTheme:
  // floatingActionButtonTheme:
  // iconTheme:
  // inputDecorationTheme:
  // pageTransitionsTheme:
  // primaryIconTheme:
  // primaryTextTheme:
  // sliderTheme:
  primaryColor: Color(0xFF424242),
  accentColor: Color(0xFFf5f5f5),
  // fontFamily: 'Montserrat',
  buttonColor: Color(0xFF00A656),
  // // scaffoldBackgroundColor: backgroundColor,
  // cardColor: Colors.white,
  );
}