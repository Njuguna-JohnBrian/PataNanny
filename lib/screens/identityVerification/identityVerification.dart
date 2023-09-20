import 'package:flutter/material.dart';

import '../../utils/theme/theme.dart';
import 'identityVerificationTerms.dart';

class IdentityVerificationScreen extends StatelessWidget {
  const IdentityVerificationScreen({super.key});

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
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: size.width * 0.045,
            ),
            child: Center(
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.cancel_outlined,
                ),
                iconSize: size.height * 0.035,
                color: Colors.grey.shade700,
              ),
            ),
          )
        ],
        title: Text(
          "Identity Verification",
          style: NannyTheme.lightTextTheme.titleLarge,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "User a valid government-issued document",
              style: NannyTheme.lightTextTheme.titleLarge,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              width: size.width * 0.8,
              child: Text(
                "Only the following documents listed below will be accepted, all the other documents will be rejected",
                style: NannyTheme.lightTextTheme.displaySmall,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              width: size.width * 0.8,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              // color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.document_scanner_outlined),
                      Text(
                        "National Identity Number",
                        style: NannyTheme.lightTextTheme.displaySmall,
                      ),
                      const Icon(
                        Icons.check_circle,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.document_scanner_outlined),
                      Text(
                        "Passport Number",
                        style: NannyTheme.lightTextTheme.displaySmall,
                      ),
                      const Icon(
                        Icons.check_circle,
                        color: Colors.grey,
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.10,
            ),
            SizedBox(
              width: size.width * 0.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                child: TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IdentityVerificationTermsScreen(),
                    ),
                  ),
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
