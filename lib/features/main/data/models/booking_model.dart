import 'package:hotel_test/features/main/domain/entities/booking_entity.dart';

class BookingModel extends BookingEntity {
  const BookingModel(
      {required super.id,
      required super.name,
      required super.address,
      required super.rating,
      required super.ratingName,
      required super.departure,
      required super.arrivalCountry,
      required super.tourDateStart,
      required super.tourDateStop,
      required super.numberOfNight,
      required super.room,
      required super.nutrition,
      required super.tourPrice,
      required super.fuelCharge,
      required super.serviceCharge});

  factory BookingModel.fromJson({required Map<String, dynamic> json}) {
    return BookingModel(
      id: json['id'],
      name: json['hotel_name'],
      address: json['hotel_adress'],
      rating: json['horating'],
      ratingName: json['rating_name'],
      departure: json['departure'],
      arrivalCountry: json['arrival_country'],
      tourDateStart: json['tour_date_start'],
      tourDateStop: json['tour_date_stop'],
      numberOfNight: json['number_of_nights'],
      room: json['room'],
      nutrition: json['nutrition'],
      tourPrice: json['tour_price'],
      fuelCharge: json['fuel_charge'],
      serviceCharge: json['service_charge'],
    );
  }
}
