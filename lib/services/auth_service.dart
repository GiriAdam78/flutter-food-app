part of 'services.dart';

class AuthService {
  static const String _tokenKey = "access_token";

  /// Fungsi untuk login ke API dan menyimpan token
  static Future<bool> login(String email, String password) async {
    final url = Uri.parse("$baseURL/login");
    try {
      final response = await http.post(
        url,
        body: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String token = data["access_token"];

        // Simpan token ke local storage
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(_tokenKey, token);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  /// Fungsi untuk mengambil token dari local storage
  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  /// Fungsi untuk logout dan menghapus token dari local storage
  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
