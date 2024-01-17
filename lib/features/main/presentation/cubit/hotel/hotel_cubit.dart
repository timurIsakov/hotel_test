import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_test/core/entities/no_params.dart';
import 'package:hotel_test/features/main/domain/entities/hotel_entity.dart';

import '../../../domain/usecases/hotel.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  final GetHotelUseCase getHotelUseCase;
  HotelCubit(this.getHotelUseCase) : super(HotelInitial());

  load() async {
    emit(HotelLoading());
    final response = await getHotelUseCase.call(NoParams());

    response.fold(
      (l) => emit(HotelError(message: l.errorMessage)),
      (r) {
        print("R $r");
        emit(
        HotelLoaded(hotelEntity: r),
      );
      },
    );
  }
}
