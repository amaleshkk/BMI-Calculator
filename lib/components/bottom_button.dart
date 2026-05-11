import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.buttonTitle,
    required this.onTap,
  });

  final GestureTapCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: kBottomContainerColor,
        ),
        alignment: AlignmentGeometry.center,
        
        margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
        width: double.infinity,
        height: kBottomContainerHeight,
        
        child: Text(
          buttonTitle,
          style: kContentTextStyle.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
