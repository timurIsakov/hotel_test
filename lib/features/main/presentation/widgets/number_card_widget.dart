import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_test/core/utils/assets.dart';
import 'package:hotel_test/features/main/domain/entities/number_entity.dart';
import 'package:hotel_test/features/main/presentation/widgets/button_widget.dart';
import 'package:hotel_test/features/main/presentation/widgets/item_wrap_widget.dart';

import '../../../../core/components/image_slideshow.dart';

class NumberCardWidget extends StatelessWidget {
  final NumberEntity numberEntity;
  final Function() onTap;
  const NumberCardWidget(
      {Key? key, required this.numberEntity, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12).r,
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: 257.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15).r,
              ),
              child: ImageSlideshow(children: [
                ...List.generate(
                    numberEntity.imageUrls.length,
                    (index) => Image.network(
                          numberEntity.imageUrls[index],
                          fit: BoxFit.cover,
                        )),
              ]),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              numberEntity.name,
              style: TextStyle(
                fontFamily: "Sf Pro Display",
                fontWeight: FontWeight.w500,
                fontSize: 22.sp,
                color: Colors.black,
                height: 0.h,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Wrap(
              spacing: 8.w,
              children: [
                ...List.generate(
                  numberEntity.features.length,
                  (index) => ItemWrapWidget(
                    title: numberEntity.features[index],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              width: 192.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5).r,
                color: const Color(0xff0D72FF).withOpacity(0.1),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 2)
                        .r,
                child: Row(
                  children: [
                    Text(
                      "Подробнее о номере",
                      style: TextStyle(
                        fontFamily: "Sf Pro Display",
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: const Color(0xff0D72FF),
                        height: 0.h,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: SvgPicture.asset(
                          Assets.tArrowRightIcon,
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Text(
                  "${numberEntity.price} ₽",
                  style: TextStyle(
                    fontFamily: "Sf Pro Display",
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
                      numberEntity.pricePer,
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
              ],
            ),
            SizedBox(
              height: 19.h,
            ),
            ButtonWidget(
              text: "Выбрать номер",
              onTap: () {
                onTap.call();
              },
            ),
          ],
        ),
      ),
    );
  }
}
