import 'package:dartz/dartz.dart';
import 'package:hotel_test/features/main/domain/entities/booking_entity.dart';
import 'package:hotel_test/features/main/domain/entities/hotel_entity.dart';

import '../../../../core/entities/app_error.dart';
import '../entities/number_entity.dart';

abstract class MainRepository {
  Future<Either<AppError, HotelEntity>> getHotel();
  Future<Either<AppError, NumberEntity>> getRooms();
  Future<Either<AppError, BookingEntity>> getBooking();
}
