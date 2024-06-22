import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final int? maxLength;
  final double? width;
  final TextInputType? keyboardType;

  const CustomTextFormFiled(
      {super.key,
      required this.controller,
      this.validator,
      this.hintText,
      this.maxLength,
      this.width,
      this.keyboardType});

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? MediaQuery.of(context).size.width / 1.4,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        maxLength: widget.maxLength,
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          hintText: widget.hintText,
          counterText: "",
          filled: true,
          fillColor: Colors.white,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.blue)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.blue)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.blue)),
        ),
      ),
    );
  }
}
