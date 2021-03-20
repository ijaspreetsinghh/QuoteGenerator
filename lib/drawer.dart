import 'package:flutter/material.dart';
import 'constants.dart';

class LeftDrawer extends StatefulWidget {
  const LeftDrawer({
    Key key,
  }) : super(key: key);

  @override
  _LeftDrawerState createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {
  List listItems = [
    'Random',
    'Fashion',
    'Inspirational',
    'Life',
    'Funny',
    'Love',
    'Loneliness',
    'Friendship',
    'Smile',
    'Sad',
    'Knowledge'
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.only(
            left: kHPadding * 1.5, right: kHPadding * 1.5, top: kVPadding * 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    bottom: kVPadding * 2,
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
            TextField(
              textAlign: TextAlign.center,
              style: kAvertaTextStyle.copyWith(
                color: kPrimaryColor,
                fontSize: 16.0,
                letterSpacing: 0.25,
              ),
              decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: kHPadding / 2, vertical: kVPadding),
                  fillColor: Color(0xffeeeeee),
                  hintText: 'Search category',
                  hintStyle: kAvertaTextStyle.copyWith(
                    color: kSecondaryColor,
                    letterSpacing: 0,
                    fontSize: 16.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - 150,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: listItems.length,
                    itemBuilder: (context, position) {
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: kVPadding),
                        child: Text(
                          '${listItems[position]}',
                          style: kAvertaTextStyle.copyWith(
                            color: position == 1 ? kPrimaryColor : kGrayColor,
                            fontSize: 24.0,
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
