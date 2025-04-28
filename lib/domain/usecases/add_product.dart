import 'package:bloc_life/data/models/product_model.dart';

import '../entities/product.dart';
import '../repositories/product_repository.dart';

class AddProduct {
  final ProductRepository repository;

  AddProduct(this.repository);

  Future<Product> call(ProductModel product) async {
    return await repository.addProducts(product);
  }
}
