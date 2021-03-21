import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quote_generator/data.dart';

import 'app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
      child: MultiProvider(
        providers: [ChangeNotifierProvider<Tags>(create: (context) => Tags())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: App(),
        ),
      ),
    );
  }
}
