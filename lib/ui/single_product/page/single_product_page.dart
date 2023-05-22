import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_api/data/models/products_model/product_data.dart';
import 'package:provider_with_api/view_model/single_product_viewmodel.dart';

class SingleProductPage extends StatefulWidget {
  const SingleProductPage({Key? key}) : super(key: key);

  @override
  State<SingleProductPage> createState() => _SingleProductPageState();
}

class _SingleProductPageState extends State<SingleProductPage> {
  @override
  Widget build(BuildContext context) {
    int id = ModalRoute.of(context)!.settings.arguments as int;

    Future getList() async {
      var singleProduct =
          context.read<SinglePraductViewModel>().getSingleProduct('$id');
      return singleProduct;
    }
    String code = """
// Importing core libraries
#include <iostream>
using namespace std;

int main() {

  int i, n;
  bool is_prime = true;

  cout << "Enter a positive integer: ";
  cin >> n;

  // 0 and 1 are not prime numbers
  if (n == 0 || n == 1) {
    is_prime = false;
  }

  // loop to check if n is prime
  for (i = 2; i <= n/2; ++i) {
    if (n % i == 0) {
      is_prime = false;
      break;
    }
  }

  if (is_prime)
    cout << n << " is a prime number";
  else
    cout << n << " is not a prime number";

  return 0;
}

""";
    return FutureBuilder(
      initialData: getList(),
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Single page $id'),
          ),
          body: Consumer<SinglePraductViewModel>(
              builder: (context, value, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Card(child: Text(value.productData!.title),),
                ],
              ),
            );
          }),
        );
      },
    );


  }

}
