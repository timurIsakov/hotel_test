import 'package:equatable/equatable.dart';

class BookingEntity extends Equatable {
  final String id;
  final String name;
  final String address;
  final String rating;
  final String ratingName;
  final String departure;
  final String arrivalCountry;
  final String tourDateStart;
  final String tourDateStop;
  final String numberOfNight;
  final String room;
  final String nutrition;
  final String tourPrice;
  final String fuelCharge;
  final String serviceCharge;

  const BookingEntity(
      {required this.id,
      required this.name,
      required this.address,
      required this.rating,
      required this.ratingName,
      required this.departure,
      required this.arrivalCountry,
      required this.tourDateStart,
      required this.tourDateStop,
      required this.numberOfNight,
      required this.room,
      required this.nutrition,
      required this.tourPrice,
      required this.fuelCharge,
      required this.serviceCharge});

  @override
  List<Object?> get props => [
        id,
        name,
        address,
        rating,
        ratingName,
        departure,
        arrivalCountry,
        tourDateStart,
        tourDateStop,
        numberOfNight,
        room,
        nutrition,
        tourPrice,
        fuelCharge,
        serviceCharge,
      ];
}
