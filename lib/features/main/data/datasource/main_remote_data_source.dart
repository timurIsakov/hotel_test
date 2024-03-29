import 'package:hotel_test/core/api/api_client.dart';
import 'package:hotel_test/features/main/data/models/hotel_model.dart';
import 'package:hotel_test/features/main/data/models/number_model.dart';

import '../../../../core/api/api_constants.dart';
import '../models/booking_model.dart';

abstract class MainRemoteDataSource {
  Future<HotelModel> getHotel();
  Future<NumberModel> getRooms();
  Future<BookingModel> getBooking();
}

class MainRemoteDataSourceImpl extends MainRemoteDataSource {
  final ApiClient client;

  MainRemoteDataSourceImpl(this.client);

  @override
  Future<HotelModel> getHotel() async {
    final response = await client.get(ApiConstants.hotel);
    final model = HotelModel.fromJson(json: response);

    return model;
  }

  @override
  Future<NumberModel> getRooms() async {
    final response = await client.get(ApiConstants.rooms);
    final model = NumberModel.fromJson(response);

    return model;
  }

  @override
  Future<BookingModel> getBooking() async {
    final response = await client.get(ApiConstants.booking);
    final model = BookingModel.fromJson(json: response);

    return model;
  }
}
