
import 'package:happy_toys/model/card_orders_model.dart';
import 'package:happy_toys/model/products_model.dart';
import '../data/network/baseApiServices.dart';
import '../data/network/networkApiServices.dart';
import '../model/add_to_cart_model.dart';
import '../resources/app_urls.dart';

class CartOrdersRespository {

  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> cartOrdersApi(dynamic data) async {

    try {

      dynamic response =
      await _apiServices.getPostApiResponse(AppUrls.cartorders, data);

      return response = CartOrdersModel.fromJson(response);

    } catch (e) {
      throw e;
    }
  }
}