import 'package:provider_with_api/data/models/products_model/product_data.dart';
import 'package:provider_with_api/service/api_service/api_service.dart';

class ProductsRepository {
  Future<List> getAllProducts()  async => await ApiService().getAllProducts();
  Future<ProductsData> getSingleProduct(String id) async => await ApiService().getSingleProduct(id);
}