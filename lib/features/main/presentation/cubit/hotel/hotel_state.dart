part of 'hotel_cubit.dart';

abstract class HotelState {}

class HotelInitial extends HotelState {}

class HotelError extends HotelState {
  final String message;

  HotelError({required this.message});
}

class HotelLoaded extends HotelState {
  final HotelEntity hotelEntity;

  HotelLoaded({required this.hotelEntity});
}

class HotelLoading extends HotelState {}
