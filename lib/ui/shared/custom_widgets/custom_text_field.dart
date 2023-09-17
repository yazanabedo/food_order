import 'package:flutter/material.dart';
import 'package:food_ordering_sp2/ui/shared/colors.dart';

class CustomTextField extends StatefulWidget {
  final String hitText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  const CustomTextField({
    Key? key,
    required this.hitText,
    required this.controller,
    this.validator,
    this.prefixIcon,
  })
   : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: size.width * 0.05,
          end: size.width * 0.05,
          bottom: size.width * 0.07),
      child: TextFormField(
        
        validator: widget.validator,
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,

          
       
            contentPadding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1, vertical: size.width * 0.05),
            hintText: widget.hitText,
            filled: true,
            fillColor: AppColors.mainGreyColor,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none)),
        //  validator: (value) => validator != null ? validator!(value!) : null,
      ),
    );
  }
}
