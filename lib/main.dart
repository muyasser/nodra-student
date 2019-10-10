import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nodra_student/providers/materials_data_provider.dart';
import 'package:nodra_student/providers/page_provider.dart';
import 'package:nodra_student/ui/styles/style_consts.dart';
import 'package:provider/provider.dart';
import 'app.dart';

final _themeData = ThemeData(
  primaryColor: kPrimaryColor,
  accentColor: kSecondaryColor,
);

void main() {
  //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<PageProvider>.value(
        value: PageProvider(),
      ),
      ChangeNotifierProvider<MaterialsDataProvider>.value(
        value: MaterialsDataProvider(),
      ),
    ],
    child: MaterialApp(
      theme: _themeData,
      home: App(),
    ),
  ));
}
