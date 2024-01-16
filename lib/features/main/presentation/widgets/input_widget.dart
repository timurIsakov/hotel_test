import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputWidget extends StatelessWidget {
  final String title;
  const InputWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF6F6F9),
        borderRadius: BorderRadius.circular(10).r,
      ),
      child: TextFormField(
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
