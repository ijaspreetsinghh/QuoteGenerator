import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quote_generator/data.dart';

import 'components.dart';
import 'constants.dart';
import 'drawer.dart';
import 'enddrawer.dart';
import 'package:http/http.dart' as http;

class App extends StatefulWidget {
  final selectedCategory;
  App({@required this.selectedCategory});
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
  PageController _pageController = PageController();
  GlobalKey<ScaffoldState> _appScaffoldKey = GlobalKey();
  @override
  void initState() {
    getQuotes(widget.selectedCategory);
    Provider.of<Tags>(context, listen: false).gettingTags =
        Provider.of<Tags>(context, listen: false).getTags();
    super.initState();
  }

  Widget quoteBuilder(List<Result> result) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      itemCount: result.length,
      itemBuilder: (context, position) {
        return MainContentViewBuilder(
            color: kWhiteColor,
            author: result[position].author,
            content: result[position].content);
      },
    );
  }

  Future<List<Result>> getQuotes(String tag) async {
    tag = widget.selectedCategory == 'random'
        ? 'famous-quotes'
        : widget.selectedCategory;
    http.Response quoteResponse = await http.get(
        Uri.https('api.quotable.io', 'quotes', {'limit': '100', 'tags': tag}));
    final quotes = quotesFromJson(quoteResponse.body);

    return quotes.results;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Quotes>(
      builder: (context, q, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          key: _appScaffoldKey,
          drawer: LeftDrawer(
            selectedCategory: widget.selectedCategory,
          ),
          endDrawer: EndDrawer(),
          body: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                child: FutureBuilder(
                  builder: (context, snapshot) {
                    return snapshot.data == null
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      kPrimaryColor),
                                ),
                                SizedBox(
                                  height: kVPadding * 2,
                                ),
                                Text(
                                  'Loading Quotes',
                                  style: kAvertaTextStyle.copyWith(
                                    color: kGrayColor,
                                    fontSize: 16.0,
                                  ),
                                )
                              ],
                            ),
                          )
                        : quoteBuilder(snapshot.data);
                  },
                  future: getQuotes(widget.selectedCategory),
                ),
              ),
              Positioned(
                top: 50,
                left: 25,
                right: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Image(
                        image: AssetImage(
                          'assets/images/menu.png',
                        ),
                        height: 20,
                      ),
                      onTap: () => _appScaffoldKey.currentState.openDrawer(),
                    ),
                    Text(
                      capitalize(widget.selectedCategory) ?? 'Random',
                      style: kAvertaTextStyle.copyWith(color: kPrimaryColor),
                    ),
                    GestureDetector(
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(
                          'assets/images/logo.png',
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      onTap: () => _appScaffoldKey.currentState.openEndDrawer(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
