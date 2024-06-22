import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final double? width;
  final String buttonName;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color fourgroundColor;


  const CustomButton({
    super.key,
    this.width,
    required this.buttonName,
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
        style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all<Color>(widget.fourgroundColor),
            backgroundColor: WidgetStateProperty.all<Color>(widget.backgroundColor),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.blue)))),
        onPressed: widget.onPressed,
        child: Text(widget.buttonName),
      ),
    );
  }
}
