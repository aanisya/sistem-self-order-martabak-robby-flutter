import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';
import '../models/menu_item.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  double get totalPrice {
    return _cartItems.fold(0, (sum, item) => sum + item.totalPrice);
  }

  void addToCart(MenuItem menuItem) {
    final existingItem = _cartItems.firstWhere(
      (item) => item.menuItem.id == menuItem.id,
      orElse: () => CartItem(menuItem: menuItem, quantity: 0),
    );

    if (existingItem.quantity == 0) {
      _cartItems.add(CartItem(menuItem: menuItem));
    } else {
      existingItem.quantity++;
    }
    notifyListeners();
  }

  void removeFromCart(String itemId) {
    _cartItems.removeWhere((item) => item.menuItem.id == itemId);
    notifyListeners();
  }

  void updateQuantity(String itemId, int quantity) {
    final item = _cartItems.firstWhere((item) => item.menuItem.id == itemId);
    if (quantity <= 0) {
      removeFromCart(itemId);
    } else {
      item.quantity = quantity;
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
