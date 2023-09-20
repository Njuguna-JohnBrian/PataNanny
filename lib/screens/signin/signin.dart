import 'package:flutter/material.dart';
import 'package:patananny/screens/signin/components/email_input.dart';
import 'package:patananny/screens/signin/components/password_input.dart';
import 'package:patananny/screens/signin/components/signin_button.dart';

import '../../nav.dart';
import '../../utils/theme/theme.dart';
import '../signup/signup.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool termsValues = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Form(
            key: _signInFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back",
                      style: NannyTheme.lightTextTheme.titleLarge
                          ?.copyWith(color: NannyTheme.mainColor),
                    ),
                    Text(
                      "Sign In to proceed",
                      style: NannyTheme.lightTextTheme.displaySmall?.copyWith(
                        color: NannyTheme.mainColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                SignInEmailInputField(
                  textEditingController: _emailController,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SignInPasswordInputField(
                  textEditingController: _passwordController,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                SignInButton(
                  voidCallbackFunction: () {
                    if (!_signInFormKey.currentState!.validate()) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => NavScreen(),
                          ),
                          (Route<dynamic> route) => false);
                    }
                  },
                ),
                SizedBox(
                  height: size.height * 0.15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: NannyTheme.lightTextTheme.titleLarge
                          ?.copyWith(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      ),
                      child: Text("Sign Up",
                          style: NannyTheme.lightTextTheme.titleLarge?.copyWith(
                            color: NannyTheme.mainColor,
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
