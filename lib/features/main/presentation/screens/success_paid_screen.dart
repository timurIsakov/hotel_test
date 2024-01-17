import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_test/core/utils/assets.dart';
import 'package:hotel_test/features/main/presentation/screens/hotel_screen.dart';

import '../widgets/button_widget.dart';

class SuccessPaidScreen extends StatefulWidget {
  const SuccessPaidScreen({Key? key}) : super(key: key);

  @override
  State<SuccessPaidScreen> createState() => _SuccessPaidScreenState();
}

class _SuccessPaidScreenState extends State<SuccessPaidScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Заказ оплачен",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            fontFamily: "SF Pro Display",
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 122.h,
          ),
          SizedBox(
            height: 94.h,
            width: 94.w,
            child: Image.asset(
              Assets.tSuccessImage,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          Text(
            "Ваш заказ принят в работу",
            style: TextStyle(
              fontFamily: "SF Pro Display",
              fontWeight: FontWeight.w500,
              fontSize: 22.sp,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23).r,
            child: Text(
              "Подтверждение заказа №${_getRandomNumber()} может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "SF Pro Display",
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: const Color(0xff828796),
              ),
            ),
          ),
          const Spacer(),
          Container(
            height: 88.h,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              border:
                  Border(top: BorderSide(width: 1, color: Color(0xffE8E9EC))),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 12, bottom: 28)
                  .r,
              child: ButtonWidget(
                text: "Супер!",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HotelScreen(),
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String _getRandomNumber() {
  final random = Random();
  final num = random.nextInt(900000) + 100000;
  return num.toString();
}
