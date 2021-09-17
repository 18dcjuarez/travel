import 'package:flutter/material.dart';
import 'package:travel/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;

class InputField extends StatefulWidget {
  const InputField(
      {Key? key,
      required this.isPassField,
      required this.controller,
      required this.inputLabel,
      required this.onChanged})
      : super(key: key);

  final bool isPassField;
  final TextEditingController controller;
  final String inputLabel;
  final void Function(String) onChanged;

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: TextFormField(
        onChanged: widget.onChanged,
        obscureText: widget.isPassField ? !isVisible : false,
        keyboardType: widget.isPassField
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: widget.inputLabel,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          fillColor: white,
          prefixIcon: Icon(
            widget.isPassField
                ? Icons.lock_outline_rounded
                : Icons.person_outline,
            color: pink,
          ),
          suffixIcon: widget.isPassField
              ? IconButton(
                  icon: Icon(
                    isVisible
                        ? Icons.hide_source
                        : Icons.remove_red_eye_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                )
              : null,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: pink)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: white)),
        ),
      ),
    );
  }
}
