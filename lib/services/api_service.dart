import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/berita.dart';

class ApiService {
  final String baseUrl = "http://127.0.0.1:8000/api";

  Future<List<Berita>> fetchBerita() async {
    final response = await http.get(Uri.parse('$baseUrl/berita'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Berita.fromJson(data)).toList();
    } else {
      throw Exception('Gagal mengambil data berita');
    }
  }
}
