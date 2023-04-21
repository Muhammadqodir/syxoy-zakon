import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = "https://abduvoitov.uz/suxoy_zakon/api/";

class Api {
  String? token;
  var client = http.Client();

  Api({this.token});

  Future<http.Response> get(String route) async {
    return await client.get(
      getRoute(route),
      headers: {"token": token ?? "undefined"},
    );
  }

  Future<http.Response> post(String route, Map<String, String> body) async {
    return await client.post(
      getRoute(route),
      body: body,
      headers: {"token": token ?? "undefined"},
    );
  }

  Future<Response<String>> register(String phone) async {
    var response = await post("register.php", {"phone": phone});
    print(response.body);
    if (response.statusCode == 200) {
      try {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data["isSuccess"]) {
          return Response(data: "data");
        } else {
          return Response.failed(message: data["message"]);
        }
      } catch (e) {
        return Response.failed(message: e.toString());
      }
    } else {
      return Response.failed(
        message:
            "Request failed!\nStatus code:${response.statusCode}\n${response.body}",
      );
    }
  }

  Uri getRoute(String route) {
    print(baseUrl + route);
    return Uri.parse(baseUrl + route);
  }
}

class Response<T> {
  bool success;
  String message;
  T? data;

  Response({required this.data, this.message = "", this.success = true});

  Response.failed({required this.message, this.success = false});
}