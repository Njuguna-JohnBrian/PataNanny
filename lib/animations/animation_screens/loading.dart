import 'package:patananny/animations/animation_configs/view.dart';

import '../animation_configs/config.dart';

class LoadingAnimation extends LottieAnimationView {
  const LoadingAnimation({super.key})
      : super(
    animation: LottieAnimation.loading,
  );
}
