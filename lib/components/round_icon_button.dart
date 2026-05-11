import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';

class RoundIconButton extends StatefulWidget {
  const RoundIconButton({
    super.key,
    required this.buttonIcon,
    required this.onPressed,
  });

  final FaIconData? buttonIcon;
  final VoidCallback? onPressed;

  @override
  State<RoundIconButton> createState() => _RoundIconButtonState();
}

class _RoundIconButtonState extends State<RoundIconButton> {
  Timer? _holdTimer;

  void _startHold() {
    widget.onPressed?.call();
    _holdTimer = Timer.periodic(const Duration(microseconds: 40000), (_) {
      widget.onPressed?.call();
    });
  }

  void _stopHold() {
    _holdTimer?.cancel();
    _holdTimer = null;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _holdTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _startHold(),
      onTapUp: (_) => _stopHold(),
      onTapCancel: _stopHold,
      child: RawMaterialButton(
        onPressed: widget.onPressed,
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
        elevation: 4.0,
        constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
        child: FaIcon(widget.buttonIcon),
      ),
    );
  }
}
