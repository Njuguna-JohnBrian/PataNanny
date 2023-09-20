import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patananny/utils/theme/theme.dart';

class FacialVerificationScreen extends StatelessWidget {
  const FacialVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: NannyTheme.faintMainColor.withOpacity(
        0.45,
      ),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Facial Verification",
          style: NannyTheme.lightTextTheme.titleLarge?.copyWith(
            color: NannyTheme.mainColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    SvgPicture.asset(
                      "assets/svg/no_cap.svg",
                      height: 50,
                      width: 50,
                      color: NannyTheme.mainColor,
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    const Text(
                      "Avoid wearing hats",
                      style: TextStyle(
                        color: NannyTheme.mainColor,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      "assets/svg/no_filters.svg",
                      height: 50,
                      width: 50,
                      color: NannyTheme.mainColor,
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    const Text(
                      "Avoid using filters",
                      style: TextStyle(
                        color: NannyTheme.mainColor,
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    SvgPicture.asset(
                      "assets/svg/no_glasses.svg",
                      height: 50,
                      width: 50,
                      color: NannyTheme.mainColor,
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    const Text(
                      "Avoid wearing glasses",
                      style: TextStyle(
                        color: NannyTheme.mainColor,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      "assets/svg/enough_light1.svg",
                      height: 50,
                      width: 50,
                      color: NannyTheme.mainColor,
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    const Text(
                      "Use enough light",
                      style: TextStyle(
                        color: NannyTheme.mainColor,
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.15,
            ),
            SizedBox(
              width: size.width * 0.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                child: TextButton(
                  onPressed: () => {},
                  style: TextButton.styleFrom(
                      backgroundColor: NannyTheme.mainColor),
                  child: const Text(
                    "Begin Verification",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16
                    ),
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
