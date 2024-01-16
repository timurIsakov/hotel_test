import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_test/features/main/domain/entities/number_entity.dart';
import 'package:hotel_test/features/main/presentation/screens/booking_screen.dart';
import 'package:hotel_test/features/main/presentation/widgets/number_card_widget.dart';

class NumberScreen extends StatefulWidget {
  final String title;

  const NumberScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  final entity = const NumberEntity(
      id: '1',
      name: 'Стандартный с видом на бассейн или сад',
      price: '186 600',
      pricePer: 'за 7 ночей с перелётом',
      features: [
        "Включен только завтрак",
        "Кондиционер"
      ],
      imageUrls: [
        "https://www.atorus.ru/sites/default/files/upload/image/News/56871/%D1%80%D0%B8%D0%BA%D1%81%D0%BE%D1%81% 20%D1%81%D0%B8%D0%B3%D0%B5%D0%B9%D1%82.jpg",
        "https://gogolhotel.ru/images/r4.jpg",
        "https://worlds-trip.ru/wp-content/uploads/2022/10/white-hills-resort-5.jpeg"
      ]);
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
      body: SafeArea(
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
                itemCount: entity.imageUrls.length,
                itemBuilder: (context, index) => NumberCardWidget(
                    numberEntity: entity,
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
      ),
    );
  }
}
