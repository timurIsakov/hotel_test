import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_test/features/main/presentation/cubit/rooms/rooms_cubit.dart';
import 'package:hotel_test/features/main/presentation/screens/booking_screen.dart';
import 'package:hotel_test/features/main/presentation/widgets/number_card_widget.dart';

import '../widgets/loading_widget.dart';

class NumberScreen extends StatefulWidget {
  final String title;

  const NumberScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  @override
  void initState() {
    BlocProvider.of<RoomsCubit>(context).load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            fontFamily: "Sf Pro Display",
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<RoomsCubit, RoomsState>(
        builder: (context, state) {
          if (state is RoomsLoading) {
            return const LoadingWidget();
          }
          if (state is RoomsLoaded) {
            return SafeArea(
              top: false,
              child: ListView(children: [
                Column(
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.numberEntity.rooms.length,
                      itemBuilder: (context, index) => NumberCardWidget(
                          numberEntity: state.numberEntity.rooms[index],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BookingScreen(),
                              ),
                            );
                          }),
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 8.h,
                        );
                      },
                    ),
                  ],
                ),
              ]),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
