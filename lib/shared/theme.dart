part of 'shared.dart';

// Color Theme
Color mainColor = "FFC700".toColor();
Color greyColor = "8D92A3".toColor();

// ignore: prefer_const_constructors
Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);
// Style Text
TextStyle greyFontStyle = GoogleFonts.poppins().copyWith(color: greyColor);
TextStyle blackFontStyle = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle blackFontStyle2 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle blackFontStyle3 = GoogleFonts.poppins().copyWith(color: Colors.black);

// Default Margin
const double defaultMargin = 24;
const double defaultHeight = 60;
