import 'package:hotel_test/core/api/api_client.dart';
import 'package:hotel_test/features/main/data/models/hotel_model.dart';

import '../../../../core/api/api_constants.dart';

abstract class MainRemoteDataSource {
  Future<HotelModel> getHotel();
}

class MainRemoteDataSourceImpl extends MainRemoteDataSource {
  final ApiClient client;

  MainRemoteDataSourceImpl(this.client);
  @override
  Future<HotelModel> getHotel() async {
    final response = await client.get(ApiConstants.tBaseUrl, {});
    final model = HotelModel.fromJson(json: response);
    return model;
  }
}
