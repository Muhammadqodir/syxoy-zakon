import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:suxoy_zakon/models/cart_item.dart';
import 'package:suxoy_zakon/models/menu_item.dart';
import 'package:suxoy_zakon/models/order.dart';
import 'package:suxoy_zakon/models/profile.dart';
import 'package:suxoy_zakon/models/user.dart';
import 'package:suxoy_zakon/widgets/destination_selector.dart';

const String baseUrl = "https://suxoy-zakon.ru//api/";

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

  Future<Response<String>> sendCode(String phone) async {
    var response = await post("sendCode.php", {"phone": phone});
    print(response.body);
    if (response.statusCode == 200) {
      try {
        Map<String, dynamic> data = jsonDecode(response.body);
        print(data);
        if (data["isSuccess"]) {
          return Response(data: data["code"]);
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

  Future<Response<UserModel>> register(String phone) async {
    var response = await post("register.php", {"phone": phone});
    print(response.body);
    if (response.statusCode == 200) {
      try {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data["isSuccess"]) {
          Map<String, dynamic> userJson = data["data"];
          return Response(
            data: UserModel(
                token: userJson["token"],
                fullName: userJson["fullName"],
                phone: userJson["phone"],
                gender: userJson["gender"],
                birthDay: userJson["birth_day"]),
          );
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

  Future<Response<List<String>>> getCategories() async {
    var response = await get("getCategories.php");
    print(response.body);
    if (response.statusCode == 200) {
      try {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data["isSuccess"]) {
          List<String> res = [];
          for (dynamic item in data["data"]) {
            res.add(item.toString());
          }
          return Response(data: res);
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

  Future<Response<bool>> deleteProfile() async {
    var response = await get("deleteProfile.php?token=$token");
    print(response.body);
    if (response.statusCode == 200) {
      try {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data["isSuccess"]) {
          return Response(data: true);
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

  Future<Response<List<Destination>>> getDeliveryDestinations() async {
    var response = await get("getDestinations.php");
    print(response.body);
    if (response.statusCode == 200) {
      try {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data["isSuccess"]) {
          List<Destination> res = [];
          for (Map<String, dynamic> item in data["data"]) {
            print(item["title"]);
            res.add(
              Destination(
                id: int.parse(item["id"]),
                title: item["destination"],
                price: int.parse(item["price"]),
              ),
            );
          }
          return Response(data: res);
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

  Future<Response<List<MenuItem>>> getAllMenu() async {
    var response = await get("getPositions.php");
    print(response.body);
    if (response.statusCode == 200) {
      try {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data["isSuccess"]) {
          List<MenuItem> res = [];
          for (Map<String, dynamic> item in data["data"]) {
            print(item["title"]);
            res.add(
              MenuItem(
                id: int.parse(item["id"]),
                title: item["title"],
                desc: item["description"],
                imageUrl: item["pic"],
                price: item["price"],
              ),
            );
          }
          return Response(data: res);
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

  Future<Response<List<MenuItem>>> getMenuByCategory(String category) async {
    String requestUrl = "getPositionsByCategory.php?category=$category";
    if (category == "Все") {
      requestUrl = "getPositions.php";
    }
    var response = await get(requestUrl);
    print(response.body);
    if (response.statusCode == 200) {
      try {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data["isSuccess"]) {
          List<MenuItem> res = [];
          for (Map<String, dynamic> item in data["data"]) {
            print(item["title"]);
            res.add(
              MenuItem(
                id: int.parse(item["id"]),
                title: item["title"],
                desc: item["description"],
                imageUrl: item["pic"],
                price: item["price"],
              ),
            );
          }
          return Response(data: res);
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

  Future<Response<Profile>> getMyProfile() async {
    String requestUrl = "getProfile.php?token=$token";
    var response = await get(requestUrl);
    print(response.body);
    if (response.statusCode == 200) {
      try {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data["isSuccess"]) {
          return Response(
            data: Profile(
              phone: data["data"]["phone"],
              birthDay: data["data"]["birth_day"],
              name: data["data"]["fullName"],
              sex: data["data"]["gender"],
            ),
          );
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

  Future<Response<String>> getCallCentre() async {
    String requestUrl = "getCallCentre.php";
    var response = await get(requestUrl);
    print(response.body);
    if (response.statusCode == 200) {
      try {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data["isSuccess"]) {
          return Response(data: data["data"]);
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

  Future<Response<Profile>> saveUser(
      String userName, String birthDay, String sex) async {
    String requestUrl = "saveProfile.php";
    Map<String, String> body = {
      "token": token ?? "undefined",
      "userName": userName,
      "birthDay": birthDay,
      "sex": sex,
    };
    var response = await post(requestUrl, body);
    print(response.body);
    if (response.statusCode == 200) {
      try {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data["isSuccess"]) {
          return Response(
            data: Profile(
              phone: data["data"]["phone"],
              birthDay: data["data"]["birth_day"],
              name: data["data"]["fullName"],
              sex: data["data"]["gender"],
            ),
          );
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

  Future<Response<List<Order>>> getMyOrders() async {
    String requestUrl = "getOrders.php?token=$token";
    var response = await get(requestUrl);
    print(response.body);
    if (response.statusCode == 200) {
      // try {
      Map<String, dynamic> data = jsonDecode(response.body);
      if (data["isSuccess"]) {
        List<Order> res = [];
        for (Map<String, dynamic> order in data["data"]) {
          print(order["status"]);
          List<CartItem> cartItems = [];
          for (Map<String, dynamic> position
              in jsonDecode(order["positions"])) {
            cartItems.add(
              CartItem(
                item: MenuItem(
                  id: position["item"]["id"],
                  title: position["item"]["title"],
                  desc: position["item"]["desc"],
                  price: position["item"]["price"],
                  imageUrl: position["item"]["imageUrl"],
                ),
                count: position["count"],
              ),
            );
          }

          Destination destination =
              Destination(id: -1, title: "undefined", price: 0);

          try {
            destination = Destination(
              id: int.parse(order["destination"]["id"]),
              title: order["destination"]["destination"],
              price: int.parse(order["destination"]["price"]),
            );
          } catch (e) {}

          res.add(
            Order(
              id: int.parse(order["id"]),
              status: order["status"],
              date: order["date"],
              note: order["note"],
              paymentMethod: order["payment_type"],
              delivery: destination,
              price: order["totalPrice"],
              items: cartItems,
            ),
          );
        }
        return Response(data: res);
      } else {
        return Response.failed(message: data["message"]);
      }
      // } catch (e, s) {
      //   print(s);
      //   return Response.failed(message: e.toString());
      // }
    } else {
      return Response.failed(
        message:
            "Request failed!\nStatus code:${response.statusCode}\n${response.body}",
      );
    }
  }

  Future<Response<bool>> newOrder(
    List<CartItem> items,
    Destination destination,
    String totalPrice,
    String paymentMethod,
    String note,
    String address,
    String sdacha,
  ) async {
    Map<String, String> body = {
      "items": jsonEncode(items),
      "destination": destination.id.toString(),
      "totalPrice": totalPrice,
      "paymentMethod": paymentMethod,
      "note": note,
      "address": address,
      "sdacha": sdacha,
      "token": token ?? "undefined",
    };

    var response = await post("newOrder.php", body);
    if (response.statusCode == 200) {
      try {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data["isSuccess"]) {
          return Response(data: true);
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

  Future<Response<List<MenuItem>>> search(String q) async {
    String requestUrl = "search.php?q=$q";
    var response = await get(requestUrl);
    print(response.body);
    if (response.statusCode == 200) {
      try {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data["isSuccess"]) {
          List<MenuItem> res = [];
          for (Map<String, dynamic> item in data["data"]) {
            print(item["title"]);
            res.add(
              MenuItem(
                id: int.parse(item["id"]),
                title: item["title"],
                desc: item["description"],
                imageUrl: item["pic"],
                price: item["price"],
              ),
            );
          }
          return Response(data: res);
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
