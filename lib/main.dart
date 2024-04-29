import 'package:flutter/material.dart';
import 'pesanan_page.dart'; // Import halaman pesanan baru

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Produk Elektronik',
      theme: ThemeData(
  primarySwatch: Colors.indigo,
  hintColor: Color.fromARGB(255, 41, 21, 218),
),

      home: ProdukElektronik(),
    );
  }
}

class ProdukElektronik extends StatefulWidget {
  @override
  _ProdukElektronikState createState() => _ProdukElektronikState();
}

class _ProdukElektronikState extends State<ProdukElektronik>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // Daftar pesanan
  List<String> _pesananItems = [];
  List<int> _pesananPrices = [];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTambahkanButtonPressed(String title, int price) {
    setState(() {
      _pesananItems.add(title);
      _pesananPrices.add(price);
    });
  }

  Widget _buildMenuCard(String title, String imageUrl, int price) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Rp $price',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 218, 15, 0),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton.icon(
                    onPressed: () {
                      _onTambahkanButtonPressed(title, price);
                    },
                    icon: Icon(Icons.add_shopping_cart),
                    label: Text('Tambahkan'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 77, 1, 255),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produk Elektronik'),
      ),
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return FadeTransition(
            opacity: _animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0.0, 0.2),
                end: Offset.zero,
              ).animate(_animation),
              child: child,
            ),
          );
        },
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Produk : ',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 0, 200),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  _buildMenuCard(
                    'Monitor',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-VthlC_fMzfsUb0Z34lLwc4-HUGBXMANAXg&s',
                    2500000,
                  ),
                  _buildMenuCard(
                    'Mikropon',
                    'https://upload.wikimedia.org/wikipedia/commons/0/0c/Shure_mikrofon_55S.jpg',
                    300000,
                  ),
                  
                  _buildMenuCard(
                    'Headset',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6L-6iO0lNUc3LvMtNjqkDkJzvBVMdk4_zvw&s',
                    1000000,
                  ),
                  _buildMenuCard(
                    'TWS',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9VrcvkgiVTSomZgEhgpRMuXoIdj-ElanjSg&s',
                    150000,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PesananPage(items: _pesananItems, prices: _pesananPrices),
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
