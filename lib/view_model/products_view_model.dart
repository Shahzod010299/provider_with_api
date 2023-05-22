import 'package:flutter/cupertino.dart';
import 'package:provider_with_api/data/reposiroty/products_repository.dart';

class ProductsViewModel extends ChangeNotifier {
  List products = [];
  bool isLoading = false;

  void getAllProducts() async {
    changeLoadingState();
    products = await ProductsRepository().getAllProducts();
    changeLoadingState();
    notifyListeners();
  }

  void changeLoadingState() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
