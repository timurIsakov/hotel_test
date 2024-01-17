import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_test/features/main/domain/entities/booking_entity.dart';

import '../../../../../core/entities/no_params.dart';
import '../../../domain/usecases/hotel.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final GetBookingUseCase getBookingUseCase;
  BookingCubit(this.getBookingUseCase) : super(BookingInitial());

  load() async {
    emit(BookingLoading());
    final response = await getBookingUseCase.call(NoParams());

    response.fold(
      (l) => emit(BookingError(message: l.errorMessage)),
      (r) {
        emit(
          BookingLoaded(bookingEntity: r),
        );
      },
    );
  }
}
