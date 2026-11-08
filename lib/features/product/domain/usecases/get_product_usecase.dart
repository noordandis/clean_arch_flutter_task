import 'package:clean_arch_flutter_task/features/product/domain/repositories/product_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/product.dart';

@lazySingleton
class GetProductUseCase {
  final ProductRepositories repository;

  GetProductUseCase({required this.repository});

  Future<Either<Failure, List<Product>>> call() async {
    return await repository.getAllProduct();
  }
}
