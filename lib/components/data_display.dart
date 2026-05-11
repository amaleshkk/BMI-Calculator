import 'package:flutter/material.dart';

class DataDisplay extends StatelessWidget {
  const DataDisplay({required this.colour, this.cardChild, this.onPress, super.key});

  final Color colour;
  final Widget? cardChild;
  final GestureTapCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
