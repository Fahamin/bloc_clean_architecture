import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_data_source.dart';
import '../local/database/app_database.dart';
import '../local/entities/product_entity.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final AppDatabase database;

  ProductRepositoryImpl(this.remoteDataSource, this.database);

  @override
  Future<List<Product>> getAllProducts() async {
    try {
      final remoteProducts = await remoteDataSource.getAllProducts();

      // Save into Floor DB
      final dao = database.productDao;
      await dao.deleteAllProducts(); // optional: clear old
      await dao.insertProducts(remoteProducts.map((p) => ProductEntity(
        id: p.id,
        title: p.title,
        price: p.price,
        description: p.description,
        category: p.category,
        image: p.image,
      )).toList());

      return remoteProducts;
    } catch (e) {
      // If API fails, fallback to local database
      final localProducts = await database.productDao.getAllProducts();
      return localProducts.map((e) => Product(
        id: e.id,
        title: e.title,
        price: e.price,
        description: e.description,
        category: e.category,
        image: e.image,
      )).toList();
    }
  }
}
