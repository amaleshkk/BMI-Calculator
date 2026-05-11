import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

class DisplayContent extends StatelessWidget {
  const DisplayContent({super.key, required this.icon, required this.label});

  final FaIconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(icon, size: 80.0, color: Colors.white),
        SizedBox(height: 15.0),
        Text(label, style: kContentTextStyle),
      ],
    );
  }
}
