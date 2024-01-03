import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme= ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.deepOrange,
    appBarTheme: AppBarTheme(
        titleSpacing: 15.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0
        ),
        actionsIconTheme: IconThemeData(
            color: Colors.black
        ),
        iconTheme: IconThemeData(
            color: Colors.black
        )

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.red,
      elevation: 0.0,

    ),

    textTheme: TextTheme(
        headline6: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,

            color: Colors.black
        )

    )

);

ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor: HexColor('333739'),
    appBarTheme: AppBarTheme(
        backgroundColor: HexColor('333739'),
        elevation: 0.0,
        titleSpacing: 15.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('333739'),
          statusBarIconBrightness: Brightness.light,
        ),
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0
        ),
        actionsIconTheme: IconThemeData(
            color: Colors.white
        ),
        iconTheme: IconThemeData(
            color: Colors.white
        )

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: HexColor('333739'),
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.red,
      elevation: 0.0,

    ),
    textTheme: TextTheme(
        headline6: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white
        )

    )

);