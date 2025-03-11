// ignore_for_file: prefer_const_constructors, unused_label, prefer_typing_uninitialized_variables, unused_local_variable

part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  final Transaction transaction;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  PaymentPage({required this.transaction});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
        title: 'Payment',
        subtitle: 'You Deserve Better Meal',
        onBackButtonPressed: () {
          Get.back();
        },
        backColor: 'FAFAFC'.toColor(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: defaultMargin),
              padding:
                  EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Item Ordered',
                    style: blackFontStyle3,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            margin: EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        widget.transaction.food.picturePath),
                                    fit: BoxFit.cover)),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 198,
                                  //2 * defaultMargin (Jarak border) +
                                  //60 (Lebar Gambar)
                                  //12 (jarak gambar ke judul)
                                  //78 (lebar jumlah items),
                                  child: Text(
                                    widget.transaction.food.name,
                                    style: blackFontStyle2,
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                  )),
                              Text(
                                NumberFormat.currency(
                                        locale: 'id-ID',
                                        symbol: 'IDR ',
                                        decimalDigits: 0)
                                    .format(widget.transaction.food.price),
                                style: greyFontStyle.copyWith(fontSize: 13),
                              )
                            ],
                          )
                        ],
                      ),
                      Text(
                        '${widget.transaction.quantity} items(s)',
                        style: greyFontStyle.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      'Details Transaction',
                      style: blackFontStyle3,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            widget.transaction.food.name,
                            style: greyFontStyle,
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          NumberFormat.currency(
                                  locale: 'id-ID',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(widget.transaction.quantity! *
                                  widget.transaction.food.price),
                          style: blackFontStyle3,
                          textAlign: TextAlign.right,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            'Driver',
                            style: greyFontStyle,
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            NumberFormat.currency(
                                    locale: 'id-IDR',
                                    symbol: 'IDR ',
                                    decimalDigits: 0)
                                .format(50000),
                            style: blackFontStyle3,
                            textAlign: TextAlign.right,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            'Tax 10%',
                            style: greyFontStyle,
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            NumberFormat.currency(
                                    locale: 'id-ID',
                                    symbol: 'IDR ',
                                    decimalDigits: 0)
                                .format(widget.transaction.quantity! *
                                    widget.transaction.food.price *
                                    0.1),
                            style: blackFontStyle3,
                            textAlign: TextAlign.right,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            'Total',
                            style: greyFontStyle,
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            NumberFormat.currency(
                                    locale: 'id-ID',
                                    symbol: 'IDR ',
                                    decimalDigits: 0)
                                .format(widget.transaction.total),
                            style: blackFontStyle3.copyWith(
                                fontWeight: FontWeight.w500,
                                color: '1ABC9C'.toColor()),
                            textAlign: TextAlign.right,
                          )),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: defaultMargin),
              padding:
                  EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deliver To',
                    style: blackFontStyle3,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 80,
                          child: Text(
                            'Name',
                            style: greyFontStyle,
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width -
                              2 * defaultMargin -
                              80,
                          child: Text(
                            widget.transaction.user!.name,
                            style: blackFontStyle3,
                            textAlign: TextAlign.right,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Phone Number',
                        style: greyFontStyle,
                      ),
                      Text(
                        widget.transaction.user?.phoneNumber ??
                            'Nomor Ponsel Tidak Tersedia',
                        style: blackFontStyle3,
                        textAlign: TextAlign.right,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 80,
                          child: Text(
                            'Address',
                            style: greyFontStyle,
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width -
                              2 * defaultMargin -
                              80,
                          child: Text(
                            widget.transaction.user?.address ??
                                'Alamat Rumah Tidak Tersedia',
                            style: blackFontStyle3,
                            textAlign: TextAlign.right,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'House Number',
                        style: greyFontStyle,
                      ),
                      Text(
                        widget.transaction.user?.houseNumber ??
                            'Nomor Rumah Tidak Tersedia',
                        style: blackFontStyle3,
                        textAlign: TextAlign.right,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'City',
                        style: greyFontStyle,
                      ),
                      Text(
                        widget.transaction.user?.city ?? 'Kota Tidak Tersedia',
                        style: blackFontStyle3,
                        textAlign: TextAlign.right,
                      )
                    ],
                  )
                ],
              ),
            ),
            (isLoading)
                ? Center(
                    child: loadingIndicator,
                  )
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });

                          bool result = await context
                              .read<TransactionCubit>()
                              .submitTransaction(widget.transaction.copyWith(
                                  dateTime: DateTime.now(),
                                  total: (widget.transaction.total! * 1.1)
                                          .toInt() +
                                      5000));

                          if (result == true) {
                            Get.to(SucessOrderPage());
                          } else {
                            setState(() {
                              isLoading = false;
                            });
                            Get.snackbar("", "",
                                backgroundColor: "D9435E".toColor(),
                                icon: Icon(MdiIcons.closeCircleOutline,
                                    color: Colors.white),
                                titleText: Text(
                                  'Transaction Failed !',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                messageText: Text(
                                  'Please Try Again Later',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ));
                          }
                        },
                        child: Text(
                          "Checkout Now",
                          style: blackFontStyle3.copyWith(
                              fontWeight: FontWeight.w500),
                        ))),
          ],
        ));
  }
}
