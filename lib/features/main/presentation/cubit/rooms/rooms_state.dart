part of 'rooms_cubit.dart';

abstract class RoomsState {}

class RoomsInitial extends RoomsState {}

class RoomsError extends RoomsState {
  final String message;

  RoomsError({required this.message});
}

class RoomsLoaded extends RoomsState {
  final NumberEntity numberEntity;

  RoomsLoaded({required this.numberEntity});
}

class RoomsLoading extends RoomsState {}
