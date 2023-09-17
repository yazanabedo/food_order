import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextFild_Widget extends StatefulWidget {
  const TextFild_Widget(
      {super.key,
      required this.hintText,
      required this.controlar,
      this.validator,
      this.prefixIcon,  // قم بإضافة الخاصية هنا
      });
  final String hintText;
  final TextEditingController controlar;
  final String? Function(String?)? validator;
  final Widget? prefixIcon; // إضافة الخاصية هنا

  @override
  State<TextFild_Widget> createState() => _TextFild_WidgetState();
}

class _TextFild_WidgetState extends State<TextFild_Widget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: size.width * 0.08),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controlar,
        decoration: InputDecoration(
          errorStyle: TextStyle(color: Colors.red),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Color.fromARGB(124, 124, 124, 124)),
          filled: true,
          fillColor: Color.fromARGB(239, 245, 244, 244),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(size.width * 0.5)),
          contentPadding: EdgeInsets.symmetric(
              vertical: size.width * 0.05, horizontal: size.width * 0.12),
          // إضافة الخاصية هنا
          prefixIcon: widget.prefixIcon,
        ),
      ),
    );
  }
}
