import 'package:flutter/material.dart';
import 'package:patananny/screens/screens.barrel.dart';
import 'package:patananny/utils/theme/theme.dart';

import 'animations/animation_screens/loading.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 5),
          () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const SecureScreen(),
          ),
        );
      },
    );
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.pin_drop,
                  size: size.width * 0.15,
                  color: NannyTheme.faintMainColor.withOpacity(
                    0.9,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Pata",
                      style: TextStyle(
                        fontSize: 30,
                        color: NannyTheme.faintMainColor.withOpacity(
                          0.9,
                        ),
                      ),
                    ),
                    const Text(
                      "Nanny",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: NannyTheme.faintMainColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            const LoadingAnimation(),
            SizedBox(
              height: size.height * 0.07,
            ),
          ],
        ),
      ),
    );
  }
}
