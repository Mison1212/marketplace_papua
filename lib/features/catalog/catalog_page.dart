import 'package:flutter/material.dart';
import '../../models/product_model.dart';
import '../../widgets/card_catalog.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy untuk testing
    List<Product> products = [
      Product(
        id: "1",
        name: "Produk Papua 1",
        description: "Deskripsi produk asli Papua",
        price: 50000,
        imageUrl: "https://via.placeholder.com/150",
      ),
      Product(
        id: "2",
        name: "Produk Papua 2",
        description: "Kualitas terbaik",
        price: 75000,
        imageUrl: "https://via.placeholder.com/150",
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Catalog Marketplace")),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        // Menyesuaikan jumlah kolom (Desktop vs Mobile)
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
          childAspectRatio: 0.7,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) => CardCatalog(product: products[index]),
      ),
    );
  }
}
