// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

part of 'widgets.dart';

class RatingStars extends StatelessWidget {
  final double rate;

  // ignore: prefer_const_constructors_in_immutables
  RatingStars(this.rate);

  @override
  Widget build(BuildContext context) {
    int numberOfStars = rate.round();

    return Row(
      children: List<Widget>.generate(
              5,
              (index) => Icon(
                    (index < numberOfStars)
                        ? MdiIcons.star
                        : MdiIcons.starOutline,
                    size: 16,
                    color: mainColor,
                  )) +
          [
            SizedBox(
              width: 4,
            ),
            Text(
              rate.toString(),
              style: greyFontStyle.copyWith(fontSize: 12),
            )
          ],
    );
  }
}
