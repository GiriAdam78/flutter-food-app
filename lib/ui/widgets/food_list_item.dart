// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

part of 'widgets.dart';

class FoodListItem extends StatelessWidget {
  final Food food;
  final double itemWidth;

  FoodListItem({
    required this.food,
    required this.itemWidth,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          // ignore: prefer_const_constructors
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: NetworkImage(food.picturePath), fit: BoxFit.cover)),
        ),
        SizedBox(
          width: itemWidth - 182,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food.name,
                style: blackFontStyle2,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                NumberFormat.currency(
                        symbol: 'IDR ', decimalDigits: 0, locale: 'id-ID')
                    .format(food.price),
                style: greyFontStyle.copyWith(fontSize: 13),
              )
            ],
          ),
        ),
        RatingStars(food.rate)
      ],
    );
  }
}
