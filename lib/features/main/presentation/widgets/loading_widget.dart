import 'package:flutter/material.dart';
import 'package:hotel_test/core/utils/assets.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(Assets.tLoading),
    );
  }
}