import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_test/features/main/presentation/cubit/booking/booking_cubit.dart';
import 'package:hotel_test/features/main/presentation/cubit/hotel/hotel_cubit.dart';
import 'package:hotel_test/features/main/presentation/cubit/rooms/rooms_cubit.dart';
import 'package:hotel_test/features/main/presentation/screens/hotel_screen.dart';
import 'package:hotel_test/get_it/locator.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HotelCubit(locator()),
            ),
            BlocProvider(
              create: (context) => RoomsCubit(locator()),
            ),
            BlocProvider(
              create: (context) => BookingCubit(locator()),
            )
          ],
          child: MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: const Color(0xffF6F6F9),
            ),
            debugShowCheckedModeBanner: false,
            title: 'Hotel Test',
            home: child,
          ),
        );
      },
      child: const HotelScreen(),
    );
  }
}
