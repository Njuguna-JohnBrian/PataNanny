import 'package:flutter/material.dart';

import '../../animations/animation_screens/face_id.dart';
import '../../animations/animation_screens/secure.dart';
import '../../nav.dart';
import '../../utils/theme/theme.dart';
import '../requestNanny/requestNanny.dart';

class FaceIdScreen extends StatelessWidget {
  const FaceIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            Text(
              "Use Face ID",
              style: NannyTheme.lightTextTheme.headline2,
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            const FaceIdAnimation(),
            SizedBox(
              height: size.height * 0.07,
            ),
            SizedBox(
              width: size.width * 0.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                child: TextButton(
                  onPressed: () => {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => RequestNannyScreen(),
                        ),
                        (Route<dynamic> route) => false)
                  },
                  child: Text(
                    "CONTINUE",
                    style: NannyTheme.darkTextTheme.displaySmall
                        ?.copyWith(color: NannyTheme.mainColor.withOpacity(1)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
