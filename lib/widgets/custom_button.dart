import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final double? width;
  final String buttonNmae;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color fourgroundColor;
  const CustomButton({
    super.key,
    this.width,
    required this.buttonNmae,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.fourgroundColor = Colors.white,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor,
          foregroundColor: widget.fourgroundColor,
        ),
        onPressed: widget.onPressed,
        child: Text(widget.buttonNmae),
      ),
    );
  }
}
