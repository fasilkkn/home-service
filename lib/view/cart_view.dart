import 'package:flutter/material.dart';
import 'package:happy_toys/view_model/cart_orders_view_model.dart';
import '../data/response/status.dart';
import 'package:provider/provider.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {

  int counter =0;

  CartOrdersViewModel cartOrdersViewModel = CartOrdersViewModel();

  @override
  void initState() {
    Map data = {
      "customer_id": "10001",
      "category" : "Laundry"
    };

    cartOrdersViewModel.fetchProductsListApi(data);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 5,right: 5,bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.currency_rupee,size: 15,),
                Text('1000'),
              ],
            ),
            Container(
              height: 50,
              width: 160,
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(50.0),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(40)),
                  backgroundColor: Colors.yellow.shade900,
                  disabledForegroundColor: Colors
                      .transparent
                      .withOpacity(0.38),
                  disabledBackgroundColor: Colors
                      .transparent
                      .withOpacity(0.12),
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                },
                child: const Center(
                  child: Text(
                    'Proceed to checkout',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xffffffff),
                      letterSpacing:
                      -0.3858822937011719,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )


        ],),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Center(child: Text('Your cart',
              style: TextStyle( fontSize: 20),)),
            ChangeNotifierProvider<CartOrdersViewModel>.value(
              value: cartOrdersViewModel,
              child: Consumer<CartOrdersViewModel>(
                  builder: (context, value, _) {
                    switch (value.cartordersList.status) {
                      case Status.LOADING:
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      case Status.ERROR:
                        return Column(
                          children: [
                            Text(value.cartordersList.message
                                .toString()),
                            TextButton(
                                onPressed: () {
                                  // leaveAppListViewModel.fetchLeaveAppListApi();
                                },
                                child: const Text(
                                  'Retry',
                                  style: TextStyle(fontSize: 20),
                                ))
                          ],
                        );
                      case Status.COMPLETED:
                        return Column(
                          children: [
                            ListView.separated(
                                padding: const EdgeInsets.only(
                                    bottom: 5, top: 5),
                                shrinkWrap: true,
                                physics:
                                const NeverScrollableScrollPhysics(),
                                separatorBuilder:
                                    (BuildContext context, index) {
                                  return const Divider();
                                },
                                itemCount: value.cartordersList
                                    .data!.products!.length,
                                itemBuilder:
                                    (BuildContext context, index) =>
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: Container(
                                        // shadowColor: Colors.grey.shade200,elevation: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 10,right: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 60,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius: BorderRadius.circular(5),
                                                  // boxShadow: [BoxShadow(
                                                  //     color: Colors.grey.shade200,
                                                  //     spreadRadius: 5,
                                                  //     blurRadius: 5
                                                  // )]
                                                ),
                                                child: Image.network(value.cartordersList.data!.products![index].product.toString()),
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(value.cartordersList.data!.products![index].product.toString(),style: const TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15
                                                    ),),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Icon(
                                                          Icons.currency_rupee,
                                                          size: 14,
                                                        ),
                                                        Text(
                                                          value.cartordersList.data!.products![index].price.toString(),
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 15),
                                                        ),
                                                        // Text(
                                                        //   '/pcs',
                                                        //   style:
                                                        //   TextStyle(fontWeight: FontWeight.w300),
                                                        // ),
                                                      ],
                                                    ),


                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(3)
                                                ),
                                                child: Center(
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        // counter1==0?Text(''):
                                                        InkWell(onTap: (){
                                                          setState(() {
                                                            // counts.clear();
                                                            value.cartordersList.data!.products![index].count--;
                                                            counter = value.cartordersList.data!.products![index].count--;
                                                            // counts.removeAt(index);
                                                            // counts.add(value.cartordersList.data!.products![index].count);
                                                            // // counter1--;
                                                            // print(counts);
                                                            // function;
                                                          });
                                                        }, child: Container(
                                                            width: 30,
                                                            decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius: BorderRadius.circular(5),
                                                                boxShadow: [BoxShadow(
                                                                    color: Colors.grey.shade200,
                                                                    spreadRadius: 5,
                                                                    blurRadius: 5
                                                                )]
                                                            ),
                                                            child: const Text('-',textAlign: TextAlign.center,
                                                              style: TextStyle(color: Colors.blue,fontSize: 25),))),
                                                        const SizedBox(width: 10,),
                                                        Center(child:
                                                        Text(value.cartordersList.data!.products![index].count.toString(),
                                                          style: const
                                                          TextStyle(color: Colors.blue,fontSize: 25),)),
                                                        const SizedBox(width: 10,),
                                                        InkWell(onTap: (){
                                                          setState(() {

                                                            value.cartordersList.data!.products![index].count++;
                                                            // counter = value.cartordersList.data!.products![index].count++;
                                                            // print(counts[0].toString());
                                                            // if(counts[index]!=null){
                                                            //   print('ok');
                                                            // }
                                                            // counts[index]==0;
                                                            // counts.removeAt(index);
                                                            // // print({counts[index]});
                                                            // counts.add(value.productsListLaundry.data!.data![index].count);
                                                            // // counter1--;
                                                            // print(counts);

                                                            // counter1++;
                                                          });
                                                        },
                                                            child: Container(
                                                                width: 30,
                                                                decoration: BoxDecoration(
                                                                    color: Colors.white,
                                                                    borderRadius: BorderRadius.circular(5),
                                                                    boxShadow: [BoxShadow(
                                                                        color: Colors.grey.shade200,
                                                                        spreadRadius: 5,
                                                                        blurRadius: 5
                                                                    )]
                                                                ),
                                                                child: const Text('+',textAlign: TextAlign.center,
                                                                  style: TextStyle(color: Colors.blue,fontSize: 25),))),
                                                        const SizedBox(width: 0,),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),],
                                          ),
                                        ),

                                      ),
                                    )
                              // children: List.generate(
                              //     value.productsList.data!.data!.length,
                              //         (index) => AddItem(
                              //       itemName: value.productsList.data!.data![index].product.toString(),
                              //       price:value.productsList.data!.data![index].price.toString(),
                              //       image: value.productsList.data!.data![index].image.toString(),
                              //     )),
                            ),
                            counter>0?
                            Container(
                              height: 50,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(50.0),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(40)),
                                  backgroundColor: Colors.blue,
                                  disabledForegroundColor: Colors
                                      .transparent
                                      .withOpacity(0.38),
                                  disabledBackgroundColor: Colors
                                      .transparent
                                      .withOpacity(0.12),
                                  shadowColor: Colors.transparent,
                                ),
                                onPressed: () {
                                  int index =value.cartordersList.data!.products!.length;
                                  for(int i=0; i<=index-1;i++){
                                    Map data = {
                                      "customer_id": "10001",
                                      "product": value.cartordersList
                                          .data!.products![i].product
                                          .toString(),
                                      "price": value.cartordersList
                                          .data!.products![i].price
                                          .toString(),
                                      "count": value.cartordersList
                                          .data!.products![i].count
                                          .toString(),
                                      "category": "Laundry"
                                    };
                                    // addtocart.addtoCart(data, context);
                                  }

                                  // authviewModel.loginApi(data, context);
                                },
                                child: const Center(
                                  child: Text(
                                    'Add to Cart',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xffffffff),
                                      letterSpacing:
                                      -0.3858822937011719,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ):Text(''),
                            const SizedBox(
                              height: 60,
                            )
                          ],
                        );
                    }
                    return Container();
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
