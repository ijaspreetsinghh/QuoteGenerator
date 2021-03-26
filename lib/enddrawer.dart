import 'package:flutter/material.dart';
import 'constants.dart';
import 'components.dart';
import 'package:social_share/social_share.dart';

class EndDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        body: Column(
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
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/logo.png'),
                            fit: BoxFit.cover,
                            repeat: ImageRepeat.noRepeat,
                            alignment: AlignmentDirectional.center,
                            scale: 1.0),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: kPrimaryColor,
                        )),
                  ),
                  SizedBox(
                    height: kVPadding * 2,
                  ),
                  Text(
                    'Quote Generator',
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
                    callToAction: () => SocialShare.shareOptions(
                        'Developed by: \nhttps://ijaspreetsinghh.github.io/'),
                  ),
                  EndDrawerCTABuilder(
                    title: 'Bookmark',
                    icon: Icons.bookmark_border_rounded,
                    callToAction: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('We\'ll add this in future release.'),
                      ));
                    },
                  ),
                  EndDrawerCTABuilder(
                    title: 'Settings',
                    icon: Icons.settings_outlined,
                    callToAction: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('We\'ll add this in future release.'),
                      ));
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(kHPadding * 1.5, kVPadding * 2,
                  kHPadding * 1.5, kVPadding * 4),
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
      ),
    );
  }
}
