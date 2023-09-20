import 'package:flutter/material.dart';

import '../../utils/theme/theme.dart';

class IdentityVerificationTermsScreen extends StatefulWidget {
  const IdentityVerificationTermsScreen({super.key});

  @override
  State<IdentityVerificationTermsScreen> createState() =>
      _IdentityVerificationTermsScreenState();
}

class _IdentityVerificationTermsScreenState
    extends State<IdentityVerificationTermsScreen> {
  late bool termsValues = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Identity Verification",
          style: NannyTheme.lightTextTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 200, left: 20),
        child: Column(
          children: [
            Text(
              "By Clicking Continue you agree to allow PataNanny to:",
              style: NannyTheme.lightTextTheme.titleLarge,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              width: size.width,
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.circle,
                          size: size.width * 0.03,
                        ),
                      ),
                      Text(
                        "Process your personal details",
                        style: NannyTheme.lightTextTheme.headline3,
                      ),
                      Icon(
                        Icons.info,
                        size: size.width * 0.03,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.circle,
                          size: size.width * 0.03,
                        ),
                      ),
                      Text(
                        "Process your contact information",
                        style: NannyTheme.lightTextTheme.headline3,
                      ),
                      Icon(
                        Icons.info,
                        size: size.width * 0.03,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.circle,
                          size: size.width * 0.03,
                        ),
                      ),
                      Text(
                        "Process your document information",
                        style: NannyTheme.lightTextTheme.headline3,
                      ),
                      Icon(
                        Icons.info,
                        size: size.width * 0.03,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: termsValues,
                  onChanged: (termsValuesUpdated) => {
                    setState(() {
                      termsValues = termsValuesUpdated!;
                    })
                  },
                  activeColor: Colors.white,
                  side: BorderSide.none,
                  checkColor: Colors.grey,
                  fillColor: MaterialStateProperty.resolveWith((Set states) {
                    if (states.contains(MaterialState.error)) {
                      return Colors.white;
                    }
                    return Colors.white;
                  }),
                ),
                Text(
                  "I have read and accepted PataNanny's \n privacy policy",
                  style: NannyTheme.lightTextTheme.displaySmall,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.08,
            ),
            SizedBox(
              width: size.width * 0.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                child: TextButton(
                  onPressed: () => {},
                  child: Text(
                    "Continue",
                    style: NannyTheme.darkTextTheme.displaySmall,
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
