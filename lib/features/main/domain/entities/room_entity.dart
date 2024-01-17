import 'package:equatable/equatable.dart';

class RoomEntity extends Equatable {
  final int id;
  final String name;
  final int price;
  final String pricePer;
  final List<String> features;
  final List<String> imageUrls;

  const RoomEntity(
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
