import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quote_generator/data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<Tags>(create: (context) => Tags()),
          ChangeNotifierProvider<Quotes>(create: (context) => Quotes()),
          ChangeNotifierProvider<Result>(create: (context) => Result())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: App(
            selectedCategory: 'random',
          ),
        ),
      ),
    );
  }
}
