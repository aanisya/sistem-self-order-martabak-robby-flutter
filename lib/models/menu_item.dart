class MenuItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final String imageUrl;

  MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
  });

  // Sample data
  static List<MenuItem> sampleItems = [
    MenuItem(
      id: '1',
      name: 'Martabak Manis Coklat',
      description: 'Martabak manis dengan topping coklat dan kacang',
      price: 25000,
      category: 'Martabak Manis',
      imageUrl: 'assets/images/martabak_manis.jpg',
    ),
    MenuItem(
      id: '2',
      name: 'Martabak Manis Keju',
      description: 'Martabak manis dengan topping keju',
      price: 30000,
      category: 'Martabak Manis',
      imageUrl: 'assets/images/martabak_manis.jpg',
    ),
    MenuItem(
      id: '3',
      name: 'Martabak Telur Ayam',
      description: 'Martabak telur dengan isian ayam',
      price: 35000,
      category: 'Martabak Telur',
      imageUrl: 'assets/images/martabak_telur.jpg',
    ),
    MenuItem(
      id: '4',
      name: 'Martabak Telur Sapi',
      description: 'Martabak telur dengan isian daging sapi',
      price: 40000,
      category: 'Martabak Telur',
      imageUrl: 'assets/images/martabak_telur.jpg',
    ),
  ];
}
