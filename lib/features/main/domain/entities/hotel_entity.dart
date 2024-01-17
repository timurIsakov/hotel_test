import 'package:equatable/equatable.dart';
import 'package:hotel_test/features/main/domain/entities/about_hotel_entity.dart';

class HotelEntity extends Equatable {
  final int id;
  final String name;
  final String address;
  final int minimalPrice;
  final String priceForIt;
  final int rating;
  final String ratingName;
  final List<String> imageUrls;
  final AboutHotelEntity aboutHotelEntity;

  const HotelEntity(
      {required this.id,
      required this.name,
      required this.address,
      required this.minimalPrice,
      required this.priceForIt,
      required this.rating,
      required this.ratingName,
      required this.imageUrls,
      required this.aboutHotelEntity});

  @override
  List<Object?> get props => [
        id,
        name,
        address,
        minimalPrice,
        priceForIt,
        rating,
        ratingName,
        imageUrls,
        aboutHotelEntity,
      ];
}
