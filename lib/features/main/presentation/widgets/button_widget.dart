import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  const ButtonWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: const Color(0xff0D72FF),
          borderRadius: BorderRadius.circular(15).r),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "SF Pro Display",
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
