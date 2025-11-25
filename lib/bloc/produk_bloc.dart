import 'dart:convert';
import 'package:http/http.dart' as http; // Import langsung library http
import 'package:tokokita/model/produk.dart';

class ProdukBloc {
  // Tentukan Base URL langsung di sini
  // Gunakan 10.0.2.2 untuk Emulator Android, atau IP LAN (misal 192.168.x.x) untuk HP fisik
  static const String baseUrl = 'http://10.0.2.2/tokokita/public';

  // 1. GET Produk
  static Future<List<Produk>> getProduks() async {
    String apiUrl = '$baseUrl/produk';

    // Panggil http langsung
    var response = await http.get(Uri.parse(apiUrl));

    // Parsing JSON
    var jsonObj = json.decode(response.body);
    List<dynamic> listProduk = (jsonObj as Map<String, dynamic>)['data'];

    List<Produk> produks = [];
    for (int i = 0; i < listProduk.length; i++) {
      produks.add(Produk.fromJson(listProduk[i]));
    }
    return produks;
  }

  // 2. CREATE Produk
  static Future addProduk({Produk? produk}) async {
    String apiUrl = '$baseUrl/produk';

    var body = {
      "kode_produk": produk!.kodeProduk,
      "nama_produk": produk.namaProduk,
      "harga": produk.hargaProduk.toString(),
    };

    var response = await http.post(Uri.parse(apiUrl), body: body);
    var jsonObj = json.decode(response.body);
    return jsonObj['status'];
  }

  // 3. UPDATE Produk
  static Future updateProduk({required Produk produk}) async {
    String apiUrl = '$baseUrl/produk/${produk.id}/update';

    var body = {
      "kode_produk": produk.kodeProduk,
      "nama_produk": produk.namaProduk,
      "harga": produk.hargaProduk.toString(),
    };

    var response = await http.put(Uri.parse(apiUrl), body: body);
    var jsonObj = json.decode(response.body);
    return jsonObj['status'];
  }

  // 4. DELETE Produk
  static Future<bool> deleteProduk({int? id}) async {
    String apiUrl = '$baseUrl/produk/$id/delete';

    var response = await http.delete(Uri.parse(apiUrl));
    var jsonObj = json.decode(response.body);

    // Asumsi respon backend: { "code": 200, "status": true, ... }
    return (jsonObj as Map<String, dynamic>)['code'] == 200;
  }
}
