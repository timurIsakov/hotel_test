import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_test/features/main/domain/entities/hotel_entity.dart';

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
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).r,
        child: Column(
          children: [

          ],

        ),
      ),
    );
  }
}
