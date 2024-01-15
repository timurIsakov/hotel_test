import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_test/application/application.dart';

import 'get_it/locator.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  setup();
  runApp(const Application());
}
