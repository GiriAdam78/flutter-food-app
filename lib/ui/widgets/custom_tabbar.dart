// ignore_for_file: prefer_const_constructors

part of 'widgets.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final List<String> titles;
  final Function(int) onTap;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  CustomTabBar({
    required this.selectedIndex,
    required this.titles,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 50,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 48),
            height: 1,
            color: "F2F2F2".toColor(),
          ),
          Row(
            children: titles.map((e) {
              return Padding(
                padding: const EdgeInsets.only(left: defaultMargin),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // ignore: unnecessary_null_comparison
                        if (onTap != null) {
                          onTap(titles.indexOf(e));
                        }
                      },
                      child: Text(
                        e,
                        style: (titles.indexOf(e) == selectedIndex)
                            ? blackFontStyle3.copyWith(
                                fontWeight: FontWeight.w500)
                            : greyFontStyle,
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 3,
                      margin: EdgeInsets.only(top: 13),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.5),
                          color: (titles.indexOf(e) == selectedIndex)
                              ? "020202".toColor()
                              : Colors.transparent),
                    )
                  ],
                ), // Menampilkan teks dari setiap elemen 'titles'
              );
            }).toList(), // Pastikan untuk mengubah hasil map menjadi List
          ),
        ],
      ),
    );
  }
}
