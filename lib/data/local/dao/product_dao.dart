import 'package:floor/floor.dart';
import '../entities/product_entity.dart';

@dao
abstract class ProductDao {
  @Query('SELECT * FROM products')
  Future<List<ProductEntity>> getAllProducts();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertProducts(List<ProductEntity> products);

  @Query('DELETE FROM products')
  Future<void> deleteAllProducts();
}
