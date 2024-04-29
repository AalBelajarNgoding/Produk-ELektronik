import 'package:flutter/material.dart';

class PesananPage extends StatefulWidget {
  final List<String> items;
  final List<int> prices;

  PesananPage({required this.items, required this.prices});

  @override
  _PesananPageState createState() => _PesananPageState();
}

class _PesananPageState extends State<PesananPage> {
  List<int> _jumlahPesanan = [];

  @override
  void initState() {
    super.initState();
    _jumlahPesanan = List<int>.filled(widget.items.length, 1);
  }

  int getTotalHarga() {
    int total = 0;
    for (int i = 0; i < widget.items.length; i++) {
      total += widget.prices[i] * _jumlahPesanan[i];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pesanan'),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.items[index]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (_jumlahPesanan[index] > 0) {
                        _jumlahPesanan[index]--;
                      }
                    });
                  },
                ),
                Text('${_jumlahPesanan[index]}'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _jumlahPesanan[index]++;
                    });
                  },
                ),
              ],
            ),
            subtitle: Text('Rp ${widget.prices[index] * _jumlahPesanan[index]}'),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total: Rp ${getTotalHarga()}'),
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika untuk menampilkan notifikasi pembelian selesai
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Pembelian telah selesai.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Text('Pesan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
