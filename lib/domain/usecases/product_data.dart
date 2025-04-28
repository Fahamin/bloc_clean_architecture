import 'package:bloc_life/data/models/product_model.dart';

import '../entities/product.dart';
import '../repositories/product_repository.dart';

class ProductData {
  final ProductRepository repository;

  ProductData(this.repository);

  Future<List<Product>> call() async {
    return await repository.getAllProducts();
  }


  
}
