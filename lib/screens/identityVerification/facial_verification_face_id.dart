import 'package:flutter/material.dart';

import '../../animations/animation_screens/face_id.dart';
import '../../animations/animation_screens/secure.dart';
import '../../utils/theme/theme.dart';

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
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: size.width * 0.045,
            ),
            child: Center(
              child: GestureDetector(
                onTap: () => {},
                child: Text(
                  "Skip",
                  style: NannyTheme.lightTextTheme.headline6
                      ?.copyWith(decoration: TextDecoration.underline),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FaceIdAnimation(),
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
