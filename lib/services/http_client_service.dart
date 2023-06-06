import 'dart:convert';
import 'dart:io';

class HttpClientService {
  final HttpClient client;

  HttpClientService(this.client);

  Future<dynamic> get(String url) async {
    final request = await client.getUrl(Uri.parse(url));
    final response = await request.close();

    final buffer = StringBuffer();
    await for (final item in response.transform(utf8.decoder)) {
      buffer.write(item);
    }
    return jsonDecode(buffer.toString());
  }

  Future<dynamic> post(String url, dynamic data) async {
    final request = await client.postUrl(
      Uri.parse(url),
    );
    var value = jsonEncode(data);
    final bytes = utf8.encode(value);

    request.headers.add('accept', 'application/json');
    request.headers.add('Content-Type', 'application/json');
    request.headers.add('Content-Length', '${bytes.length}');

    request.add(bytes);

    final response = await request.close();
    final buffer = StringBuffer();
    await for (final item in response.transform(utf8.decoder)) {
      buffer.write(item);
    }
    return jsonDecode(buffer.toString());
  }

  Future<dynamic> put(String url, dynamic data) async {
    final request = await client.putUrl(
      Uri.parse(url),
    );
    var value = jsonEncode(data);
    final bytes = utf8.encode(value);

    request.headers.add('accept', 'application/json');
    request.headers.add('Content-Type', 'application/json');
    request.headers.add('Content-Length', '${bytes.length}');

    request.add(bytes);

    final response = await request.close();
    final buffer = StringBuffer();
    await for (final item in response.transform(utf8.decoder)) {
      buffer.write(item);
    }
    return jsonDecode(buffer.toString());
  }

  Future<dynamic> delete(String url) async {
    final request = await client.deleteUrl(Uri.parse(url));
    final response = await request.close();

    final buffer = StringBuffer();
    await for (final item in response.transform(utf8.decoder)) {
      buffer.write(item);
    }
    return jsonDecode(buffer.toString());
  }
}
