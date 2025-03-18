import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import FontAwesome

class ProductDetailPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final String location;


  const ProductDetailPage({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.location,

  }) : super(key: key);

  // Fungsi untuk membuka WhatsApp
  Future<void> launchWhatsApp(String phoneNumber) async {
    // Format nomor telepon (hilangkan karakter selain angka)
    String formattedPhoneNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

    // Buat URL WhatsApp
    String url = "https://wa.me/$formattedPhoneNumber?text=Halo, saya ingin membeli produk $title";

    // Coba buka URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Tidak dapat membuka WhatsApp';
    }
  }

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
                child: Image.network(
                  imagePath,
                  width: double.infinity,
                  height: 400,
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
                "Lokasi: $location",
                style: TextStyle(fontSize: 18, color: Colors.grey[800]),
              ),
              SizedBox(height: 24),
              // Tombol Checkout dengan ikon WhatsApp
              Container(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Nomor WhatsApp yang ditentukan
                    String phoneNumber = "+6282161623709"; // Ganti dengan nomor WhatsApp Anda

                    // Buka WhatsApp
                    launchWhatsApp(phoneNumber).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Gagal membuka WhatsApp: $error")),
                      );
                    });
                  },
                  icon: FaIcon(FontAwesomeIcons.whatsapp), // Ikon WhatsApp
                  label: Text("Checkout"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}