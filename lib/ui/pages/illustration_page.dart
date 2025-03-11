// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

part of 'pages.dart';

class IllustrationPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String picturePath;
  final String buttonTitle1;
  final String buttonTitle2;
  final VoidCallback buttonTap1;
  final VoidCallback? buttonTap2;

  IllustrationPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.picturePath,
    required this.buttonTap1,
    this.buttonTap2,
    required this.buttonTitle1,
    required this.buttonTitle2,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.only(bottom: 50),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(picturePath))),
          ),
          Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 12),
            width: 200,
            height: 45,
            child: ElevatedButton(
              onPressed: buttonTap1,
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor, // Replace with your main color
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(
                buttonTitle1,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          (buttonTap2 == null)
              ? SizedBox()
              : SizedBox(
                  width: 200,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: buttonTap2,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color(0xFF8D92A3), // Replace with color code
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(
                      buttonTitle2,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
