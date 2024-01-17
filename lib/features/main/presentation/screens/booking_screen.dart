import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_test/core/utils/form_validator.dart';
import 'package:hotel_test/core/utils/number_helper.dart';
import 'package:hotel_test/features/main/domain/entities/booking_entity.dart';
import 'package:hotel_test/features/main/presentation/screens/success_paid_screen.dart';
import 'package:hotel_test/features/main/presentation/widgets/input_widget.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:simple_accordion/simple_accordion.dart';

import '../widgets/button_widget.dart';

final Map<int, String> cards = {
  0: "Первый турист",
  1: "Второй турист",
  2: "Третий турист",
  3: "Четвертый турист",
  4: "Пятый турист",
  5: "Шестой турист",
  6: "Седьмой турист",
  7: "Восьмой турист",
  8: "Девятый турист",
  9: "Десятый турист",
};

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  late TextEditingController controllerPhone;
  late TextEditingController controllerEmail;
  late TextEditingController controllerName;
  late TextEditingController controllerSurname;
  late TextEditingController controllerBirthday;
  late TextEditingController controllerCountry;
  late TextEditingController controllerNumberPassport;
  late TextEditingController controllerDatePassport;
  late GlobalKey<FormState> formKey;

  int touristsCount = 1;

  @override
  void initState() {
    controllerPhone = TextEditingController();
    controllerEmail = TextEditingController();
    controllerName = TextEditingController();
    controllerSurname = TextEditingController();
    controllerBirthday = TextEditingController();
    controllerCountry = TextEditingController();
    controllerNumberPassport = TextEditingController();
    controllerDatePassport = TextEditingController();
    formKey = GlobalKey<FormState>();
    controllerPhone.text = "+7";
    super.initState();
  }

  @override
  void dispose() {
    controllerPhone.dispose();
    controllerEmail.dispose();
    controllerName.dispose();
    controllerSurname.dispose();
    controllerBirthday.dispose();
    controllerCountry.dispose();
    controllerNumberPassport.dispose();
    controllerDatePassport.dispose();
    super.dispose();
  }

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
    serviceCharge: '2150',
  );

  var maskFormatter = MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

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
        body: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
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
                    child: Column(
                      children: [
                        _item("Вылет из", entity.departure),
                        SizedBox(height: 16.h),
                        _item("Страна, Город", entity.arrivalCountry),
                        SizedBox(height: 16.h),
                        _item("Даты",
                            "${entity.tourDateStart} - ${entity.tourDateStop}"),
                        SizedBox(height: 16.h),
                        _item("Кол-во ночей", "${entity.numberOfNight} ночей"),
                        SizedBox(height: 16.h),
                        _item("Отель", entity.name),
                        SizedBox(height: 16.h),
                        _item("Номер", entity.room),
                        SizedBox(height: 16.h),
                        _item("Питание", entity.nutrition),
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
                        InputWidget(
                          title: 'Номер телефона',
                          controller: controllerPhone,
                          textInputFormatter: maskFormatter,
                          validator: (value) {
                            return FormValidator.empty(value, "");
                          },
                          onSubmit: (String? value) {},
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        InputWidget(
                          title: 'Почта',
                          controller: controllerEmail,
                          validator: FormValidator.validateEmail,
                          onSubmit: (String? value) {},
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          "Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту",
                          style: TextStyle(
                            color: const Color(0xff828796),
                            fontSize: 14.sp,
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
                    borderRadius: BorderRadius.circular(12).r,
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16).r,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: touristsCount,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final title = cards[index];
                        return SimpleAccordion(
                          children: [
                            AccordionHeaderItem(
                              title: title,
                              headerTextStyle: TextStyle(
                                color: Colors.black,
                                fontFamily: "SF Pro Display",
                                fontWeight: FontWeight.w500,
                                fontSize: 22.sp,
                              ),
                              children: [
                                AccordionItem(
                                  child: SizedBox(
                                    height: 17.h,
                                  ),
                                ),
                                AccordionItem(
                                  child: InputWidget(
                                    title: "Имя",
                                    controller: controllerName,
                                    onSubmit: (String? value) {},
                                    validator: (value) {
                                      return FormValidator.empty(value, "");
                                    },
                                  ),
                                ),
                                AccordionItem(
                                  child: SizedBox(
                                    height: 8.h,
                                  ),
                                ),
                                AccordionItem(
                                  child: InputWidget(
                                    title: "Фамилия",
                                    controller: controllerSurname,
                                    onSubmit: (String? value) {},
                                    validator: (value) {
                                      return FormValidator.empty(value, "");
                                    },
                                  ),
                                ),
                                AccordionItem(
                                  child: SizedBox(
                                    height: 8.h,
                                  ),
                                ),
                                AccordionItem(
                                  child: InputWidget(
                                    title: "Дата рождения",
                                    controller: controllerBirthday,
                                    onSubmit: (String? value) {},
                                    validator: (value) {
                                      return FormValidator.empty(value, "");
                                    },
                                  ),
                                ),
                                AccordionItem(
                                  child: SizedBox(
                                    height: 8.h,
                                  ),
                                ),
                                AccordionItem(
                                  child: InputWidget(
                                    title: "Гражданство",
                                    controller: controllerCountry,
                                    onSubmit: (String? value) {},
                                    validator: (value) {
                                      return FormValidator.empty(value, "");
                                    },
                                  ),
                                ),
                                AccordionItem(
                                  child: SizedBox(
                                    height: 8.h,
                                  ),
                                ),
                                AccordionItem(
                                  child: InputWidget(
                                    title: "Номер загранпаспорта",
                                    controller: controllerNumberPassport,
                                    onSubmit: (String? value) {},
                                    validator: (value) {
                                      return FormValidator.empty(value, "");
                                    },
                                  ),
                                ),
                                AccordionItem(
                                  child: SizedBox(
                                    height: 8.h,
                                  ),
                                ),
                                AccordionItem(
                                  child: InputWidget(
                                    title: "Срок действия загранпаспорта",
                                    controller: controllerDatePassport,
                                    onSubmit: (String? value) {},
                                    validator: (value) {
                                      return FormValidator.empty(value, "");
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
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
                            fontFamily: "SF Pro Display",
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            height: 0.h,
                          ),
                        ),
                        const Spacer(),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: touristsCount == 10
                                ? null
                                : () {
                                    if (touristsCount < 10) {
                                      touristsCount++;
                                      setState(() {});
                                    }
                                  },
                            child: Ink(
                              height: 32.h,
                              width: 32.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6).r,
                                color: const Color(0xff0D72FF),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  size: 24,
                                  color: Colors.white,
                                ),
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
                        _itemPrice("Тур", entity.tourPrice),
                        SizedBox(
                          height: 16.h,
                        ),
                        _itemPrice("Топливный сбор", entity.fuelCharge),
                        SizedBox(
                          height: 16.h,
                        ),
                        _itemPrice("Сервисный сбор", entity.serviceCharge),
                        SizedBox(
                          height: 16.h,
                        ),
                        _itemPrice(
                            "К оплате",
                            colorValue: const Color(0xff0D72FF),
                            _countPrice(
                                tourPrice: entity.tourPrice,
                                fuelCharge: entity.fuelCharge,
                                serviceCharge: entity.serviceCharge),
                            withFormat: false),
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
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SuccessPaidScreen(),
                              ));
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _item(String title, String value) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontFamily: "SF Pro Display",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xff828796),
        ),
      ),
      const Spacer(),
      SizedBox(
        width: 203.w,
        child: Text(
          value,
          style: TextStyle(
            fontFamily: "SF Pro Display",
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
    ],
  );
}

Widget _itemPrice(String title, String value,
    {bool withFormat = true, Color? colorValue}) {
  return Row(
    children: [
      Text(
        title,
        style: TextStyle(
          fontFamily: "SF Pro Display",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xff828796),
          height: 0.h,
        ),
      ),
      const Spacer(),
      Text(
        withFormat
            ? "${NumberHelper.formatNumber(int.parse(value))} ₽"
            : "$value ₽",
        style: TextStyle(
          fontFamily: "SF Pro Display",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: colorValue ?? Colors.black,
          height: 0.h,
        ),
      ),
    ],
  );
}

String _countPrice(
    {required String tourPrice,
    required String fuelCharge,
    required String serviceCharge}) {
  final tourInt = int.parse(tourPrice);
  final fuelInt = int.parse(fuelCharge);
  final serviceInt = int.parse(serviceCharge);
  final int result = tourInt + fuelInt + serviceInt;

  return NumberHelper.formatNumber(result);
}
