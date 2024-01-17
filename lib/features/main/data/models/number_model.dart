import 'package:hotel_test/features/main/data/models/room_model.dart';
import 'package:hotel_test/features/main/domain/entities/number_entity.dart';

class NumberModel extends NumberEntity {
  const NumberModel({required super.rooms});

  factory NumberModel.fromJson(Map<String, dynamic> json) {
    return NumberModel(
        rooms: List.from(json['rooms'])
            .map((e) => RoomModel.fromJson(json: e))
            .toList());
  }
}
