import 'package:decore/model/product_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/product_detail_model.dart';

class StoreData {
  static StoreData shared = StoreData();
  late SharedPreferences sharedPreferences;

  void getInstance() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  setToken(String token) async {
    await sharedPreferences.setString("token", token);
  }

  String? getToken() {
    return sharedPreferences.getString('token');
  }
}

class API {
  static API shared = API();
  late Dio dio;
  late Map<String, String> headers;

  API() {
    headers = {
      "Content-Type": "application/json",
    };

    dio = Dio();
    dio.options.baseUrl = 'http://ec2-15-206-160-84.ap-south-1.compute.amazonaws.com/api';
    dio.options.headers = headers;
    dio.options.validateStatus = (statusCode) {
      if (statusCode == 200) {
        return true;
      } else if (statusCode != 500) {
        return true;
      } else {
        return false;
      }
    };
  }

  void updateToken() {
    String? token = StoreData.shared.getToken();
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
      dio.options.headers = headers;
    }
  }

  Future<Result<Map<String, dynamic>>> login(String mobileNumber) async {
    var params = {
      "mobile_no": mobileNumber,
    };
    Response<Map<String, dynamic>> response = await dio.post('/login', data: params);
    if (response.statusCode == 200) {
      //success
      var result = response.data;
      debugPrint('Login Response ==>$result');

      if (result != null) {
        return Result(isSuccess: true, data: result);
      } else {
        return Result(isSuccess: false, data: {});
      }
    } else if (response.statusCode == 401) {
      //error
      var result = response.data;
      debugPrint('Login Response 401 ==>$result');
      if (result != null) {
        return Result(isSuccess: false, data: result);
      } else {
        return Result(isSuccess: false, data: {});
      }
    } else {
      return Result(isSuccess: false, data: {});
    }
  }

  Future<Result<Map<String, dynamic>>> otpVerify(String mobileNumber, String otp) async {
    var params = {
      "mobile_no": mobileNumber,
      "otp": otp,
    };

    Response<Map<String, dynamic>> response = await dio.post('/verifyotp', data: params);

    if (response.statusCode == 200) {
      var result = response.data;
      debugPrint('Login Response ------------->>$result');

      if (result != null) {
        return Result(isSuccess: true, data: result);
      } else {
        return Result(isSuccess: false, data: {});
      }
    } else if (response.statusCode == 401) {
      //error
      var result = response.data;
      debugPrint('Login Response 401 ==>$result');
      if (result != null) {
        return Result(isSuccess: false, data: result);
      } else {
        return Result(isSuccess: false, data: {});
      }
    } else {
      return Result(isSuccess: false, data: {});
    }
  }

  Future<Result<List<Product>>> productData() async {
    Response response = await dio.post('/get-products');

    // eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9lYzItMTUtMjA2LTE2MC04NC5hcC1zb3V0aC0xLmNvbXB1dGUuYW1hem9uYXdzLmNvbVwvYXBpXC92ZXJpZnlvdHAiLCJpYXQiOjE2ODA3ODEzMTksImV4cCI6MTY4MDc4NDkxOSwibmJmIjoxNjgwNzgxMzE5LCJqdGkiOiJqUkk1QzRNRVpXZ0dUd3ZDIiwic3ViIjozLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.RItyUFiQpNWVREMjPTRq7PSdnvT05z0JN8ZRGofvCSI

    if (response.statusCode == 200) {
      var result = response.data;
      debugPrint('productData Response ------------->>$result');

      if (result != null) {
        bool status = result['status'] as bool;

        debugPrint('productData  status Response ------------->>$status');

        if (status) {
          var data = List<Map<String, dynamic>>.from(result['data']);
          debugPrint('before convert List data ------------->>$data');

          var list = data.map((e) => Product.fromJson(e)).toList();

          debugPrint('after convert List data ------------->>$list');

          return Result(isSuccess: true, data: list);
        } else {
          return Result(isSuccess: false, data: []);
        }
      } else {
        return Result(isSuccess: false, data: []);
      }
    } else if (response.statusCode == 401) {
      //error
      var result = Map<String, dynamic>.from(response.data);
      if (result.keys.contains('status')) {
        return Result(isSuccess: false, data: [], message: result['status'].toString());
      } else {
        return Result(isSuccess: false, data: [], message: 'Something went wrong');
      }
    } else {
      return Result(isSuccess: false, data: [], message: 'Something went wrong');
    }
  }

  Future<Result<List<ProductDetail>>> getProductDetail(int id) async {
    var params = {
      "id": id,
    };
    Response response = await dio.post('/get-product-detail', data: params);

    debugPrint("response--------->>$response");

    if (response.statusCode == 200) {
      var result = response.data;

      if (result != null) {
        bool status = result['status'] as bool;
        debugPrint('productDetail  status Response ------------->>$status');

        if (status) {
          var data = List<Map<String, dynamic>>.from(result['data']);
          debugPrint('before convert List data ------------->>$data');

          var list = data.map((e) => ProductDetail.fromJson(e)).toList();

          debugPrint('after convert List data ------------->>$list');

          return Result(isSuccess: true, data: list);
        } else {
          return Result(isSuccess: false, data: []);
        }
      } else {
        return Result(isSuccess: false, data: []);
      }
    } else if (response.statusCode == 401) {
      //error
      var result = Map<String, dynamic>.from(response.data);
      if (result.keys.contains('status')) {
        return Result(isSuccess: false, data: [], message: result['status'].toString());
      } else {
        return Result(isSuccess: false, data: [], message: 'Something went wrong');
      }
    } else {
      return Result(isSuccess: false, data: [], message: 'Something went wrong');
    }
  }

  Future<Result<Map<String, dynamic>>> createOrder(Product product, ProductDetail productDetail, String meter) async {
    var params = {
      "product_id": [product.id],
      "serial_number": [productDetail.serialNumber],
      "meter": [meter],
    };

    Response response = await dio.post('/create-order', data: params);

    debugPrint("createOrder response--------->>$response");

    if (response.statusCode == 200) {
      var result = response.data;
      debugPrint('createOrder Response ------------->>$result');

      if (result != null) {
        return Result(isSuccess: true, data: result);
      } else {
        return Result(isSuccess: false, data: {});
      }
    } else if (response.statusCode == 401) {
      //error
      var result = response.data;
      debugPrint('Login Response 401 ==>$result');
      if (result != null) {
        return Result(isSuccess: false, data: result);
      } else {
        return Result(isSuccess: false, data: {});
      }
    } else {
      return Result(isSuccess: false, data: {});
    }
  }
}

class Result<T> {
  bool isSuccess;
  String? message;
  T data;
  Result({required this.isSuccess, required this.data, this.message});
}
