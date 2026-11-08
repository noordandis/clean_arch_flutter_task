part of 'product_cubit.dart';


abstract class ProductState {}

final class ProductInitial extends ProductState {}


class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  ProductLoaded({required this.products});
}

class ProductFailure extends ProductState {
  final String errorMessage;

  ProductFailure({required this.errorMessage});
}
