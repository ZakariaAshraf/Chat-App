import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({Key? key,this.title, this.controller,this.validator,this.maxLines=1, this.label, this.suffixIcon, this.obsecure=false,}) : super(key: key);
 final TextEditingController? controller;
 final String? title ;
  final FormFieldValidator<String>? validator;
  final int maxLines;
  final String? label;
  final Widget? suffixIcon;
 final bool obsecure;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(style: TextStyle(),
      keyboardType: TextInputType.name,
      maxLines: maxLines,
      validator: validator,
      controller: controller,
      obscureText:obsecure,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        suffixIcon: suffixIcon,
        suffixIconColor: theme.primaryColor,
        hintText: title,
       labelText: label,
        labelStyle: TextStyle(color: Colors.blue),
      ),
    );
  }
}
