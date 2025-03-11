// ignore_for_file: prefer_const_constructors

part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onBackButtonPressed;
  final Widget? child;
  final Color? backColor;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  GeneralPage(
      {this.title = 'Food App',
      this.subtitle = 'Aplikasi Pemesanan Makanan',
      this.onBackButtonPressed,
      this.child,
      this.backColor});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(color: Colors.white),
        SafeArea(
            child: Container(
          color: backColor ?? Colors.white,
        )),
        SafeArea(
            child: ListView(
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: 100,
                color: Colors.white,
                child: Row(
                  children: [
                    onBackButtonPressed != null
                        ? GestureDetector(
                            onTap: () {
                              if (onBackButtonPressed != null) {
                                onBackButtonPressed!();
                              }
                            },
                            child: Container(
                              width: 24,
                              height: 24,
                              margin: const EdgeInsets.only(right: 26),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/back_arrow.png'))),
                            ),
                          )
                        : const SizedBox(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.poppins(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          subtitle,
                          style: GoogleFonts.poppins(
                              color: "8D92A3".toColor(),
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    )
                  ],
                )),
            Container(
              height: 20,
              width: double.infinity,
              color: "FAFAFC".toColor(),
            ),
            child ?? SizedBox()
          ],
        ))
      ],
    ));
  }
}
