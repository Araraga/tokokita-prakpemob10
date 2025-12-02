class ApiUrl {
  // Ganti dengan IP lokal Anda dan path ke folder public CodeIgniter
  static const String baseUrl = 'http://192.168.100.39:8080/';

  static const String registrasi = baseUrl + '/registrasi';
  static const String login = baseUrl + '/login';
  static const String listProduk = baseUrl + '/produk';
  static const String createProduk = baseUrl + '/produk';

  // Method untuk URL Update
  static String updateProduk(int id) {
    return baseUrl + '/produk/' + id.toString();
  }

  // Method untuk URL Show/Detail
  static String showProduk(int id) {
    return baseUrl + '/produk/' + id.toString();
  }

  // Method untuk URL Delete
  static String deleteProduk(int id) {
    return baseUrl + '/produk/' + id.toString();
  }
}
