import 'package:dio/dio.dart';
import 'package:provider_with_api/data/models/products_model/product_data.dart';

class ApiService {
  String __BASE_URL = 'https://fakestoreapi.com';

  // Get all products
  Future getAllProducts() async {
    Dio dio =  Dio();
    Response response = await dio.get('${__BASE_URL}/products');

    if(response.statusCode == 200) {
      List products = response.data.map((e) => ProductsData.fromJson(e)).toList();
      return products;
    }
  }

  // Get a single product
  Future getSingleProduct(String id) async {
     Dio dio = Dio();
     Response response = await dio.get('$__BASE_URL/products/$id');

     if(response.statusCode == 200) {
       print(response.data);
       return  ProductsData.fromJson(response.data);
     }
  }


}