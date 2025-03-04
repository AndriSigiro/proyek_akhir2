import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Desa Digital"),
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bagian Berita Desa
              sectionTitle("📰 Berita Desa"),
              beritaDesa(),
              SizedBox(height: 20),

              // Bagian Informasi Desa
              sectionTitle("ℹ️ Informasi Desa"),
              informasiDesa(),
              SizedBox(height: 20),

              // Bagian Produk Desa
              sectionTitle("🛒 Produk Desa"),
              produkDesa(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "Tentang"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Pengaturan"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.blue[800],
        unselectedItemColor: Colors.white70,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  // Widget judul section
  Widget sectionTitle(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue[800]),
      ),
    );
  }

  // Contoh widget untuk berita desa
  Widget beritaDesa() {
    return Column(
      children: [
        beritaItem("assets/festival.jpg", "Festival Desa", "Acara festival desa yang meriah."),
        beritaItem("assets/jalan.jpg", "Pembangunan Jalan", "Pembangunan jalan utama desa telah selesai."),
      ],
    );
  }

  Widget beritaItem(String imagePath, String title, String description) {
    return Card(
      color: Colors.white,
      elevation: 3,
      margin: EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar berita
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            // Keterangan berita
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 4),
                  Text(description,
                      style: TextStyle(color: Colors.grey[700])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget informasi desa
  Widget informasiDesa() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.lightBlue[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        "Desa kami memiliki sejarah panjang dan budaya yang kaya. "
        "Informasi lebih lengkap tentang sejarah, potensi, dan kearifan lokal desa kami dapat ditemukan di sini.",
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  // Widget produk desa
  Widget produkDesa() {
    return Column(
      children: [
        produkItem("assets/madu.jpg", "Madu Asli", "Harga: Rp 50.000", "Desa Asri"),
        produkItem("assets/kopi.jpg", "Kopi Desa", "Harga: Rp 30.000", "Desa Kopi"),
        produkItem("assets/kerajinan.jpg", "Kerajinan Kayu", "Harga: Rp 75.000", "Desa Kreatif"),
      ],
    );
  }

  // Widget item produk dengan navigasi ke detail produk
  Widget produkItem(String imagePath, String title, String price, String desa) {
    return InkWell(
      onTap: () {
        // Navigasi ke halaman detail produk
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              imagePath: imagePath,
              title: title,
              price: price,
              desa: desa,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 3,
        margin: EdgeInsets.only(bottom: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar produk
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              // Keterangan produk dan nama desa
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 4),
                    Text(price,
                        style: TextStyle(
                            color: Colors.green[700],
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text("$desa",
                        style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Halaman detail produk
class ProductDetailPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final String desa;

  const ProductDetailPage({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.desa,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tampilan foto produk
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              // Tampilan detail produk
              Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                price,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.green[700],
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Dari Desa: $desa",
                style: TextStyle(fontSize: 18, color: Colors.grey[800]),
              ),
              SizedBox(height: 24),
              // Tombol Checkout
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi checkout (sesuaikan kebutuhan)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Checkout: $title")),
                    );
                  },
                  style: ElevatedButton.styleFrom(

                    padding: EdgeInsets.symmetric(vertical: 16),
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  child: Text("Checkout"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
