import 'package:dio/dio.dart';

void main() async {
  final dio = Dio();

  final request = {
    "id": 1,
    "title": "foo",
    "body": "bar",
    "userId": 1,
  };

  try {
    final response = await dio.put(
      "https://jsonplaceholder.typicode.com/posts/1",
      data: request,
    );

    if (response.statusCode == 200) {
      print("Put request success");
      print(response.data);
    } else {
      print("Put request failed");
    }
  } catch (err) {
    print(err);
  }
}
