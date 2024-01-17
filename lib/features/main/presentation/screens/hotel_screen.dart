import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_test/features/main/domain/entities/hotel_entity.dart';
import 'package:hotel_test/features/main/presentation/screens/number_screen.dart';
import 'package:hotel_test/features/main/presentation/widgets/button_widget.dart';
import 'package:intl/intl.dart';

import '../../../../core/components/image_slideshow.dart';
import '../../../../core/utils/assets.dart';
import '../widgets/item_wrap_widget.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({Key? key}) : super(key: key);

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  final entity = const HotelEntity(
      id: "1",
      name: "Лучший пятизвездочный отель в Хургаде, Египет",
      address: "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
      minimalPrice: "134268",
      priceForIt: "За тур с перелётом",
      rating: "5",
      ratingName: "Превосходно",
      imageUrls: [
        "https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg",
        "https://media.admagazine.ru/photos/61408b2f4311246f36873963/16:9/w_1280,c_limit/w2000%20-%202020-07-14T164056.159.jpg",
        "https://travelata.ru/blog/wp-content/uploads/2019/06/Starlight-Convention-Center-Thalasso-Spa.jpg"
      ],
      aboutTheHotel: {
        "description":
            "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!",
        "peculiarities": [
          "Бесплатный Wifi на всей территории отеля",
          "1 км до пляжа",
          "Бесплатный фитнес-клуб",
          "20 км до аэропорта"
        ]
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(12).r,
                    bottomRight: const Radius.circular(12).r),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 63.h,
                    ),
                    Center(
                      child: Text(
                        "Отель",
                        style: TextStyle(
                          fontFamily: "SF Pro Display",
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      height: 257.h,
                      width: MediaQuery.of(context).size.width,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15).r,
                      ),
                      child: ImageSlideshow(
                          indicatorBackgroundColor: Colors.grey,
                          indicatorColor: Colors.black,
                          children: [
                            ...List.generate(
                              entity.imageUrls.length,
                              (index) => Image.network(
                                entity.imageUrls[index],
                                fit: BoxFit.cover,
                              ),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
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
                      entity.name,
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
                      entity.address,
                      style: TextStyle(
                        fontFamily: "SF Pro Display",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff0D72FF),
                        height: 0.h,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "от ${_formatPrice(price: entity.minimalPrice)} ₽",
                          style: TextStyle(
                            fontFamily: "SF Pro Display",
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            height: 0.h,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "за тур с перелётом",
                              style: TextStyle(
                                fontFamily: "SF Pro Display",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff828796),
                                height: 0.h,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Об отеле",
                      style: TextStyle(
                        fontFamily: "SF Pro Display",
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        height: 0.h,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Wrap(
                      runSpacing: 8.w,
                      spacing: 8.w,
                      children: [
                        ...List.generate(
                          entity.aboutTheHotel['peculiarities'].length,
                          (index) => ItemWrapWidget(
                            title: entity.aboutTheHotel['peculiarities'][index],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      entity.aboutTheHotel['description'],
                      style: TextStyle(
                        fontFamily: "SF Pro Display",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        height: 0.h,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15).r,
                        color: const Color(0xffFBFBFC),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15).r,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 24.h,
                                  width: 24.w,
                                  child: SvgPicture.asset(
                                    Assets.tHappyIcon,
                                  ),
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Удобства",
                                      style: TextStyle(
                                          fontFamily: "SF Pro Display",
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          height: 0.h),
                                    ),
                                    Text(
                                      "Самое необходимое",
                                      style: TextStyle(
                                          fontFamily: "SF Pro Display",
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff828796),
                                          height: 0.h),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                SizedBox(
                                  height: 24.h,
                                  width: 24.w,
                                  child:
                                      const Icon(Icons.arrow_forward_ios_sharp),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 36).r,
                              child: const Divider(),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 24.h,
                                  width: 24.w,
                                  child: SvgPicture.asset(
                                    Assets.tTickIcon,
                                  ),
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Что включено",
                                      style: TextStyle(
                                          fontFamily: "SF Pro Display",
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          height: 0.h),
                                    ),
                                    Text(
                                      "Самое необходимое",
                                      style: TextStyle(
                                          fontFamily: "SF Pro Display",
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff828796),
                                          height: 0.h),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                SizedBox(
                                  height: 24.h,
                                  width: 24.w,
                                  child:
                                      const Icon(Icons.arrow_forward_ios_sharp),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 36).r,
                              child: const Divider(),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 24.h,
                                  width: 24.w,
                                  child: SvgPicture.asset(
                                    Assets.tCloseIcon,
                                  ),
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Что не включено",
                                      style: TextStyle(
                                          fontFamily: "SF Pro Display",
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          height: 0.h),
                                    ),
                                    Text(
                                      "Самое необходимое",
                                      style: TextStyle(
                                          fontFamily: "SF Pro Display",
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff828796),
                                          height: 0.h),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                SizedBox(
                                  height: 24.h,
                                  width: 24.w,
                                  child:
                                      const Icon(Icons.arrow_forward_ios_sharp),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Container(
              height: 88.h,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                border:
                    Border(top: BorderSide(width: 1, color: Color(0xffE8E9EC))),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 12, bottom: 28)
                    .r,
                child: ButtonWidget(
                  text: "К выбору номера",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NumberScreen(
                            title: entity.name,
                          ),
                        ));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _formatPrice({required dynamic price}) {
  final priceDouble = double.tryParse(price);
  return NumberFormat.decimalPattern('ru_RU').format(priceDouble);
}
