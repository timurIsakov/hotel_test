import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_test/core/utils/form_validator.dart';
import 'package:hotel_test/core/utils/number_helper.dart';
import 'package:hotel_test/features/main/presentation/cubit/booking/booking_cubit.dart';
import 'package:hotel_test/features/main/presentation/screens/success_paid_screen.dart';
import 'package:hotel_test/features/main/presentation/widgets/input_widget.dart';
import 'package:hotel_test/features/main/presentation/widgets/loading_widget.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../widgets/button_widget.dart';

final Map<int, String> cards = {
  0: "Первый турист",
  1: "Второй турист",
  2: "Третий турист",
  3: "Четвертый турист",
  4: "Пятый турист",
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
    BlocProvider.of<BookingCubit>(context).load();
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

  var maskFormatter = MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var maskFormatterDate = MaskTextInputFormatter(
      mask: '##-##-####',
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
        body: BlocBuilder<BookingCubit, BookingState>(
          builder: (context, state) {
            if (state is BookingLoading) {
              return const LoadingWidget();
            }
            if (state is BookingLoaded) {
              return Form(
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
                                decoration: BoxDecoration(
                                    color: const Color(0xffFFC700)
                                        .withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(5).r),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5)
                                      .r,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
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
                                        "${state.bookingEntity.rating} ${state.bookingEntity.ratingName}",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "SF Pro Display",
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
                                state.bookingEntity.name,
                                style: TextStyle(
                                  fontFamily: "SF Pro Display",
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
                                state.bookingEntity.address,
                                style: TextStyle(
                                  fontFamily: "SF Pro Display",
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
                              _item("Вылет из", state.bookingEntity.departure),
                              SizedBox(height: 16.h),
                              _item("Страна, Город",
                                  state.bookingEntity.arrivalCountry),
                              SizedBox(height: 16.h),
                              _item("Даты",
                                  "${state.bookingEntity.tourDateStart} - ${state.bookingEntity.tourDateStop}"),
                              SizedBox(height: 16.h),
                              _item("Кол-во ночей",
                                  "${state.bookingEntity.numberOfNight} ночей"),
                              SizedBox(height: 16.h),
                              _item("Отель", state.bookingEntity.name),
                              SizedBox(height: 16.h),
                              _item("Номер", state.bookingEntity.room),
                              SizedBox(height: 16.h),
                              _item("Питание", state.bookingEntity.nutrition),
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
                                  fontFamily: "SF Pro Display",
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
                                  fontFamily: "SF Pro Display",
                                  height: 0.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: touristsCount,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final title = cards[index];
                          return Accordion(
                            disableScrolling: true,
                            paddingListTop: 8,
                            paddingListBottom: 0,
                            paddingListHorizontal: 0,
                            headerBackgroundColor: Colors.white,
                            rightIcon: Container(
                              height: 32.h,
                              width: 32.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6).r,
                                  color: Colors.blue.withOpacity(0.1)),
                              child: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xff0D72FF),
                              ),
                            ),
                            children: [
                              AccordionSection(
                                header: Text(
                                  title!,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "SF Pro Display",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22.sp,
                                  ),
                                ),
                                headerPadding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 17),
                                contentBackgroundColor: Colors.white,
                                contentBorderColor: Colors.white,
                                contentBorderWidth: 0,
                                contentHorizontalPadding: 16.w,
                                contentVerticalPadding: 0,
                                paddingBetweenClosedSections: 0,
                                paddingBetweenOpenSections: 0,
                                content: Column(
                                  children: [
                                    InputWidget(
                                      title: "Имя",
                                      onSubmit: (value) {},
                                      controller: controllerName,
                                      validator: (p0) {
                                        return FormValidator.empty(
                                            p0, "Заполните поле");
                                      },
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    InputWidget(
                                      title: "Фамилия",
                                      onSubmit: (value) {},
                                      controller: controllerSurname,
                                      validator: (p0) {
                                        return FormValidator.empty(
                                            p0, "Заполните поле");
                                      },
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    InputWidget(
                                      title: "Дата рождения",
                                      onSubmit: (value) {},
                                      controller: controllerBirthday,
                                      textInputFormatter: maskFormatterDate,
                                      validator: (p0) {
                                        return FormValidator.empty(
                                            p0, "Заполните поле");
                                      },
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    InputWidget(
                                      title: "Гражданство",
                                      onSubmit: (value) {},
                                      controller: controllerCountry,
                                      validator: (p0) {
                                        return FormValidator.empty(
                                            p0, "Заполните поле");
                                      },
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    InputWidget(
                                      title: "Номер загранпаспорта",
                                      onSubmit: (value) {},
                                      controller: controllerNumberPassport,
                                      validator: (p0) {
                                        return FormValidator.empty(
                                            p0, "Заполните поле");
                                      },
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    InputWidget(
                                      title: "Срок действия загранпаспорта",
                                      onSubmit: (value) {},
                                      controller: controllerDatePassport,
                                      validator: (p0) {
                                        return FormValidator.empty(
                                            p0, "Заполните поле");
                                      },
                                      textInputFormatter: maskFormatterDate,
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15).r,
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 13)
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
                              _itemPrice("Тур",
                                  state.bookingEntity.tourPrice.toString()),
                              SizedBox(
                                height: 16.h,
                              ),
                              _itemPrice("Топливный сбор",
                                  state.bookingEntity.fuelCharge.toString()),
                              SizedBox(
                                height: 16.h,
                              ),
                              _itemPrice("Сервисный сбор",
                                  state.bookingEntity.serviceCharge.toString()),
                              SizedBox(
                                height: 16.h,
                              ),
                              _itemPrice(
                                  "К оплате",
                                  colorValue: const Color(0xff0D72FF),
                                  _countPrice(
                                      tourPrice: state.bookingEntity.tourPrice
                                          .toString(),
                                      fuelCharge: state.bookingEntity.fuelCharge
                                          .toString(),
                                      serviceCharge: state
                                          .bookingEntity.serviceCharge
                                          .toString()),
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
                              top: BorderSide(
                                  width: 1, color: Color(0xffE8E9EC))),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                                  left: 16, right: 16, top: 12, bottom: 28)
                              .r,
                          child: ButtonWidget(
                            text:
                                "Оплатить ${_countPrice(tourPrice: state.bookingEntity.tourPrice.toString(), fuelCharge: state.bookingEntity.fuelCharge.toString(), serviceCharge: state.bookingEntity.serviceCharge.toString())} ₽",
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SuccessPaidScreen(),
                                  ),
                                );
                                controllerDatePassport.text = '';
                                controllerEmail.text = '';
                                controllerPhone.text = '';
                                controllerName.text = '';
                                controllerBirthday.text = '';
                                controllerSurname.text = '';
                                controllerCountry.text = '';
                                controllerNumberPassport.text = '';
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox();
          },
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
