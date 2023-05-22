import 'package:flutter/material.dart';
import 'package:provider_with_api/data/models/products_model/product_data.dart';

Widget itemCardProduct(BuildContext context,ProductsData productsData) {
  return InkWell(
    child: Container(
      height: 300,
      child: Card(
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  productsData.category,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    productsData.image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Rating: ${productsData.rating.rate}'),
                      const Icon(
                        Icons.star_rate,
                        color: Colors.orange,
                      )
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    productsData.description,
                    style: TextStyle(),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text('price: ${productsData.price} \$',style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 18),)
                ],
              ),
            )
          ],
        ),
      ),
    ),
    onTap: () {
      Navigator.pushNamed(context, 'single_product_page',arguments: productsData.id);
    },
  );
}
