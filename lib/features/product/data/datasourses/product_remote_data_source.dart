import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/api_endpoint.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProduct();
}

@LazySingleton(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ProductModel>> getAllProduct() async {
    final response = await dio.get(ApiEndpoint.getAllProduct());
    if (response.statusCode == 200) {
      return ProductModel.fromJsonList(response.data);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
