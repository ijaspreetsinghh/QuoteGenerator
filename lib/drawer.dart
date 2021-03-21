import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quote_generator/app.dart';
import 'constants.dart';
import 'data.dart';

class LeftDrawer extends StatefulWidget {
  final selectedCategory;
  LeftDrawer({@required this.selectedCategory});
  @override
  _LeftDrawerState createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  Widget tagsBuilder(List<Tags> tags) {
    return Scrollbar(
      isAlwaysShown: true,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        itemCount: tags.length,
        itemBuilder: (context, position) {
          return TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => App(
                            selectedCategory: tags[position].name,
                          )));
            },
            style: TextButton.styleFrom(
                primary: kGrayColor,
                padding: EdgeInsets.only(
                  bottom: kVPadding,
                  top: kVPadding,
                ),
                alignment: AlignmentDirectional.centerStart),
            child: Text(
              capitalize(tags[position].name),
              textAlign: TextAlign.left,
              style: kAvertaTextStyle.copyWith(
                color: tags[position].name == widget.selectedCategory
                    ? kPrimaryColor
                    : kGrayColor,
                fontSize: 22,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Tags>(builder: (context, tags, child) {
      return Drawer(
        child: Container(
          padding: EdgeInsets.only(
              left: kHPadding * 1.5,
              right: kHPadding * 1.5,
              top: kVPadding * 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      bottom: kVPadding,
                    ),
                    child: Text(
                      'Select a Category',
                      style: kAvertaTextStyle.copyWith(
                          color: kPrimaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: .5),
                    ),
                  ),
                ],
              ),
              // TextField(
              //   textAlign: TextAlign.center,
              //   cursorColor: kPrimaryColor,
              //   textInputAction: TextInputAction.search,
              //   maxLines: 1,
              //   style: kAvertaTextStyle.copyWith(
              //     color: kPrimaryColor,
              //     fontSize: 16.0,
              //     letterSpacing: 0.25,
              //   ),
              //   decoration: InputDecoration(
              //       filled: true,
              //       isDense: true,
              //       contentPadding: EdgeInsets.symmetric(
              //           horizontal: kHPadding / 2, vertical: kVPadding),
              //       fillColor: Color(0xffeeeeee),
              //       hintText: 'Search category',
              //       hintStyle: kAvertaTextStyle.copyWith(
              //         color: kSecondaryColor,
              //         letterSpacing: 0,
              //         fontSize: 16.0,
              //       ),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(50),
              //         borderSide: BorderSide.none,
              //       )),
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height - 120,
                      // margin: EdgeInsets.only(top: kVPadding),
                      child: FutureBuilder(
                        future: Provider.of<Tags>(context).gettingTags,
                        builder: (context, snapshot) {
                          return snapshot.data == null
                              ? Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                kPrimaryColor),
                                      ),
                                      SizedBox(
                                        height: kVPadding * 2,
                                      ),
                                      Text(
                                        'Trending Tags',
                                        style: kAvertaTextStyle.copyWith(
                                          color: kGrayColor,
                                          fontSize: 16.0,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : tagsBuilder(snapshot.data);
                        },
                      ))
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
