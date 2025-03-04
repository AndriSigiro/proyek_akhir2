class Produk {
  final int id;
  final String nama;
  final String deskripsi;
  final double harga;
  final String gambar;

  Produk({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.harga,
    required this.gambar,
  });

  // Konversi JSON ke Model
  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
      id: json['id'],
      nama: json['nama'],
      deskripsi: json['deskripsi'],
      harga: json['harga'].toDouble(),
      gambar: json['gambar'],
    );
  }

  // Konversi Model ke JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'deskripsi': deskripsi,
      'harga': harga,
      'gambar': gambar,
    };
  }
}
