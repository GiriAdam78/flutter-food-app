part of 'pages.dart';

// ignore: use_key_in_widget_constructors
class ProfilePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              height: 220,
              margin: const EdgeInsets.only(bottom: defaultMargin),
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/photo_border.png'))),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage((context
                                      .read<UserCubit>()
                                      .state as UserLoaded)
                                  .user
                                  .picturePath),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Text(
                    (context.read<UserCubit>().state as UserLoaded).user.name,
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    (context.read<UserCubit>().state as UserLoaded).user.email,
                    style: greyFontStyle.copyWith(
                        fontSize: 18, fontWeight: FontWeight.w300),
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
                      // ignore: prefer_const_literals_to_create_immutables
                      titles: ["Account", "Food Market"],
                      selectedIndex: selectedIndex,
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      }),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: ((selectedIndex == 0)
                            ? [
                                'Edit Profile',
                                'Home Address',
                                'Security',
                                'Payment'
                              ]
                            : [
                                'Rate App',
                                'Help Center',
                                'Privacy & Policy',
                                'Term & Condition'
                              ])
                        .map((e) {
                      // ignore: prefer_const_constructors
                      return Padding(
                        // ignore: prefer_const_constructors
                        padding: EdgeInsets.only(
                            bottom: 16,
                            left: defaultMargin,
                            right: defaultMargin),
                        // ignore: prefer_const_constructors
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              e,
                              style: blackFontStyle3,
                            ),
                            // ignore: prefer_const_constructors
                            SizedBox(
                                height: 24,
                                width: 24,
                                child: Image.asset(
                                  'assets/right_arrow.png',
                                  fit: BoxFit.contain,
                                ))
                          ],
                        ),
                      );
                    }).toList(), // P
                  ),
                ],
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 80,
            )
          ],
        )
      ],
    );
  }
}
