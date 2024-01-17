import 'package:hotel_test/features/main/domain/entities/about_hotel_entity.dart';

class AboutHotelModel extends AboutHotelEntity {
  const AboutHotelModel(
      {required super.description, required super.peculiarities});

  factory AboutHotelModel.fromJson({required Map<String, dynamic> json}) {
    return AboutHotelModel(
      description: json['description'],
      peculiarities: List<String>.from(json['peculiarities']),
    );
  }

  factory AboutHotelModel.empty() {
    return const AboutHotelModel(
      description: "",
      peculiarities: [],
    );
  }
}
