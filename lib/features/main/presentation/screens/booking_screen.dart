import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_test/features/main/domain/entities/booking_entity.dart';
import 'package:hotel_test/features/main/presentation/screens/success_paid_screen.dart';
import 'package:hotel_test/features/main/presentation/widgets/input_widget.dart';
import 'package:intl/intl.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:simple_accordion/simple_accordion.dart';

import '../widgets/button_widget.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final entity = const BookingEntity(
      id: '1',
      name: 'Лучший пятизвездочный отель в Хургаде, Египет',
      address: 'Madinat Makadi, Safaga Road, Makadi Bay, Египет',
      rating: '5',
      ratingName: 'Превосходно',
      departure: 'Москва',
      arrivalCountry: 'Египет, Хургада',
      tourDateStart: '19.09.2023',
      tourDateStop: '27.09.2023',
      numberOfNight: '7',
      room: 'Люкс номер с видом на море',
      nutrition: 'Все включено',
      tourPrice: '289400',
      fuelCharge: '9300',
      serviceCharge: '2150');
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Бронирование",
            style: TextStyle(
              fontFamily: "Sf Pro Display",
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 8.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15).r,
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(16).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 149.w,
                        decoration: BoxDecoration(
                            color: const Color(0xffFFC700).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5).r),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5)
                              .r,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 15.h,
                                width: 15.w,
                                child: const Center(
                                  child: Icon(
                                    Icons.star,
                                    color: Color(0xffFFA800),
                                    size: 15,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                "${entity.rating} ${entity.ratingName}",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Sf Pro Display",
                                  color: const Color(0xffFFA800),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        entity.name,
                        style: TextStyle(
                          fontFamily: "Sf Pro Display",
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          height: 0.h,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        entity.address,
                        style: TextStyle(
                          fontFamily: "Sf Pro Display",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff0D72FF),
                          height: 0.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12).r,
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16).r,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Вылет из",
                            style: TextStyle(
                              fontFamily: "Sf Pro Display",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff828796),
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            "Страна, город",
                            style: TextStyle(
                              fontFamily: "Sf Pro Display",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff828796),
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            "Даты",
                            style: TextStyle(
                              fontFamily: "Sf Pro Display",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff828796),
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            "Кол-во ночей",
                            style: TextStyle(
                              fontFamily: "Sf Pro Display",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff828796),
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            "Отель",
                            style: TextStyle(
                              fontFamily: "Sf Pro Display",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff828796),
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            "Номер",
                            style: TextStyle(
                              fontFamily: "Sf Pro Display",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff828796),
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            "Питание",
                            style: TextStyle(
                              fontFamily: "Sf Pro Display",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff828796),
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            entity.departure,
                            style: TextStyle(
                              fontFamily: "Sf Pro Display",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            entity.arrivalCountry,
                            style: TextStyle(
                              fontFamily: "Sf Pro Display",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            "${entity.tourDateStart} - ${entity.tourDateStop}",
                            style: TextStyle(
                              fontFamily: "Sf Pro Display",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            entity.numberOfNight,
                            style: TextStyle(
                              fontFamily: "Sf Pro Display",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          SizedBox(
                            width: 203.w,
                            child: Text(
                              entity.name,
                              style: TextStyle(
                                fontFamily: "Sf Pro Display",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            entity.room,
                            style: TextStyle(
                              fontFamily: "Sf Pro Display",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            entity.nutrition,
                            style: TextStyle(
                              fontFamily: "Sf Pro Display",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15).r,
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Информация о покупателе",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Sf Pro Display",
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const InputWidget(title: 'Номер телефона'),
                      SizedBox(
                        height: 8.h,
                      ),
                      const InputWidget(title: 'Почта'),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту",
                        style: TextStyle(
                          color: const Color(0xff828796),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Sf Pro Display",
                          height: 0.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15).r,
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16).r,
                  child: Column(
                    children: [
                      SimpleAccordion(
                        children: [
                          AccordionHeaderItem(
                            title: "Первый турист ",
                            headerTextStyle: TextStyle(
                              color: Colors.black,
                              fontFamily: "Sf Pro Display",
                              fontWeight: FontWeight.w500,
                              fontSize: 22.sp,
                            ),
                            children: [
                              AccordionItem(
                                child: InputWidget(
                                  title: "Имя",
                                ),
                              ),
                              AccordionItem(title: "Red"),
                              AccordionItem(title: "Green"),
                              AccordionItem(title: "Black"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15).r,
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 13)
                          .r,
                  child: Row(
                    children: [
                      Text(
                        "Добавить туриста",
                        style: TextStyle(
                          fontFamily: "Sf Pro Display",
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          height: 0.h,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 32.h,
                        width: 32.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6).r,
                          color: const Color(0xff0D72FF),
                        ),
                        child: Center(
                          child: IconButton(
                            color: Colors.white,
                            padding: const EdgeInsets.all(0).r,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                              size: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12).r,
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16).r,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Тур",
                            style: TextStyle(
                              fontFamily: "Sf Pro Display",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff828796),
                              height: 0.h,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "${_formatPrice(price: entity.tourPrice)} ₽",
                            style: TextStyle(
                              fontFamily: "Sf Pro Display",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff828796),
                              height: 0.h,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Топливный сбор",
                            style: TextStyle(
                              fontFamily: "Sf Pro Display",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff828796),
                              height: 0.h,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "${_formatPrice(price: entity.fuelCharge)} ₽",
                            style: TextStyle(
                              fontFamily: "Sf Pro Display",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff828796),
                              height: 0.h,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Сервисный сбор",
                            style: TextStyle(
                              fontFamily: "Sf Pro Display",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff828796),
                              height: 0.h,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "${_formatPrice(price: entity.serviceCharge)} ₽",
                            style: TextStyle(
                              fontFamily: "Sf Pro Display",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff828796),
                              height: 0.h,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "К оплате",
                            style: TextStyle(
                              fontFamily: "Sf Pro Display",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff828796),
                              height: 0.h,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "${_countPrice(tourPrice: entity.tourPrice, fuelCharge: entity.fuelCharge, serviceCharge: entity.serviceCharge)} ₽",
                            style: TextStyle(
                              fontFamily: "Sf Pro Display",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff0D72FF),
                              height: 0.h,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 88.h,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 1, color: Color(0xffE8E9EC))),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 12, bottom: 28)
                      .r,
                  child: ButtonWidget(
                    text:
                        "Оплатить ${_countPrice(tourPrice: entity.tourPrice, fuelCharge: entity.fuelCharge, serviceCharge: entity.serviceCharge)} ₽",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SuccessPaidScreen(),
                          ));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String _countPrice(
    {dynamic tourPrice = 0,
    dynamic fuelCharge = 0,
    dynamic serviceCharge = 0}) {
  final tourInt = int.tryParse(tourPrice) ?? 0;
  final fuelInt = int.tryParse(fuelCharge) ?? 0;
  final serviceInt = int.tryParse(serviceCharge) ?? 0;
  final result = tourInt + fuelInt + serviceInt;
  return NumberFormat.decimalPattern('ru_RU').format(result);
}

String _formatPrice({dynamic price = "0"}) {
  final priceDouble = double.tryParse(price);
  return NumberFormat.decimalPattern('ru_RU').format(priceDouble);
}
