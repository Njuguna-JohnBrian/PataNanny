import 'package:flutter/material.dart';
import '../../nav.dart';
import '../../utils/theme/theme.dart';
import '../screens.barrel.dart' show IdentityVerificationScreen;
import '../signin/signin.dart';
import 'components/confirm_password_input.dart';
import 'components/email_input.dart';
import 'components/firstname_input.dart';
import 'components/lastname_input.dart';
import 'components/password_input.dart';
import 'components/signup_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  late bool termsValues = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _confirmPasswordController.dispose();
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
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: size.width * 0.045,
            ),
            child: Center(
              child: GestureDetector(
                onTap: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => NavScreen(),
                    ),
                    (Route<dynamic> route) => false),
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    color: NannyTheme.mainColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Form(
            key: _signUpFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Find a baby care",
                      style: NannyTheme.lightTextTheme.titleLarge
                          ?.copyWith(color: NannyTheme.mainColor),
                    ),
                    Text(
                      "Fill your details to become a member",
                      style: NannyTheme.lightTextTheme.displaySmall
                          ?.copyWith(color: NannyTheme.mainColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SignUpEmailInputField(
                  textEditingController: _emailController,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                SignUpFirstNameInputField(
                  textEditingController: _firstNameController,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                SignUpLastNameInputField(
                  textEditingController: _lastNameController,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                SignUpPasswordInputField(
                  textEditingController: _passwordController,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                SignUpConfirmPasswordInputField(
                  textEditingController: _confirmPasswordController,
                  validationStringController: _passwordController,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      fillColor:
                          MaterialStateProperty.resolveWith((Set states) {
                        if (states.contains(MaterialState.error)) {
                          return Colors.white;
                        }
                        return Colors.white;
                      }),
                    ),
                    Text(
                      "I agree to all terms & conditions",
                      style: NannyTheme.lightTextTheme.displaySmall
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SignUpButton(
                  voidCallbackFunction: () {
                    if (_signUpFormKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const IdentityVerificationScreen(),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: NannyTheme.lightTextTheme.titleLarge
                          ?.copyWith(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      ),
                      child: Text("Sign In",
                          style: NannyTheme.lightTextTheme.titleLarge
                              ?.copyWith(color: NannyTheme.mainColor)),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
