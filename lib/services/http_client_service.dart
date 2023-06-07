import 'package:uno/uno.dart';

class HttpClientService {
  final Uno uno;

  HttpClientService(this.uno);

  Future<dynamic> get(String url) async {
    final response = await uno.get(url);
    return response.data;
  }

  Future<dynamic> post(String url, dynamic data) async {
    final response = await uno.post(url, data: data);
    return response.data;
  }

  Future<dynamic> put(String url, dynamic data) async {
    final response = await uno.put(url, data: data);
    return response.data;
  }

  Future<dynamic> delete(String url) async {
    final response = await uno.delete(url);
    return response.data;
  }
}
