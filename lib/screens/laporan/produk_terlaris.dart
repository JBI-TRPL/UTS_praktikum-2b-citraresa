import 'package:flutter/material.dart';

class TopProduct {
  final String namaProduk;
  final int totalProduk;

const TopProduct({required this.namaProduk, required this.totalProduk});
}

final List<TopProduct> dataAsliTopProducts = [
  const TopProduct(namaProduk: 'Kopi Luwak white coffe', totalProduk: 350),
  const TopProduct(namaProduk: 'Teh HSariwangi', totalProduk: 210),
  const TopProduct(namaProduk: 'Roti Gandum Utuh', totalProduk: 323),
  const TopProduct(namaProduk: 'Air Mineral 1 Liter', totalProduk: 300),
  const TopProduct(namaProduk: 'Beras Ratu', totalProduk: 105),
];

class TopFiveProducts extends StatelessWidget {
  final List<TopProduct> topProducts;

const TopFiveProducts ({super.key, required this.topProducts});

@override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Sudut lebih lembut
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Produk 5 erlaris',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 12),
            // menampilkan daftar 5 produk
             ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: topProducts.length,
                itemBuilder: (context, index) {
                  final product = topProducts[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        _buildRankBadge(index),
                        const SizedBox(width: 15),
                    // Nama Produk
                        Expanded(
                          child: Text(
                            product.namaProduk,
                            style: const TextStyle(fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        // Jumlah Terjual (totalProduk)
                        Text(
                          '${product.totalProduk}x',
                          style: TextStyle( 
                              fontSize: 16, 
                              fontWeight: FontWeight.bold, 
                              color: index == 0 ? Colors.deepOrange : Colors.green),
                        ), 
                      ],
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
  // Widget helper untuk Badge Rank
  Widget _buildRankBadge(int index) {
    const Color badgeColor = Colors.blueGrey;
    const Color textColor = Colors.white;

    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 188, 228, 248),
        shape: BoxShape.circle,
      ),
      child: Text(
        '${index + 1}',
        style: const TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  
  }


