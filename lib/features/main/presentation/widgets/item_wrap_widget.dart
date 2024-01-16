import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemWrapWidget extends StatelessWidget {
  final String title;
  const ItemWrapWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5).r,
        color: const Color(0xffFBFBFC),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5).r,
        child: Text(
          title,
          style: TextStyle(
            color: const Color(0xff828796),
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            fontFamily: "Sf Pro Display",
            height: 0,
          ),
        ),
      ),
    );
  }
}
