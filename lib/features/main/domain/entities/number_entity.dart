import 'package:equatable/equatable.dart';

class NumberEntity extends Equatable {
  final String id;
  final String name;
  final String price;
  final String pricePer;
  final List<String> features;
  final List<String> imageUrls;

  const NumberEntity(
      {required this.id,
      required this.name,
      required this.price,
      required this.pricePer,
      required this.features,
      required this.imageUrls});

  @override
  List<Object?> get props => [
        id,
        name,
        price,
        pricePer,
        features,
        imageUrls,
      ];
}
