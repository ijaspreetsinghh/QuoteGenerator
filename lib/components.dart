import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_share/social_share.dart';
import 'constants.dart';
import 'dart:math';
import 'package:google_mobile_ads/google_mobile_ads.dart';

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
  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-4325421502488315/3699201503',
    size: AdSize.banner,
    request: AdRequest(),
    listener: AdListener(),
  );
  final AdSize adSize = AdSize(width: 300, height: 100);
  final AdListener listener = AdListener(
    // Called when an ad is successfully received.
    onAdLoaded: (Ad ad) => print('Ad loaded.'),
    // Called when an ad request failed.
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      print('Ad failed to load: $error');
    },
    // Called when an ad opens an overlay that covers the screen.
    onAdOpened: (Ad ad) => print('Ad opened.'),
    // Called when an ad removes an overlay that covers the screen.
    onAdClosed: (Ad ad) => print('Ad closed.'),
    // Called when an ad is in the process of leaving the application.
    onApplicationExit: (Ad ad) => print('Left application.'),
  );
  final InterstitialAd intAd = InterstitialAd(
      adUnitId: InterstitialAd
          .testAdUnitId, //'ca-app-pub-4325421502488315/2498349214'
      listener: AdListener(),
      request: AdRequest());
  void _modalBottomSheetMenu() {
    String _sharableContent = '"${widget.content}"\nBy - ${widget.author}';
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Random().nextInt(6) == 4
              ? intAd
              : Container(
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Container(
                      //   padding: EdgeInsets.symmetric(
                      //       horizontal: kHPadding * 1.5, vertical: kVPadding * 2),
                      //   child: Text(
                      //     'Share this on:',
                      //     style: kAvertaTextStyle.copyWith(color: kPrimaryColor),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: kVPadding * 2,
                      // ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: kVPadding * 2),
                        alignment: Alignment.center,
                        child: AdWidget(ad: myBanner),
                        width: myBanner.size.width.toDouble(),
                        height: myBanner.size.height.toDouble(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    color: kPrimaryColor.withOpacity(.4),
                                    width: 2)),
                            child: IconButton(
                                icon: Icon(
                                  Icons.copy_rounded,
                                  size: 30,
                                ),
                                onPressed: () {
                                  SocialShare.copyToClipboard(_sharableContent);
                                }),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    color: kPrimaryColor.withOpacity(.4),
                                    width: 2)),
                            child: IconButton(
                                icon: Icon(
                                  Icons.share_rounded,
                                  size: 30,
                                ),
                                onPressed: () =>
                                    SocialShare.shareOptions(_sharableContent)),
                          )
                        ],
                      ),
                      // Container(
                      //   margin: EdgeInsets.symmetric(vertical: kVPadding),
                      //   alignment: Alignment.center,
                      //   child: AdWidget(ad: myBanner),
                      //   width: myBanner.size.width.toDouble(),
                      //   height: myBanner.size.height.toDouble(),
                      // ),
                      SizedBox(
                        height: kVPadding * 5,
                      ),
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
  void initState() {
    myBanner.load();
    super.initState();
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
              style: kQuoteDomaineDisplayTextStyle.copyWith(
                  color: kPrimaryColor,
                  fontFamily: kListOfFontFamily[Random().nextInt(5)],
                  fontSize: widget.content.length >= 130 ? 22 : 28),
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
