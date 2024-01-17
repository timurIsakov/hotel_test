part of 'booking_cubit.dart';

abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingError extends BookingState {
  final String message;

  BookingError({required this.message});
}

class BookingLoading extends BookingState {}

class BookingLoaded extends BookingState {
  final BookingEntity bookingEntity;

  BookingLoaded({required this.bookingEntity});
}
