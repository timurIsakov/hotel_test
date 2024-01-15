import 'package:equatable/equatable.dart';

class HotelEntity extends Equatable {
  final String id;
  final String name;
  final String address;
  final String minimalPrice;
  final String priceForIt;
  final String rating;
  final String ratingName;
  final List<String> imageUrls;
  final Map<String, dynamic> aboutTheHotel;

  const HotelEntity(
      {required this.id,
      required this.name,
      required this.address,
      required this.minimalPrice,
      required this.priceForIt,
      required this.rating,
      required this.ratingName,
      required this.imageUrls,
      required this.aboutTheHotel});

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
        aboutTheHotel,
      ];
}
