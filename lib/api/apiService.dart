import 'dart:convert';

import 'package:flutter_demo/api/api_constant.dart';
import 'package:flutter_demo/model/foodDetail.dart';
import 'package:flutter_demo/model/login/LoginResponse.dart';
import '../model/foodCategories.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

class ApiService {
  final timeout = 10;

  Future<LoginResponse?> loginApi(String email, String password) async {
    try {
      var url = Uri.parse(ApiConstant.baseUrl1 + ApiConstant.loginEndpoint);
      final headers = {'Content-Type': 'application/json; charset=utf-8'};
      String jsonBody = json.encode({
        "email": email, "password": password
      });

      var response = await http
          .post(url, headers: headers, body: jsonBody)
          .timeout(Duration(seconds: timeout));
      log("Api response code : ${response.statusCode}");
      if (response.statusCode == 200) {
        log("Api Login Successful ${response.body.toString()}");
        LoginResponse loginResponse = loginResponseFromJson(response.body);
        return Future.value(loginResponse);
      } else {
        /*var jsonObj = json.decode(response.toString());
        log("Api response error : ${jsonObj.toString()}");*/
        LoginResponse loginResponse = loginResponseFromJson(response.body);
        return Future.value(loginResponse);
      }
    } catch (e) {
      log("Api Error ${e.toString()}");
    }
    return null;
  }

  Future<List<Category>?> getFoodCategories() async {
    try {
      var url =
          Uri.parse(ApiConstant.baseUrl + ApiConstant.foodCategoriesEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Foodcategories foodCategoriesList =
            foodcategoriesFromJson(response.body);
        log("Api response: $foodCategoriesList.categories");
        return Future.value(foodCategoriesList.categories);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Fooddetail?> getFoodDetails(String foodID) async {
    try {
      Map<String, String> params = {
        'i': foodID,
      };
      log("Detail screen data url before");
      var url = Uri.parse(
          "${ApiConstant.baseUrl}${ApiConstant.foodDetailsEndpoint}?i=$foodID");
      log("Detail screen data url : $url");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Fooddetail foodDetail = fooddetailFromJson(response.body);
        log("Api response: ${foodDetail.meals.length}");
        return Future.value(foodDetail);
      } else {
        log("Api code: ${response.statusCode}");
      }
    } catch (e) {
      log("Api Error: ${e.toString()}");
    }
    return null;
  }
}
