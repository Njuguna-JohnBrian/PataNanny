import 'package:flutter/material.dart';
import 'package:patananny/utils/theme/theme.dart';

class SignUpConfirmPasswordInputField extends StatefulWidget {
  final TextEditingController textEditingController;
  final TextEditingController validationStringController;

  const SignUpConfirmPasswordInputField({
    super.key,
    required this.textEditingController,
    required this.validationStringController,
  });

  @override
  State<SignUpConfirmPasswordInputField> createState() =>
      _SignUpPasswordInputFieldState();
}

class _SignUpPasswordInputFieldState
    extends State<SignUpConfirmPasswordInputField> {
  bool showPassword = false;

  @override
  void initState() {
    showPassword = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.10,
        right: size.width * 0.10,
      ),
      child: TextFormField(
        controller: widget.textEditingController,
        obscureText: !showPassword,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: ((value) {
          if (value!.isEmpty) {
            return "Password cannot be empty";
          } else if (value.length < 6) {
            return "Password must have 6 or more characters";
          } else if (!RegExp(
                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')
              .hasMatch(value)) {
            return "Password must contain a number, uppercase & lowercase letters and a special character";
          } else if (value.toString() !=
              widget.validationStringController.text.toString()) {
            return "Please ensure passwords match";
          } else {
            return null;
          }
        }),
        cursorColor: Colors.grey,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          prefixIcon: Icon(
            Icons.password,
            color: Colors.grey.shade400,
          ),
          suffixIcon: IconButton(
            onPressed: () => setState(() {
              showPassword = !showPassword;
            }),
            icon: Icon(
              showPassword ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey.shade400,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            borderSide: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            borderSide: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            borderSide: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
          labelText: "Confirm Password",
          hintText: ". . . . . .",
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle: NannyTheme.lightTextTheme.headline6,
          labelStyle: NannyTheme.lightTextTheme.headline6?.copyWith(
            color: Colors.grey.shade500,
          ),
        ),
      ),
    );
  }
}
