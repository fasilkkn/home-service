
import 'package:happy_toys/model/products_model.dart';
import '../data/network/baseApiServices.dart';
import '../data/network/networkApiServices.dart';
import '../resources/app_urls.dart';

class ProductsRespository {

  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> productsApi(dynamic data) async {

    try {

      dynamic response =
      await _apiServices.getPostApiResponse(AppUrls.products, data);

      return response = ProductsModel.fromJson(response);

    } catch (e) {
      throw e;
    }
  }
}