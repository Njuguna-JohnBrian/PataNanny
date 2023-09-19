import 'package:patananny/animations/animation_configs/view.dart';

import '../animation_configs/config.dart';

class SecureAnimation extends LottieAnimationView {
  const SecureAnimation({super.key})
      : super(
          animation: LottieAnimation.secure,
        );
}
