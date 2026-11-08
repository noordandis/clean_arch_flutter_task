import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/product.dart';

abstract class ProductRepositories {
  Future<Either<Failure, List<Product>>> getAllProduct();
}
