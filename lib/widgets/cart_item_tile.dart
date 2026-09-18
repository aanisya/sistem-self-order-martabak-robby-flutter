import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_item.dart';
import '../providers/cart_provider.dart';

class CartItemTile extends StatelessWidget {
  final CartItem cartItem;

  const CartItemTile({required this.cartItem});

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
        title: Text(cartItem.menuItem.name),
        subtitle: Text(
            'Rp ${cartItem.menuItem.price.toStringAsFixed(0)} x ${cartItem.quantity} = Rp ${cartItem.totalPrice.toStringAsFixed(0)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                cartProvider.updateQuantity(
                    cartItem.menuItem.id, cartItem.quantity - 1);
              },
            ),
            Text('${cartItem.quantity}'),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                cartProvider.updateQuantity(
                    cartItem.menuItem.id, cartItem.quantity + 1);
              },
            ),
          ],
        ),
      ),
    );
  }
}
