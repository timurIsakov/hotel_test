import 'package:dartz/dartz.dart';
import 'package:hotel_test/core/entities/app_error.dart';
import 'package:hotel_test/features/main/data/datasource/main_remote_data_source.dart';
import 'package:hotel_test/features/main/domain/entities/hotel_entity.dart';
import 'package:hotel_test/features/main/domain/repository/main_repository.dart';

class MainRepositoryImpl extends MainRepository {
  final MainRemoteDataSource remoteDataSource;

  MainRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<AppError, HotelEntity>> getHotel() async {
    try {
      final response = await remoteDataSource.getHotel();
      return Right(response);
    } catch (error) {
      return Left(
        AppError(
          appErrorType: AppErrorType.api,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
