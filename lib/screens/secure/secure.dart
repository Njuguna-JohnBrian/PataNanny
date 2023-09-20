import 'package:flutter/material.dart';
import 'package:patananny/animations/animation_screens/secure.dart';
import 'package:patananny/screens/signin/signin.dart';
import 'package:patananny/utils/theme/theme.dart';

class SecureScreen extends StatelessWidget {
  const SecureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => SignInScreen(),
            ),
            (Route<dynamic> route) => false);
      },
    );
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SecureAnimation(),
          SizedBox(
            width: size.width * 0.78,
            child: Text(
              "Trust us with your child's safety. Our nannies are carefully vetted and trained to provide the best care possible",
              style: NannyTheme.lightTextTheme.headline6
                  ?.copyWith(wordSpacing: 2.0),
            ),
          )
        ],
      ),
    );
  }
}
