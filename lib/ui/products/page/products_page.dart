import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_api/ui/products/widgets/item_product.dart';
import 'package:provider_with_api/view_model/products_view_model.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future getList() async {
      return context.read<ProductsViewModel>().getAllProducts();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Products Page"),
      ),
      body: FutureBuilder(
        initialData: getList(),
        builder: (context, snapshot) {
          return Column(
            children: [
              Consumer<ProductsViewModel>(
                  builder: (context, value, child) {
                if (context.read<ProductsViewModel>().products.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          context.read<ProductsViewModel>().products.length,
                      itemBuilder: (context, index) => Container(
                        height: 200,
                        child: itemCardProduct(
                          context,
                          context.read<ProductsViewModel>().products[index]
                        ),
                      ),
                    ),
                  );
                } else if (context.read<ProductsViewModel>().isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return const Text('data yoq');
                }
              }),
            ],
          );
        },
      ),
    );
  }
}
