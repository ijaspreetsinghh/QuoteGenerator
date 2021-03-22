import 'package:flutter/material.dart';

const kPrimaryColor = Colors.black;
const kAccentColor = Color(0xff333333);
const kSecondaryColor = Color(0xff666666);
const kGrayColor = Color(0xff9c9e9f);
const kWhiteColor = Colors.white;
const String kAverta = 'Averta';
const String kAharoni = 'Aharoni';
const String kBlackOut = 'BlackOut';
const String kDomaineDisplay = 'DomaineDisplay';
const String kThinkingOfBetty = 'ThinkingOfBetty';
const String kGameOfThrones = 'GameOfThrones';
const kHPadding = 16.0;
const kVPadding = 10.0;
const kListOfFontFamily = [
  kGameOfThrones,
  kAverta,
  kAharoni,
  kThinkingOfBetty,
  kBlackOut,
  kDomaineDisplay
];
const kAvertaTextStyle = TextStyle(
  letterSpacing: 1.2,
  fontSize: 18.0,
  fontFamily: kAverta,
  fontWeight: FontWeight.bold,
  color: kWhiteColor,
);
const kAuthorTextStyle = TextStyle(
  letterSpacing: 1.2,
  fontSize: 12,
  color: Color(0xff333333),
  fontWeight: FontWeight.bold,
  wordSpacing: 1.2,
  fontFamily: kAverta,
);
const kQuoteDomaineDisplayTextStyle = TextStyle(
  fontFamily: kDomaineDisplay,
  letterSpacing: 1,
  height: 1.2,
  fontWeight: FontWeight.bold,
  fontSize: 33,
);

const kQuoteGameOfThronesTextStyle = TextStyle(
  fontFamily: kGameOfThrones,
  letterSpacing: 1.2,
  height: 1.5,
  fontWeight: FontWeight.bold,
  fontSize: 40,
);
