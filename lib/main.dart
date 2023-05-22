import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_api/ui/products/page/products_page.dart';
import 'package:provider_with_api/ui/single_product/page/single_product_page.dart';
import 'package:provider_with_api/view_model/products_view_model.dart';
import 'package:provider_with_api/view_model/single_product_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsViewModel()),
        ChangeNotifierProvider(create: (_) => SinglePraductViewModel())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductsPage(),
      routes: {
        'single_product_page': (context) => SingleProductPage()
      },
    );
  }
}
