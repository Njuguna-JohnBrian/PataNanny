import 'package:flutter/material.dart';
import 'package:patananny/nav.dart';
import 'package:patananny/screens/requestNanny/childDescrption.dart';
import 'package:patananny/screens/requestNanny/childFirstName.dart';
import 'package:patananny/screens/requestNanny/childLastName.dart';

import '../../utils/theme/theme.dart';
import 'childDob.dart';

class RequestNannyScreen extends StatefulWidget {
  const RequestNannyScreen({super.key});

  @override
  State<RequestNannyScreen> createState() => _RequestNannyScreenState();
}

class _RequestNannyScreenState extends State<RequestNannyScreen> {
  final _nannyRequestFormKey = GlobalKey<FormState>();
  final TextEditingController _childFirstNameController =
      TextEditingController();
  final TextEditingController _childLastNameController =
      TextEditingController();
  final TextEditingController _childDescriptionController =
      TextEditingController();
  final TextEditingController _childDOBController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
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
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.height,
          child: Form(
            key: _nannyRequestFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 64,
                  backgroundImage: AssetImage(
                    "assets/images/profile_pic.png",
                  ),
                ),
                Text(
                  "Create Nanny Request",
                  style: NannyTheme.lightTextTheme.titleLarge?.copyWith(
                    color: NannyTheme.mainColor,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    ChildFirstNameInputField(
                      textEditingController: _childFirstNameController,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    ChildLastNameInputField(
                      textEditingController: _childLastNameController,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    // TextButton(
                    //   child: Text(""),
                    //   onPressed: () async {
                    //     final currentDate = DateTime.now();
                    //     final selectedDate = await showDatePicker(
                    //       context: context,
                    //       initialDate: currentDate,
                    //       firstDate: currentDate,
                    //       lastDate: DateTime(currentDate.year + 5),
                    //     );
                    //   },
                    // ),

                    ChildDOBInputField(
                      textEditingController: _childDOBController,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    ChildDescriptionInputField(
                      textEditingController: _childDescriptionController,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Center(
                      child: SizedBox(
                        width: size.width * 0.5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                          child: TextButton(
                            onPressed: () => {
                              if (_nannyRequestFormKey.currentState!
                                  .validate())
                                {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (context) => NavScreen(),
                                      ),
                                      (Route<dynamic> route) => false)
                                }
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: NannyTheme.mainColor,
                            ),
                            child: Text(
                              "Create Request",
                              style: NannyTheme.darkTextTheme.headline3
                                  ?.copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
