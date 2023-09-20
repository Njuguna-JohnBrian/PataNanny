import 'package:flutter/material.dart';
import 'package:patananny/utils/theme/theme.dart';

class SignUpEmailInputField extends StatelessWidget {
  final TextEditingController textEditingController;

  const SignUpEmailInputField({
    super.key,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.10,
        right: size.width * 0.10,
      ),
      child: TextFormField(
        controller: textEditingController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: ((value) {
          if (value!.isEmpty) {
            return "Email cannot be empty";
          } else if (!RegExp(
                  r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
              .hasMatch(value)) {
            return "Please provide a valid email address";
          } else {
            return null;
          }
        }),
        cursorColor: Colors.grey,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          prefixIcon: Icon(
            Icons.email,
            color: Colors.grey.shade400,
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
          labelText: "Email/Phone No.",
          hintText: "fridaofula@gmail.com",
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
