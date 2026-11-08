import 'package:clean_arch_flutter_task/core/error/failures.dart';
import 'package:clean_arch_flutter_task/features/product/data/datasourses/product_remote_data_source.dart';
import 'package:clean_arch_flutter_task/features/product/domain/entities/product.dart';
import 'package:clean_arch_flutter_task/features/product/domain/repositories/product_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductRepositories)
class ProductRepositoryImpl implements ProductRepositories {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Product>>> getAllProduct() async {
    try {
      final remoteProduct = await remoteDataSource.getAllProduct();

      return Right(remoteProduct.cast<Product>());
    } on DioException catch (e) {
      return left(ServerFailure(message: e.message ?? 'Unknown Error'));
    } catch (e) {
      return left(ServerFailure(message: e.toString() ));
    }
  }
}