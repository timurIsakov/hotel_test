import 'package:get_it/get_it.dart';
import 'package:hotel_test/core/api/api_client.dart';
import 'package:hotel_test/features/main/data/datasource/main_remote_data_source.dart';
import 'package:hotel_test/features/main/data/repository/main_repository_impl.dart';
import 'package:hotel_test/features/main/domain/repository/main_repository.dart';
import 'package:hotel_test/features/main/domain/usecases/hotel.dart';
import 'package:hotel_test/features/main/presentation/cubit/booking/booking_cubit.dart';
import 'package:hotel_test/features/main/presentation/cubit/hotel/hotel_cubit.dart';
import 'package:hotel_test/features/main/presentation/cubit/rooms/rooms_cubit.dart';
import 'package:http/http.dart';

final locator = GetIt.I;

void setup() {
  // ================ BLoC / Cubit ================ //
  locator.registerLazySingleton<HotelCubit>(() => HotelCubit(locator()));
  locator.registerLazySingleton<RoomsCubit>(() => RoomsCubit(locator()));
  locator.registerLazySingleton<BookingCubit>(() => BookingCubit(locator()));
  // ================ UseCases ================ //
  locator
      .registerLazySingleton<GetHotelUseCase>(() => GetHotelUseCase(locator()));
  locator
      .registerLazySingleton<GetRoomsUseCase>(() => GetRoomsUseCase(locator()));
  locator.registerLazySingleton<GetBookingUseCase>(
      () => GetBookingUseCase(locator()));
  // ================ Repository / Datasource ================ //
  locator.registerLazySingleton<MainRemoteDataSource>(
      () => MainRemoteDataSourceImpl(locator()));
  locator.registerLazySingleton<MainRepository>(
      () => MainRepositoryImpl(locator()));
  // ================ Core ================ //
  locator.registerLazySingleton<ApiClient>(() => ApiClient(locator()));
  locator.registerLazySingleton<Client>(() => Client());
}
