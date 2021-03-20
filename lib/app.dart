import 'package:flutter/material.dart';

import 'components.dart';
import 'constants.dart';
import 'drawer.dart';
import 'enddrawer.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  GlobalKey<ScaffoldState> _appScaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _appScaffoldKey,
      drawer: LeftDrawer(),
      endDrawer: EndDrawer(),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          PageView(
            scrollDirection: Axis.vertical,
            children: [
              MainContentViewBuilder(
                color: Colors.redAccent,
              ),
            ],
          ),
          Positioned(
            top: 50,
            left: 25,
            right: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.menu,
                    color: kWhiteColor,
                  ),
                  onTap: () => _appScaffoldKey.currentState.openDrawer(),
                ),
                Text(
                  'Random',
                  style: kAvertaTextStyle.copyWith(color: kWhiteColor),
                ),
                GestureDetector(
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: kWhiteColor,
                  ),
                  onTap: () => _appScaffoldKey.currentState.openEndDrawer(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
