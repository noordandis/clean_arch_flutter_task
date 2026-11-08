
import 'package:clean_arch_flutter_task/features/product/domain/usecases/get_product_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:injectable/injectable.dart';
import '../../domain/entities/product.dart';
part 'product_state.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  final GetProductUseCase getProductUseCase;

  ProductCubit(this.getProductUseCase) : super(ProductInitial());

  Future<void> fetchProducts() async {
    emit(ProductLoading());
    final result = await getProductUseCase();
    result.fold(
          (failure) => emit(ProductFailure(errorMessage: failure.message)),
          (productsList) => emit(ProductLoaded(products: productsList)),
    );
  }
}