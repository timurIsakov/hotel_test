import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_test/features/main/presentation/cubit/hotel/hotel_cubit.dart';
import 'package:hotel_test/features/main/presentation/screens/number_screen.dart';
import 'package:hotel_test/features/main/presentation/widgets/button_widget.dart';
import '../../../../core/components/image_slideshow.dart';
import '../../../../core/utils/assets.dart';
import '../widgets/item_wrap_widget.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({Key? key}) : super(key: key);

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  @override
  void initState() {
    BlocProvider.of<HotelCubit>(context).load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HotelCubit, HotelState>(
        builder: (context, state) {
          if (state is HotelLoading) {
            return const Center(
              child: RefreshProgressIndicator(),
            );
          }
          if (state is HotelLoaded) {
            return SingleChildScrollView(
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
                                    state.hotelEntity.imageUrls.length,
                                    (index) => Image.network(
                                      state.hotelEntity.imageUrls[index],
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
                                    "${state.hotelEntity.rating} ${state.hotelEntity.ratingName}",
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
                            state.hotelEntity.name,
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
                            state.hotelEntity.address,
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
                                "от ${_formatPrice(price: state.hotelEntity.minimalPrice)} ₽",
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
                                state.hotelEntity.aboutHotelEntity.peculiarities
                                    .length,
                                (index) => ItemWrapWidget(
                                  title: state.hotelEntity.aboutHotelEntity
                                      .peculiarities[index],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                            state.hotelEntity.aboutHotelEntity.description,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                        child: const Icon(
                                            Icons.arrow_forward_ios_sharp),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                        child: const Icon(
                                            Icons.arrow_forward_ios_sharp),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                        child: const Icon(
                                            Icons.arrow_forward_ios_sharp),
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
                      border: Border(
                        top: BorderSide(
                          width: 1,
                          color: Color(0xffE8E9EC),
                        ),
                      ),
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
                                title: state.hotelEntity.name,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

String _formatPrice({required int price}) {
  final priceDouble = price;
  return NumberFormat.decimalPattern('ru_RU').format(priceDouble);
}
