import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/menu_item.dart';
import '../providers/cart_provider.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem item;

  const MenuItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Container(
          width: 60,
          height: 60,
          color: Colors.grey[300],
          child: Icon(Icons.image, size: 30),
        ),
        title: Text(item.name),
        subtitle: Text(
          '${item.description}\nRp ${item.price.toStringAsFixed(0)}',
        ),
        trailing: ElevatedButton(
          onPressed: () {
            cartProvider.addToCart(item);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${item.name} ditambahkan ke keranjang')),
            );
          },
          child: Text('Tambah'),
        ),
      ),
    );
  }
}
