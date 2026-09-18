import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final orderNumber =
        DateTime.now().millisecondsSinceEpoch % 1000; // Simple queue number

    return Scaffold(
      appBar: AppBar(
        title: Text('Konfirmasi Pesanan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nomor Antrian: $orderNumber',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('Pesanan Anda:', style: TextStyle(fontSize: 18)),
            Expanded(
              child: ListView.builder(
                itemCount: cartProvider.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartProvider.cartItems[index];
                  return ListTile(
                    title: Text(item.menuItem.name),
                    subtitle: Text(
                        'Jumlah: ${item.quantity} x Rp ${item.menuItem.price.toStringAsFixed(0)}'),
                    trailing: Text('Rp ${item.totalPrice.toStringAsFixed(0)}'),
                  );
                },
              ),
            ),
            Divider(),
            Text('Total: Rp ${cartProvider.totalPrice.toStringAsFixed(0)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                cartProvider.clearCart();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                          'Pesanan berhasil! Nomor antrian: $orderNumber')),
                );
              },
              child: Text('Konfirmasi Pesanan'),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50)),
            ),
          ],
        ),
      ),
    );
  }
}
