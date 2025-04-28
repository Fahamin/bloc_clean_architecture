import '../models/product_model.dart';
import 'package:dio/dio.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();

  Future<ProductModel> addProduct(ProductModel product);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSourceImpl(this.dio);

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await dio.get('products');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((item) => ProductModel.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } on DioException catch (e) {
      throw Exception('API Error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }

  @override
  Future<ProductModel> addProduct(ProductModel product) async {
    final response = await dio.post(
      'products',
      data: product.toJson(),
    );
    return ProductModel.fromJson(response.data);
  }

}
