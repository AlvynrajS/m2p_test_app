import 'package:flutter/material.dart';

class CustomDropdownFormField extends StatefulWidget {
  final List<String> options;
  final String? value;
  final String? hintText;
  final void Function(String?)? onChanged;

  const CustomDropdownFormField({
    super.key,
    required this.options,
    this.value,
    this.hintText,
    this.onChanged,
  });

  @override
  State<CustomDropdownFormField> createState() =>
      _CustomDropdownFormFieldState();
}

class _CustomDropdownFormFieldState extends State<CustomDropdownFormField> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showDropdown,
      child: InputDecorator(
        decoration: InputDecoration(
          hintText: widget.hintText ?? 'Select an option',
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedValue ?? widget.hintText ?? 'Select an option',
              style: TextStyle(
                  color: _selectedValue != null ? Colors.black : Colors.grey),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  void _showDropdown() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(widget.hintText ?? 'Select an option'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: widget.options.map((String option) {
                return ListTile(
                  title: Text(option),
                  onTap: () {
                    setState(() {
                      _selectedValue = option;
                    });
                    widget.onChanged?.call(_selectedValue);
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
