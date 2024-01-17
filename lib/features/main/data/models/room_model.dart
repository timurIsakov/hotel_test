import 'package:hotel_test/features/main/domain/entities/room_entity.dart';

class RoomModel extends RoomEntity {
  const RoomModel(
      {required super.id,
      required super.name,
      required super.price,
      required super.pricePer,
      required super.features,
      required super.imageUrls});

  factory RoomModel.fromJson({required Map<String, dynamic> json}) {
    return RoomModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      pricePer: json['price_per'],
      features: List.from(json['peculiarities']),
      imageUrls: List.from(
        json['image_urls'],
      ),
    );
  }
}
