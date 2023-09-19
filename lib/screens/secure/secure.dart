import 'package:flutter/material.dart';
import 'package:patananny/animations/animation_screens/secure.dart';
import 'package:patananny/utils/theme/theme.dart';

class SecureScreen extends StatelessWidget {
  const SecureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: NannyTheme.mainColor,
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
      body: const Center(
        child: SecureAnimation(),
      ),
    );
  }
}
