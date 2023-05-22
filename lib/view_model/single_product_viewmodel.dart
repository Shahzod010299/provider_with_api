import 'package:flutter/material.dart';
import 'package:provider_with_api/data/models/products_model/product_data.dart';
import 'package:provider_with_api/data/reposiroty/products_repository.dart';

class SinglePraductViewModel extends ChangeNotifier {
  ProductsData? productData;

  Future getSingleProduct(String id) async {
    productData =  await ProductsRepository().getSingleProduct(id);
    notifyListeners();
    return productData;
  }

}