import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_share/social_share.dart';
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

class MainContentViewBuilder extends StatefulWidget {
  final Color color;
  final String author;
  final String content;
  const MainContentViewBuilder(
      {@required this.color, @required this.author, @required this.content});

  @override
  _MainContentViewBuilderState createState() => _MainContentViewBuilderState();
}

class _MainContentViewBuilderState extends State<MainContentViewBuilder> {
  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: kHPadding * 1.5, vertical: kVPadding * 2),
                    child: Text(
                      'Share this on:',
                      style: kAvertaTextStyle.copyWith(color: kPrimaryColor),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.ac_unit,
                            size: 50,
                            color: Colors.red,
                          ),
                          onPressed: () => SocialShare.shareWhatsapp(
                              '"${widget.content}"\nBy - ${widget.author}'),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    'The more we share, the more we have',
                    style: kAvertaTextStyle.copyWith(
                      color: kSecondaryColor,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: kVPadding * 1.5,
                  ),
                  Text(
                    '- Lionard Nimoy',
                    style: kAvertaTextStyle.copyWith(
                      color: kGrayColor,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: kVPadding * 6,
                  )
                ],
              ));
        });
  }

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
              widget.content,
              textAlign: TextAlign.center,
              maxLines: 7,
              style:
                  kQuoteDomaineDisplayTextStyle.copyWith(color: kPrimaryColor),
            ),
          ),
          SizedBox(
            height: kVPadding * 4,
          ),
          Text(
            '- ${widget.author}'.toUpperCase(),
            style: kAuthorTextStyle.copyWith(color: kPrimaryColor),
          ),
          SizedBox(
            height: kHPadding * 5,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    color: kPrimaryColor.withOpacity(.4), width: 1.5)),
            child: IconButton(
              color: kPrimaryColor,
              iconSize: 35.0,
              icon: Icon(Icons.more_horiz),
              onPressed: () => _modalBottomSheetMenu(),
            ),
          ),
          Spacer(
            flex: 1,
          )
        ],
      ),
      color: widget.color,
    );
  }
}
