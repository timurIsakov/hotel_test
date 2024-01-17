import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputWidget extends StatelessWidget {
  final String title;
  final String? Function(String?)? validator;
  final Function(String?) onSubmit;
  final TextEditingController controller;
  final TextInputFormatter? textInputFormatter;
  const InputWidget(
      {Key? key,
      required this.title,
      this.validator,
      required this.onSubmit,
      required this.controller,
      this.textInputFormatter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF6F6F9),
        borderRadius: BorderRadius.circular(10).r,
      ),
      child: TextFormField(
        inputFormatters: textInputFormatter != null
            ? [
                textInputFormatter!,
              ]
            : null,
        onFieldSubmitted: (value) => onSubmit.call(value),
        controller: controller,
        validator: validator,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: 16, top: 10, bottom: 10).r,
            labelText: title,
            border: InputBorder.none,
            labelStyle: const TextStyle(color: Color(0xffA9ABB7))),
      ),
    );
  }
}
