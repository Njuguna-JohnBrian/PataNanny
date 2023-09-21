import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/theme/theme.dart';

class ChildDOBInputField extends StatefulWidget {
  final TextEditingController textEditingController;

  const ChildDOBInputField({
    super.key,
    required this.textEditingController,
  });

  @override
  State<ChildDOBInputField> createState() => _ChildDOBInputFieldState();
}

class _ChildDOBInputFieldState extends State<ChildDOBInputField> {
  DateTime _selectedDate = DateTime.now();

  final ThemeData datePickerTheme = ThemeData.light().copyWith(
    useMaterial3: true,
    buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.accent),
  );

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
          Text(
            "Enter Your Child's Date of Birth",
            style: NannyTheme.lightTextTheme.headline6?.copyWith(
              color: NannyTheme.mainColor.withOpacity(1),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: size.height * 0.002,
          ),
          GestureDetector(
            onTap: () async {
              print("hererererer");
              final currentDate = DateTime.now();
              final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: currentDate,
                  lastDate: DateTime(currentDate.year + 5),
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: datePickerTheme,
                      child: child!,
                    );
                  });
              setState(() {
                if (selectedDate != null) {
                  _selectedDate = selectedDate;
                  widget.textEditingController.text =
                      DateFormat('yyyy-MM-dd').format(_selectedDate);
                }
              });
            },
            child: AbsorbPointer(
              child: TextFormField(
                controller: widget.textEditingController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Date cannot be empty";
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
                  hintText: '${DateFormat('yyyy-MM-dd').format(_selectedDate)}',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
