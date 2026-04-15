import 'package:flutter/material.dart';
import 'package:marketplace_papua/models/product_model.dart'; 
import 'package:marketplace_papua/widgets/card_catalog.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy sesuai kriteria
    final List<Product> dummyProducts = [
      Product(
        id: "1",
        name: "Noken Motif Papua",
        description:
            "Tas tradisional anyaman tangan asli dari serat kayu pilihan.",
        price: 250000,
        imageUrl: "https://picsum.photos/id/1/200/300",
      ),
      Product(
        id: "2",
        name: "Kopi Arubani",
        description:
            "Kopi arabika asli pegunungan tengah Papua dengan aroma khas.",
        price: 85000,
        imageUrl: "https://picsum.photos/id/2/200/300",
      ),
      Product(
        id: "3",
        name: "Patung Asmat",
        description: "Karya seni ukir kayu legendaris dari suku Asmat.",
        price: 1500000,
        imageUrl: "https://picsum.photos/id/3/200/300",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Papua Marketplace"), // Reusable AppBar [cite: 35]
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Jika lebar layar > 600px (Desktop/Web), pakai 4 kolom. Jika tidak (Mobile), pakai 2 kolom
          int crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;

          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.7,
            ),
            itemCount: dummyProducts.length,
            itemBuilder: (context, index) {
              return CardCatalog(
                product: dummyProducts[index],
              ); // Implementasi Reusable Widget [cite: 62]
            },
          );
        },
      ),
    );
  }
}
