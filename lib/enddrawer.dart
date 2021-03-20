import 'package:flutter/material.dart';
import 'constants.dart';
import 'components.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: kHPadding * 1.5, vertical: kVPadding * 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 40,
                ),
                SizedBox(
                  height: kVPadding * 2,
                ),
                Text(
                  'Jonathan Jordan',
                  style: kAvertaTextStyle.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0),
                ),
                SizedBox(
                  height: kVPadding * 4,
                ),
                EndDrawerCTABuilder(
                  title: 'Share',
                  icon: Icons.share_outlined,
                  callToAction: () => print('share'),
                ),
                EndDrawerCTABuilder(
                  title: 'Bookmark',
                  icon: Icons.bookmark_border_rounded,
                  callToAction: () => print('bookmark'),
                ),
                EndDrawerCTABuilder(
                  title: 'Settings',
                  icon: Icons.settings_outlined,
                  callToAction: () => print('bookmark'),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(
                kHPadding * 1.5, kVPadding * 2, kHPadding * 1.5, kVPadding * 4),
            color: Color(0xffedeeef),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CTALinksEndDrawer(
                  title: 'Terms & Privacy',
                ),
                CTALinksEndDrawer(
                  title: 'Help',
                ),
                CTALinksEndDrawer(
                  title: 'Tell a Firend',
                ),
                CTALinksEndDrawer(
                  title: 'Rate us',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
