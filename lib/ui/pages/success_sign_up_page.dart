part of 'pages.dart';

// ignore: use_key_in_widget_constructors
class SucessSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        backgroundColor: Colors.white,
        body: IllustrationPage(
            title: "Yeay ! Completed",
            subtitle: "Now you Are Able To Order\nsome foods as a self reward",
            picturePath: 'assets/food_wishes.png',
            buttonTap1: () {},
            buttonTitle1: 'Find Foods',
            buttonTitle2: 'Completed'));
  }
}
