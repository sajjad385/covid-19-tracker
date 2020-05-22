import 'package:covid19/data_source.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primaryColor: primaryBlack,
  ),
  home: HomePage(),
));