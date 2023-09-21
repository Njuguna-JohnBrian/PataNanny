import 'package:flutter/material.dart';
import 'package:patananny/utils/theme/theme.dart';

import 'animations/animation_screens/soon.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NannyTheme.faintMainColor.withOpacity(0.45),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: const Center(
        child: SoonAnimation(),
      ),
    );
  }
}
