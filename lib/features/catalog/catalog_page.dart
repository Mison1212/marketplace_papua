import 'package:flutter/material.dart';
import '../../models/product_model.dart';
import '../../widgets/card_catalog.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy sesuai kriteria: Image, Nama, Deskripsi, Harga [cite: 23-27]
    final List<Product> products = [
      Product(
        id: "1",
        name: "Noken Papua",
        description: "Tas tradisional khas Papua",
        price: 150000,
        imageUrl: "https://picsum.photos/200",
      ),
      // Tambahkan produk lainnya di sini
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Marketplace Papua",
        ), // Bagian dari Reusable AppBar [cite: 35]
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Responsive Grid: 2 kolom untuk HP, 4 kolom untuk Desktop/Web
          int crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 0.75,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return CardCatalog(
                product: products[index],
              ); // Reusable Card [cite: 32]
            },
          );
        },
      ),
    );
  }
}
