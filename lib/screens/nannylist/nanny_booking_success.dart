import 'package:flutter/material.dart';

import '../../animations/animation_screens/success.dart';
import '../../utils/theme/theme.dart';

class NannyBookingSuccessScreen extends StatelessWidget {
  const NannyBookingSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NannyTheme.faintMainColor.withOpacity(0.45),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SuccessAnimation(),
          Text(
            "Nanny Booked",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: NannyTheme.mainColor
            ),
          ),
          Text(
            "You will get an email with your booking confirmation",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
              color: NannyTheme.mainColor
            ),
          ),
        ],
      )),
    );
  }
}
