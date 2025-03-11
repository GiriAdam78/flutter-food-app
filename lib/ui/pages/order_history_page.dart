// ignore_for_file: prefer_const_constructors, prefer_is_empty, prefer_typing_uninitialized_variables, unused_local_variable, use_key_in_widget_constructors, library_private_types_in_public_api

part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;
  List<Transaction> inProgress = mockTransactions
      .where((element) =>
          element.status == TransactionStatus.on_delivery ||
          element.status == TransactionStatus.pending)
      .toList();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(builder: (_, state) {
      if (state is TransactionLoaded) {
        var past;
        if (state.transactions.length == 0) {
          return IllustrationPage(
            title: 'Ouch ! Hungry',
            subtitle: 'Seems you Like Have Not\nOrdered Any Food Yet',
            picturePath: 'assets/love_burger.png',
            buttonTap1: () {},
            buttonTap2: () {},
            buttonTitle1: 'Find Foods',
            buttonTitle2: 'Wait',
          );
        } else {
          double listItemWidth =
              MediaQuery.of(context).size.width - 2 * defaultMargin;

          return ListView(
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: defaultMargin),
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Your Orders',
                          style: blackFontStyle,
                        ),
                        Text(
                          'Wait for the best meal',
                          style: greyFontStyle.copyWith(
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: [
                        CustomTabBar(
                            selectedIndex: selectedIndex,
                            // ignore: prefer_const_literals_to_create_immutables
                            titles: ['In Progress', 'Past Orders'],
                            onTap: (index) {
                              setState(() {
                                selectedIndex = index;
                              });
                            }),
                        SizedBox(
                          height: 16,
                        ),
                        Builder(builder: (_) {
                          List<Transaction> transactions = (selectedIndex == 0)
                              ? state.transactions
                                  .where((element) =>
                                      element.status ==
                                          TransactionStatus.on_delivery ||
                                      element.status ==
                                          TransactionStatus.pending)
                                  .toList()
                              : state.transactions
                                  .where((element) =>
                                      element.status ==
                                          TransactionStatus.delivered ||
                                      element.status ==
                                          TransactionStatus.cancelled)
                                  .toList();

                          return Column(
                            children: transactions
                                .map<Widget>((e) => Padding(
                                      padding: const EdgeInsets.only(
                                          right: defaultMargin,
                                          left: defaultMargin,
                                          bottom: 16),
                                      child: OrderListItem(
                                        transaction: e,
                                        itemWidth: listItemWidth,
                                      ),
                                    ))
                                .toList(),
                          );
                        })
                      ],
                    ),
                  )
                ],
              )
            ],
          );
        }
      } else {
        return Center(
          child: loadingIndicator,
        );
      }
    });
  }
}
