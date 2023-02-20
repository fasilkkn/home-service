
import 'package:flutter/material.dart';
import 'package:happy_toys/model/products_model.dart';
import 'package:happy_toys/respositories/recomended_respo.dart';
import '../data/response/api_responses.dart';


class ProductsListViewModel with ChangeNotifier {

  final myRepo = ProductsRespository();

  ApiResponse<ProductsModel> productsListLaundry = ApiResponse.loading();

  // ApiResponse<ProductsModel> productsListIroning = ApiResponse.loading();

  setProductsList(ApiResponse<ProductsModel> response){

    productsListLaundry  =  response;
    notifyListeners();

  }

  // setProductsListIroning(ApiResponse<ProductsModel> response){
  //
  //   productsListIroning  =  response;
  //   notifyListeners();
  //
  // }

  Future<void> fetchProductsListApi(dynamic data) async{

    setProductsList(ApiResponse.loading());

    myRepo.productsApi(data).then((value){

      setProductsList(ApiResponse.completed(value));

    }).onError((error, stackTrace){

      setProductsList(ApiResponse.error(error.toString()));
    });
  }
  // Future<void> fetchProductsListIroningApi(dynamic data) async{
  //
  //   setProductsListIroning(ApiResponse.loading());
  //
  //   myRepo.productsApi(data).then((value){
  //
  //     setProductsListIroning(ApiResponse.completed(value));
  //
  //   }).onError((error, stackTrace){
  //
  //     setProductsListIroning(ApiResponse.error(error.toString()));
  //   });
  // }
}

class IroningViewModel with ChangeNotifier {

  final myRepo = ProductsRespository();

  ApiResponse<ProductsModel> productsListIroning = ApiResponse.loading();

  setProductsListIroning(ApiResponse<ProductsModel> response){

    productsListIroning  =  response;
    notifyListeners();

  }

  Future<void> fetchProductsListIroningApi(dynamic data) async{

    setProductsListIroning(ApiResponse.loading());

    myRepo.productsApi(data).then((value){

      setProductsListIroning(ApiResponse.completed(value));

    }).onError((error, stackTrace){

      setProductsListIroning(ApiResponse.error(error.toString()));
    });
  }
}