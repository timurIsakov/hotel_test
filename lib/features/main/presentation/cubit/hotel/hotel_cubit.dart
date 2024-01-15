import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_test/core/entities/no_params.dart';
import 'package:hotel_test/features/main/domain/entities/hotel_entity.dart';

import '../../../domain/usecases/hotel_usecase.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  final GetHotelUseCase getHotelUseCase;
  HotelCubit(this.getHotelUseCase) : super(HotelInitial());

  getHotel() async {
    final response = await getHotelUseCase.call(NoParams());

    response.fold((l) => emit(HotelError(message: l.errorMessage)),
        (response) => emit(HotelLoaded(hotelEntity: response)));
  }
}
