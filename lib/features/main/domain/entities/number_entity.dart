import 'package:equatable/equatable.dart';

import 'room_entity.dart';

class NumberEntity extends Equatable {
  final List<RoomEntity> rooms;

  const NumberEntity({required this.rooms});
  @override
  List<Object?> get props => [rooms.length];
}
