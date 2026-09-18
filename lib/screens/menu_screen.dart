import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/menu_item.dart';
import '../widgets/menu_item_card.dart';
import '../providers/cart_provider.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Martabak Robby'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
              ),
              if (cartProvider.cartItems.isNotEmpty)
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '${cartProvider.cartItems.length}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          // Kategori Martabak Manis
          Padding(
            padding: EdgeInsets.all(16),
            child: Text('Martabak Manis',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          ...MenuItem.sampleItems
              .where((item) => item.category == 'Martabak Manis')
              .map((item) => MenuItemCard(item: item)),

          // Kategori Martabak Telur
          Padding(
            padding: EdgeInsets.all(16),
            child: Text('Martabak Telur',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          ...MenuItem.sampleItems
              .where((item) => item.category == 'Martabak Telur')
              .map((item) => MenuItemCard(item: item)),
        ],
      ),
    );
  }
}
