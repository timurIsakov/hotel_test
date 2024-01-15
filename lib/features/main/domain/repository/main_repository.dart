import 'package:dartz/dartz.dart';
import 'package:hotel_test/features/main/domain/entities/hotel_entity.dart';

import '../../../../core/entities/app_error.dart';

abstract class MainRepository {
  Future<Either<AppError, HotelEntity>> getHotel();
}
