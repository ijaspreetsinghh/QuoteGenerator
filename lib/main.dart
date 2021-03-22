import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quote_generator/data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app.dart';
import 'constants.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
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
          home: FlutterApp(),
        ),
      ),
    );
  }
}

class FlutterApp extends StatefulWidget {
  @override
  _FlutterAppState createState() => _FlutterAppState();
}

class _FlutterAppState extends State<FlutterApp> {
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Error',
              style: kAvertaTextStyle.copyWith(
                color: kGrayColor,
                fontSize: 16.0,
              ),
            )
          ],
        ),
      );
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              backgroundColor: kWhiteColor,
              valueColor: AlwaysStoppedAnimation<Color>(kWhiteColor),
            ),
          ],
        ),
      );
    }

    return App(
      selectedCategory: 'random',
    );
  }
}
