import 'package:hotel_test/features/main/domain/entities/hotel_entity.dart';

class HotelModel extends HotelEntity {
  const HotelModel(
      {required super.id,
      required super.name,
      required super.address,
      required super.minimalPrice,
      required super.priceForIt,
      required super.rating,
      required super.ratingName,
      required super.imageUrls,
      required super.aboutTheHotel});

  factory HotelModel.fromJson({required Map<String, dynamic> json}) {
    return HotelModel(
      id: json['id'],
      name: json['name'],
      address: json['adress'],
      minimalPrice: json['minimal_price'],
      priceForIt: json['price_for_it'],
      rating: json['rating'],
      ratingName: json['rating_name'],
      imageUrls: json['image_urls'],
      aboutTheHotel: json['about_the_hotel'],
    );
  }
}
