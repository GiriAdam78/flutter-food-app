// ignore_for_file: prefer_const_constructors

part of 'widgets.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index)? onTap;

  // ignore: prefer_const_constructors_in_immutables
  CustomBottomNavbar({super.key, this.selectedIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: defaultHeight,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // ignore: unnecessary_null_comparison
              if (onTap != null) {
                onTap!(0);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        // ignore: prefer_interpolation_to_compose_strings
                        'assets/ic_home' +
                            ((selectedIndex == 0) ? '.png' : '_normal.png'),
                      ),
                      fit: BoxFit.contain)),
            ),
          ),
          GestureDetector(
            onTap: () {
              // ignore: unnecessary_null_comparison
              if (onTap != null) {
                onTap!(1);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              margin: EdgeInsets.symmetric(horizontal: 83),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        // ignore: prefer_interpolation_to_compose_strings
                        'assets/ic_order' +
                            ((selectedIndex == 1) ? '.png' : '_normal.png'),
                      ),
                      fit: BoxFit.contain)),
            ),
          ),
          GestureDetector(
            onTap: () {
              // ignore: unnecessary_null_comparison
              if (onTap != null) {
                onTap!(2);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        // ignore: prefer_interpolation_to_compose_strings
                        'assets/ic_profile' +
                            ((selectedIndex == 2) ? '.png' : '_normal.png'),
                      ),
                      fit: BoxFit.contain)),
            ),
          )
        ],
      ),
    );
  }
}
