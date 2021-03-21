import 'package:flutter/material.dart';
import 'constants.dart';

class EndDrawerCTABuilder extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function callToAction;
  const EndDrawerCTABuilder(
      {@required this.icon, @required this.title, @required this.callToAction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callToAction,
      child: Container(
        padding: EdgeInsets.only(
            right: kHPadding, top: kVPadding * 2, bottom: kVPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: kAvertaTextStyle.copyWith(
                  color: kSecondaryColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0),
            ),
            Icon(
              icon,
              size: 22,
            )
          ],
        ),
      ),
    );
  }
}

class CTALinksEndDrawer extends StatelessWidget {
  final String title;
  const CTALinksEndDrawer({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kVPadding * 2),
      child: Text(
        title,
        style: kAvertaTextStyle.copyWith(
            color: kAccentColor,
            fontSize: 16.0,
            letterSpacing: .25,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}

class MainContentViewBuilder extends StatelessWidget {
  final Color color;
  final String author;
  final String content;
  const MainContentViewBuilder(
      {@required this.color, @required this.author, @required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Spacer(
            flex: 1,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: kHPadding * 2),
            child: Text(
              content,
              textAlign: TextAlign.center,
              maxLines: 7,
              style: kQuoteDomaineDisplayTextStyle.copyWith(color: kWhiteColor),
            ),
          ),
          SizedBox(
            height: kVPadding * 4,
          ),
          Text(
            '- $author'.toUpperCase(),
            style: kAuthorTextStyle.copyWith(color: kWhiteColor),
          ),
          SizedBox(
            height: kHPadding * 5,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border:
                    Border.all(color: kWhiteColor.withOpacity(.4), width: 1.5)),
            child: IconButton(
              color: kWhiteColor,
              iconSize: 35.0,
              icon: Icon(Icons.more_horiz),
              onPressed: () => print('share'),
            ),
          ),
          Spacer(
            flex: 1,
          )
        ],
      ),
      color: color,
    );
  }
}
