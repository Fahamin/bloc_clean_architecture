import 'package:bloc_life/data/models/product_model.dart';

import '../entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts();

  Future<ProductModel> addProducts(ProductModel product);
}
