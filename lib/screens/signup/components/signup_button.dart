import 'package:flutter/material.dart';
import 'package:patananny/utils/theme/theme.dart';

class SignUpButton extends StatelessWidget {
  final VoidCallback voidCallbackFunction;

  const SignUpButton({
    super.key,
    required this.voidCallbackFunction,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.7,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          30,
        ),
        child: TextButton(
          onPressed: voidCallbackFunction,
          child: Text(
            "Create Account",
            style: NannyTheme.darkTextTheme.headline3,
          ),
        ),
      ),
    );
  }
}
