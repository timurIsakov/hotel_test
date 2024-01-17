import 'package:equatable/equatable.dart';

class AboutHotelEntity extends Equatable {
  final String description;
  final List<String> peculiarities;

  const AboutHotelEntity(
      {required this.description, required this.peculiarities});

  @override
  List<Object?> get props => [description, peculiarities];
}
