// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors_in_immutables, prefer_const_constructors, duplicate_ignore

part of 'widgets.dart';

class OrderListItem extends StatelessWidget {
  final Transaction transaction;
  final double itemWidth;

  // ignore: use_key_in_widget_constructors
  OrderListItem({required this.transaction, required this.itemWidth});

  @override
  Widget build(BuildContext context) {
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
                  image: NetworkImage(transaction.food.picturePath),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          width: itemWidth - 182,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(transaction.food.name,
                  style: blackFontStyle2,
                  maxLines: 1,
                  overflow: TextOverflow.clip),
              Text(
                "${transaction.quantity} item(s) • " +
                    NumberFormat.currency(
                            symbol: 'IDR ', decimalDigits: 0, locale: 'id-ID')
                        .format(transaction.total),
              )
            ],
          ),
        ),
        SizedBox(
            width: 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  convertDateTime(transaction.dateTime!),
                  style: greyFontStyle.copyWith(fontSize: 12),
                ),
                (transaction.status == TransactionStatus.cancelled)
                    ? Text(
                        'Cancelled',
                        style: GoogleFonts.poppins(
                            color: 'D9435E'.toColor(), fontSize: 10),
                      )
                    : (transaction.status == TransactionStatus.pending)
                        ? Text(
                            'Pending',
                            style: GoogleFonts.poppins(
                                color: 'D9435E'.toColor(), fontSize: 10),
                          )
                        : (transaction.status == TransactionStatus.on_delivery)
                            ? Text(
                                'On Delivery',
                                style: GoogleFonts.poppins(
                                    color: '1ABC9C'.toColor(), fontSize: 10),
                              )
                            : SizedBox()
              ],
            ))
      ],
    );
  }

  String convertDateTime(DateTime dateTime) {
    String month;

    switch (dateTime.month) {
      case 1:
        month = 'Jan';
        break;
      case 2:
        month = 'Feb';
        break;
      case 3:
        month = 'Mar';
        break;
      case 4:
        month = 'Apr';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'Jun';
        break;
      case 7:
        month = 'Jul';
        break;
      case 8:
        month = 'Aug';
        break;
      case 9:
        month = 'Sep';
        break;
      case 10:
        month = 'Oct';
        break;
      case 11:
        month = 'Nov';
        break;
      default:
        month = 'Des';
    }

    return month + '${dateTime.day}, ${dateTime.hour}:${dateTime.minute}';
  }
}
