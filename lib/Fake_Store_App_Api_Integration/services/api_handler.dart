import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_one/Fake_Store_App_Api_Integration/Models/categories_model.dart';
import 'package:test_one/Fake_Store_App_Api_Integration/Models/product_model.dart';
import 'package:test_one/Fake_Store_App_Api_Integration/Models/users_model.dart';

class APIHandler {
  static Future<List<dynamic>> getData(
      {required String url, String? limit}) async {
    try {
      // final url = Uri.parse("$baseUrl products");
      var response = await http.get(
        Uri.https(
            "https://api.escuelajs.co/api/v1/$url",
            url == "products"
                ? {
                    "offset": "0",
                    "limit": limit,
                  }.toString()
                : {}.toString()),
      );
      // print("Response ${jsonDecode(response.body)}");
      var data = jsonDecode(response.body);
      List tempList = [];
      if (response.statusCode != 200) {
        throw data["message"];
      }
      for (var v in data) {
        tempList.add(v);
      }
      return tempList;
    } catch (error) {
      print("An error occured $error");
      throw error.toString();
    }
  }

  static Future<List<ProductsModel>> getAllProduct(
      {required String limit}) async {
    List temp = await getData(url: "products", limit: limit);
    return ProductsModel.productsFromSnapshot(temp);
  }

  static Future<List<CategoriesModel>> getAllCategories() async {
    // final url = Uri.parse("$baseUrl products");
    // var response =
    //     await http.get(Uri.parse("https://api.escuelajs.co/api/v1/categories"));
    // print("Response ${jsonDecode(response.body)}");
    // var data = jsonDecode(response.body);
    // List tempList = [];
    // for (var v in data) {
    //   tempList.add(v);
    // }
    List temp = await getData(url: "categories");
    return CategoriesModel.categoriesFromSnapshot(temp);
  }

  static Future<List<UsersModel>> getAllUsers() async {
    List temp = await getData(url: "users");
    return UsersModel.usersFromSnapshot(temp);
  }

  static Future<ProductsModel> getProductById({required String id}) async {
    try {
      // final url = Uri.parse("$baseUrl products");
      var response = await http
          .get(Uri.parse("https://api.escuelajs.co/api/v1/products/$id"));
      // print("Response ${jsonDecode(response.body)}");
      var data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw data["message"];
      }
      // List tempList = [];
      // for (var v in data) {
      //   tempList.add(v);
      // }
      return ProductsModel.fromJson(data);
    } catch (error) {
      print("An error occured while getting product info $error");
      throw error.toString();
    }
  }
}
