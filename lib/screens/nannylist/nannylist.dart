import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patananny/screens/signin/signin.dart';
import 'dart:math'; // Import the dart:math library

import '../../utils/theme/theme.dart';
import 'nanny_booking_success.dart';

class NannyModel {
  String name;
  String availability;
  String imageLink;
  int nannyIndex;

  NannyModel({
    this.name = "",
    this.availability = "",
    this.imageLink = "",
    this.nannyIndex = 0,
  });
}

class RandomNameGenerator {
  final List<String> _names = [
    'Alice',
    'Bob',
    'Charlie',
    'David',
    'Eve',
    'Frank',
    'Grace',
    'Hannah',
    'Ivy',
    'Jack',
    'Katie',
    'Liam',
    'Mia',
    'Noah',
    'Olivia',
    'Parker',
    'Quinn',
    'Ryan',
    'Sophia',
    'Thomas',
    'Uma',
    'Violet',
    'William',
    'Xander',
    'Yasmine',
    'Zoe',
    'Ava',
    'Benjamin',
    'Chloe',
    'Daniel',
    'Emily',
    'Ethan',
    'Grace',
    'Harper',
    'Isabella',
    'Jacob',
    'James',
    'Lily',
    'Madison',
    'Mason',
    'Michael',
    'Oliver',
    'Olivia',
    'Sophia',
    'William'
  ];

  String generateRandomName() {
    final random = Random();
    final index = random.nextInt(_names.length);
    return _names[index];
  }
}

class NannyListScreen extends StatelessWidget {
  final RandomNameGenerator nameGenerator = RandomNameGenerator();

  late final List<NannyModel> nannyItems;

  NannyListScreen({super.key}) {
    nannyItems = List.generate(100, (index) {
      // Use Random class to generate random availability
      final Random random = Random();
      String availability = random.nextBool() ? "Booked" : "Available";

      final firstName = nameGenerator.generateRandomName();
      final lastName = nameGenerator.generateRandomName();

      return NannyModel(
        name: '$firstName $lastName',
        availability: availability,
        imageLink: "https://i.pravatar.cc/150?u=${index + 2}",
        nannyIndex: index + 1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: NannyTheme.faintMainColor.withOpacity(0.45),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("Find A Nanny Near You"),
          actions: <Widget>[
            IconButton(
              onPressed: () => {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                    (Route<dynamic> route) => false)
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
            )
          ]),
      body: ListView.builder(
        itemCount: nannyItems.length,
        itemBuilder: (context, index) {
          if (index % 10 == 0) {
            String categoryText = "Nanny near you";
            if (index >= 10 && index < 20) {
              categoryText = "Top Rated";
            } else if (index >= 20 && index < 30) {
              categoryText = "Special Care Nannies";
            } else if (index >= 30 && index < 60) {
              categoryText = "New Nannies";
            }

            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 120),
                        child: Text(
                          categoryText,
                          style: TextStyle(
                            color: NannyTheme.mainColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  GridView.count(
                    primary: false,
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 4.0,
                    shrinkWrap: true,
                    children:
                        nannyItems.sublist(index, index + 10).map((nanny) {
                      return NannyCard(
                        nannyModel: nanny,
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}

class NannyCard extends StatefulWidget {
  final NannyModel nannyModel;

  const NannyCard({super.key, required this.nannyModel});

  @override
  State<NannyCard> createState() => _NannyCardState();
}

class _NannyCardState extends State<NannyCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 7.0,
      margin: widget.nannyModel.nannyIndex.isEven
          ? const EdgeInsets.fromLTRB(10.0, 0.0, 25.0, 10.0)
          : const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 10.0),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 12.0,
          ),
          Container(
            height: 60.0,
            width: 60.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.green,
              image: DecorationImage(
                image: NetworkImage(
                  widget.nannyModel.imageLink,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            widget.nannyModel.name,
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            widget.nannyModel.availability,
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => {
                if (widget.nannyModel.availability == "Available")
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NannyBookingSuccessScreen(),
                      ),
                    ),
                    setState(() {
                      widget.nannyModel.availability = "Booked";
                    })
                  }
              },
              child: Container(
                width: 175.0,
                decoration: BoxDecoration(
                  color: widget.nannyModel.availability == 'Booked'
                      ? Colors.grey
                      : Colors.green,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Request',
                    style: GoogleFonts.quicksand(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
