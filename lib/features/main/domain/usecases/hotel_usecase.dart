import 'package:dartz/dartz.dart';
import 'package:hotel_test/core/entities/app_error.dart';
import 'package:hotel_test/core/entities/no_params.dart';
import 'package:hotel_test/core/usecases/usecase.dart';
import 'package:hotel_test/features/main/domain/entities/hotel_entity.dart';
import 'package:hotel_test/features/main/domain/repository/main_repository.dart';

class GetHotelUseCase extends UseCase<HotelEntity, NoParams> {
  final MainRepository mainRepository;

  GetHotelUseCase(this.mainRepository);
  @override
  Future<Either<AppError, HotelEntity>> call(NoParams params) =>
      mainRepository.getHotel();
}
