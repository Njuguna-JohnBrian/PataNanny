import 'package:flutter/material.dart';
import 'package:patananny/utils/theme/theme.dart';

class SignInButton extends StatelessWidget {
  final VoidCallback voidCallbackFunction;

  const SignInButton({
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
          style: TextButton.styleFrom(
            backgroundColor: NannyTheme.mainColor,
          ),
          child: Text(
            "Sign In",
            style: NannyTheme.darkTextTheme.headline3?.copyWith(
                color: Colors.black
            ),
          ),
        ),
      ),
    );
  }
}
