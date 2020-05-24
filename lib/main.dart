import 'package:covid19/data_source.dart';
import 'package:covid19/home_page.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) {
        return ThemeData(
            primaryColor: primaryBlack,
            fontFamily: 'Cobin',
            brightness: brightness == Brightness.light
                ? Brightness.light
                : Brightness.dark,
            scaffoldBackgroundColor: brightness == Brightness.dark
                ? Colors.blueGrey[900]
                : Colors.white);
      },
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: HomePage(),
        );
      },
    );
  }
}
