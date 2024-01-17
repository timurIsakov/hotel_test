import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_test/core/entities/no_params.dart';
import 'package:hotel_test/features/main/domain/entities/number_entity.dart';
import '../../../domain/usecases/hotel.dart';

part 'rooms_state.dart';

class RoomsCubit extends Cubit<RoomsState> {
  final GetRoomsUseCase getRoomsUseCase;
  RoomsCubit(this.getRoomsUseCase) : super(RoomsInitial());

  load() async {
    emit(RoomsLoading());
    final response = await getRoomsUseCase.call(NoParams());
    response.fold((l) => emit(RoomsError(message: l.errorMessage)),
        (r) => emit(RoomsLoaded(numberEntity: r)));
  }
}
