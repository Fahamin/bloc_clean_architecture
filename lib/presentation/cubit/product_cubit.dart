import 'package:bloc_life/data/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/usecases/product_data.dart';
import '../../domain/usecases/add_product.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductData getAllProducts;
  final AddProduct addProduct;

  ProductCubit({required this.getAllProducts, required this.addProduct})
    : super(ProductInitial());

  Future<void> fetchProducts() async {
    emit(ProductLoading());
    try {
      final products = await getAllProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError('Failed to fetch products'));
    }
  }

  Future<void> createProduct(ProductModel product) async {
    try {
      emit(ProductLoading());
      final newProduct = await addProduct(product);
      emit(ProductAddSuccess(newProduct));
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }
}