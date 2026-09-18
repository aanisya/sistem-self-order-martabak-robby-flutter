import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/cart_item_tile.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
      ),
      body: cartProvider.cartItems.isEmpty
          ? Center(child: Text('Keranjang kosong'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.cartItems.length,
                    itemBuilder: (context, index) =>
                        CartItemTile(cartItem: cartProvider.cartItems[index]),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                          'Total: Rp ${cartProvider.totalPrice.toStringAsFixed(0)}'),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to order confirmation
                          Navigator.pushNamed(context, '/order');
                        },
                        child: Text('Pesan Sekarang'),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
