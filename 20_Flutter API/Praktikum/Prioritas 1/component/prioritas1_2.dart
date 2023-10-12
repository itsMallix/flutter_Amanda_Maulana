import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  final response = await http.get(
    Uri.parse(
        "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2"),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print(data);
  }
}
