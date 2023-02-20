

import 'package:flutter/material.dart';
import 'package:happy_toys/model/card_orders_model.dart';
import 'package:happy_toys/model/products_model.dart';
import 'package:happy_toys/respositories/cart_orders_respo.dart';
import 'package:happy_toys/respositories/recomended_respo.dart';

import '../data/response/api_responses.dart';

class CartOrdersViewModel with ChangeNotifier {

  final myRepo = CartOrdersRespository();

  ApiResponse<CartOrdersModel> cartordersList = ApiResponse.loading();

  // ApiResponse<ProductsModel> productsListIroning = ApiResponse.loading();

  setProductsList(ApiResponse<CartOrdersModel> response) {
    cartordersList = response;
    notifyListeners();
  }


  Future<void> fetchProductsListApi(dynamic data) async {
    setProductsList(ApiResponse.loading());

    myRepo.cartOrdersApi(data).then((value) {
      setProductsList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setProductsList(ApiResponse.error(error.toString()));
    });
  }
}
