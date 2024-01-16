import 'package:hotel_test/features/main/domain/entities/number_entity.dart';

class NumberModel extends NumberEntity {
  const NumberModel(
      {required super.id,
      required super.name,
      required super.price,
      required super.pricePer,
      required super.features,
      required super.imageUrls});

  // factory NumberModel.fromJson({required Map<String,dynamic> json}){
  //   return NumberModel(
  //       id:
  //       name: name,
  //       price: price,
  //       pricePer: pricePer,
  //       features: features,
  //       imageUrls: imageUrls)
  // }
}
