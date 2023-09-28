import 'package:flutter/material.dart';

class AppCircleButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;

  const AppCircleButton({Key? key, required this.onTap, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        child: Center(child: child),
      ),
    );
  }
}
