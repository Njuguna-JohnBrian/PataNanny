import 'package:flutter/material.dart';

import '../../utils/theme/theme.dart';

class ChildLastNameInputField extends StatelessWidget {
  final TextEditingController textEditingController;
  const ChildLastNameInputField({super.key, required this.textEditingController,});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.10,
        right: size.width * 0.10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Enter Your Child's Last Name", style: NannyTheme.lightTextTheme.headline6?.copyWith(
            color: NannyTheme.mainColor.withOpacity(1),
            fontWeight: FontWeight.w600,
          ),),
          SizedBox(
            height: size.height * 0.002,
          ),
          TextFormField(
            controller: textEditingController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: ((value) {
              if (value!.isEmpty) {
                return "Last name cannot be empty";
              } else if (!RegExp("[a-zA-Z]").hasMatch(value)) {
                return "Please use only letters for your child's last name";
              } else if (value.length < 3) {
                return "Please ensure child's last name is 3 characters and above";
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
                Icons.keyboard,
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
              hintText: "Emmanuel",
            ),
          ),
        ],
      ),
    );
  }
}
