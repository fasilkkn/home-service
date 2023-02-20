import 'dart:math';
import 'package:flutter/material.dart';
import 'package:happy_toys/data/response/status.dart';
import 'package:happy_toys/utils/routes/routes_name.dart';
import 'package:happy_toys/view/product_details_page.dart';
import 'package:happy_toys/view/services/add_items.dart';
import 'package:happy_toys/view_model/productslist_view_model.dart';
import 'package:provider/provider.dart';
import '../model/products_model.dart';
import '../view_model/auth_view_model.dart';
import '../view_model/cart_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();

}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {

  ProductsListViewModel productsListViewModel = ProductsListViewModel();
  IroningViewModel ironingViewModel = IroningViewModel();




  int counter = 0;
  int counter1 = 0;
  String? products = 'laundry';
  List<int> counts =[0];



  @override
  void initState() {

    Map data = {"product_type": "Laundry"};
    productsListViewModel.fetchProductsListApi(data);

    Map data1 = {"product_type": "Ironing"};
    ironingViewModel.fetchProductsListIroningApi(data1);

    super.initState();
  }

  bool isBack  = true;
  double angle = 0 ;

  void _flip(){
    setState(() {
      angle = (angle + pi) % (2 * pi);
    });
  }

  @override
  Widget build(BuildContext context) {

    final addToCart = Provider.of<CartViewModel>(context);


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          leading:  Padding(
            padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2RquzAbcQRt-0YFfQnlycX8I61ufOPccCIg&usqp=CAU'
                  ),
                  radius: 20,
                ),
                const SizedBox(width: 5,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const Text('Hello,',style: TextStyle(color: Colors.black,fontSize: 12),),
                    Text(
                      firstname.toString(),
                      style: const TextStyle(fontSize: 15,color: Colors.black),
                    )
                  ],
                ),
              ],
            ),
          ),
          leadingWidth: 240,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            SizedBox(
              height: 60,
              width: 70,
              child: Center(
                child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RouteNames.cartpage);
                        },
                        child: const CircleAvatar(
                          radius: 22,
                          child: Icon(Icons.add_shopping_cart),
                        ),
                      ),
                      Positioned(
                        left: 25,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 9,
                          child: Center(child: Text(counter.toString())),
                        ),
                      ),

                    ]
                ),
              ),
            ),

          ],

        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10.0,bottom: 20,top: 10),
              child: SizedBox(
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    labelText: 'Search for services',
                    labelStyle: const TextStyle(fontSize: 13),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          width: 0,
                          color: Colors.transparent,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          width: 0,
                          color: Colors.transparent,
                        )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: const [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),


            // Padding(
            //   padding: const EdgeInsets.only(bottom: 20),
            //   child: DefaultTabController(
            //     length: 3,
            //     child: Column(
            //       children: [
            //         Material(
            //           textStyle: const TextStyle(
            //               color: Colors.black, fontWeight: FontWeight.bold),
            //           borderRadius: BorderRadius.circular(0),
            //           color: Colors.white,
            //           child: TabBar(
            //             indicatorColor: Colors.green,
            //             indicatorSize: TabBarIndicatorSize.label,
            //             tabs: const [
            //               Tab(
            //                 text: "Laundry",
            //               ),
            //               Tab(
            //                 text: "Ironing",
            //               ),
            //               Tab(
            //                 text: "Washing",
            //               ),
            //             ],
            //             labelColor: Colors.black,
            //             indicator: MaterialIndicator(
            //               color: const Color(0xfff05acff),
            //               height: 3,
            //               topLeftRadius: 10,
            //               topRightRadius: 10,
            //               bottomLeftRadius: 10,
            //               bottomRightRadius: 10,
            //               horizontalPadding: 10,
            //               tabPosition: TabPosition.bottom,
            //             ),
            //             labelStyle: const TextStyle(
            //                 color: Colors.black, fontWeight: FontWeight.bold),
            //             unselectedLabelColor: Colors.grey,
            //           ),
            //         ),
            //         SizedBox(
            //           height: 300,
            //           width: MediaQuery.of(context).size.width,
            //           child: TabBarView(
            //               children: [
            //             ChangeNotifierProvider<ProductsListViewModel>.value(
            //               value: productsListViewModel,
            //               child: Consumer<ProductsListViewModel>(
            //                   builder: (context, value, _) {
            //                 switch (value.productsListLaundry.status) {
            //                   case Status.LOADING:
            //                     return const Center(
            //                       child: CircularProgressIndicator(
            //                         color: Colors.white,
            //                       ),
            //                     );
            //                   case Status.ERROR:
            //                     return Column(
            //                       mainAxisAlignment: MainAxisAlignment.center,
            //                       children: [
            //                         SizedBox(
            //                           child: Text(value.productsListLaundry.message
            //                               .toString(),
            //                           textAlign: TextAlign.center,),
            //                           width: 200,
            //                         ),
            //                         // TextButton(
            //                         //     onPressed: () {
            //                         //       leaveAppListViewModel.fetchLeaveAppListApi();
            //                         //     },
            //                         //     child: const Text(
            //                         //       'Retry',
            //                         //       style: TextStyle(fontSize: 20),
            //                         //     ))
            //                       ],
            //                     );
            //                   case Status.COMPLETED:
            //                     return Column(
            //                       children: [
            //                         ListView.separated(
            //                             padding: const EdgeInsets.only(
            //                                 bottom: 5, top: 5),
            //                             shrinkWrap: true,
            //                             physics:
            //                                 const NeverScrollableScrollPhysics(),
            //                             separatorBuilder:
            //                                 (BuildContext context, index) {
            //                               return const Divider();
            //                             },
            //                             itemCount: value.productsListLaundry
            //                                 .data!.data!.length,
            //                             itemBuilder:
            //                                 (BuildContext context, index) =>
            //                                     Padding(
            //                                       padding: const EdgeInsets.only(bottom: 10),
            //                                       child: Container(
            //                                         // shadowColor: Colors.grey.shade200,elevation: 5,
            //                                         child: Padding(
            //                                           padding: const EdgeInsets.only(left: 10,right: 10),
            //                                           child: Row(
            //                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                                             children: [
            //                                               Container(
            //                                                 height: 60,
            //                                                 width: 50,
            //                                                 decoration: BoxDecoration(
            //                                                   color: Colors.grey,
            //                                                   borderRadius: BorderRadius.circular(5),
            //                                                   // boxShadow: [BoxShadow(
            //                                                   //     color: Colors.grey.shade200,
            //                                                   //     spreadRadius: 5,
            //                                                   //     blurRadius: 5
            //                                                   // )]
            //                                                 ),
            //                                                 child: Image.network(value.productsListLaundry.data!.data![index].image.toString()),
            //                                               ),
            //
            //                                               Padding(
            //                                                 padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
            //                                                 child: Column(
            //                                                   crossAxisAlignment: CrossAxisAlignment.start,
            //                                                   children: [
            //                                                     Text(value.productsListLaundry.data!.data![index].product.toString(),style: const TextStyle(
            //                                                         fontWeight: FontWeight.bold,
            //                                                         fontSize: 15
            //                                                     ),),
            //                                                     Row(
            //                                                       mainAxisAlignment:
            //                                                       MainAxisAlignment.spaceEvenly,
            //                                                       children: [
            //                                                         Icon(
            //                                                           Icons.currency_rupee,
            //                                                           size: 14,
            //                                                         ),
            //                                                         Text(
            //                                                           value.productsListLaundry.data!.data![index].price.toString(),
            //                                                           style: TextStyle(
            //                                                               fontWeight: FontWeight.w500,
            //                                                               fontSize: 15),
            //                                                         ),
            //                                                         // Text(
            //                                                         //   '/pcs',
            //                                                         //   style:
            //                                                         //   TextStyle(fontWeight: FontWeight.w300),
            //                                                         // ),
            //                                                       ],
            //                                                     ),
            //
            //
            //                                                   ],
            //                                                 ),
            //                                               ),
            //                                               Container(
            //                                                 height: 30,
            //                                                 decoration: BoxDecoration(
            //                                                     color: Colors.white,
            //                                                     borderRadius: BorderRadius.circular(3)
            //                                                 ),
            //                                                 child: Center(
            //                                                   child: Center(
            //                                                     child: Row(
            //                                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                                                       // crossAxisAlignment: CrossAxisAlignment.center,
            //                                                       children: [
            //                                                         // counter1==0?Text(''):
            //                                                         InkWell(onTap: (){
            //                                                           setState(() {
            //                                                             // counts.clear();
            //                                                             value.productsListLaundry.data!.data![index].count--;
            //                                                             counter = value.productsListLaundry.data!.data![index].count--;
            //                                                             // counts.removeAt(index);
            //                                                             counts.add(value.productsListLaundry.data!.data![index].count);
            //                                                             // counter1--;
            //                                                             print(counts);
            //                                                             // function;
            //                                                           });
            //                                                         }, child: Container(
            //                                                             width: 30,
            //                                                             decoration: BoxDecoration(
            //                                                                 color: Colors.white,
            //                                                                 borderRadius: BorderRadius.circular(5),
            //                                                                 boxShadow: [BoxShadow(
            //                                                                     color: Colors.grey.shade200,
            //                                                                     spreadRadius: 5,
            //                                                                     blurRadius: 5
            //                                                                 )]
            //                                                             ),
            //                                                             child: const Text('-',textAlign: TextAlign.center,
            //                                                               style: TextStyle(color: Colors.blue,fontSize: 25),))),
            //                                                         const SizedBox(width: 10,),
            //                                                         Center(child:
            //                                                         Text(value.productsListLaundry.data!.data![index].count.toString(),
            //                                                           style: const
            //                                                         TextStyle(color: Colors.blue,fontSize: 25),)),
            //                                                         const SizedBox(width: 10,),
            //                                                         InkWell(onTap: (){
            //                                                           setState(() {
            //
            //                                                             value.productsListLaundry.data!.data![index].count++;
            //                                                             counter=value.productsListLaundry.data!.data![index].count++;
            //                                                             // print(counts[0].toString());
            //                                                             // if(counts[index]!=null){
            //                                                             //   print('ok');
            //                                                             // }
            //                                                             // counts[index]==0;
            //                                                             // counts.removeAt(index);
            //                                                             // // print({counts[index]});
            //                                                             // counts.add(value.productsListLaundry.data!.data![index].count);
            //                                                             // // counter1--;
            //                                                             // print(counts);
            //
            //                                                             // counter1++;
            //                                                           });
            //                                                         },
            //                                                             child: Container(
            //                                                                 width: 30,
            //                                                                 decoration: BoxDecoration(
            //                                                                     color: Colors.white,
            //                                                                     borderRadius: BorderRadius.circular(5),
            //                                                                     boxShadow: [BoxShadow(
            //                                                                         color: Colors.grey.shade200,
            //                                                                         spreadRadius: 5,
            //                                                                         blurRadius: 5
            //                                                                     )]
            //                                                                 ),
            //                                                                 child: const Text('+',textAlign: TextAlign.center,
            //                                                                   style: TextStyle(color: Colors.blue,fontSize: 25),))),
            //                                                         const SizedBox(width: 0,),
            //
            //                                                       ],
            //                                                     ),
            //                                                   ),
            //                                                 ),
            //                                               ),],
            //                                           ),
            //                                         ),
            //
            //                                       ),
            //                                     )
            //                             // children: List.generate(
            //                             //     value.productsList.data!.data!.length,
            //                             //         (index) => AddItem(
            //                             //       itemName: value.productsList.data!.data![index].product.toString(),
            //                             //       price:value.productsList.data!.data![index].price.toString(),
            //                             //       image: value.productsList.data!.data![index].image.toString(),
            //                             //     )),
            //                             ),
            //                         counter>0?
            //                         Container(
            //                           height: 50,
            //                           width: 300,
            //                           decoration: BoxDecoration(
            //                             borderRadius:
            //                                 BorderRadius.circular(50.0),
            //                           ),
            //                           child: ElevatedButton(
            //                             style: ElevatedButton.styleFrom(
            //                               shape: RoundedRectangleBorder(
            //                                   borderRadius:
            //                                       BorderRadius.circular(40)),
            //                               backgroundColor: Colors.blue,
            //                               disabledForegroundColor: Colors
            //                                   .transparent
            //                                   .withOpacity(0.38),
            //                               disabledBackgroundColor: Colors
            //                                   .transparent
            //                                   .withOpacity(0.12),
            //                               shadowColor: Colors.transparent,
            //                             ),
            //                             onPressed: () {
            //                               int index =value.productsListLaundry.data!.data!.length;
            //                               for(int i=0; i<=index-1;i++){
            //                                 Map data = {
            //                                   "customer_id": "10001",
            //                                   "product": value.productsListLaundry
            //                                       .data!.data![i].product
            //                                       .toString(),
            //                                   "price": value.productsListLaundry
            //                                       .data!.data![i].price
            //                                       .toString(),
            //                                   "count": value.productsListLaundry
            //                                       .data!.data![i].count
            //                                       .toString(),
            //                                   "category": "Laundry"
            //                                 };
            //                                 addToCart.addtoCart(data, context);
            //                               }
            //
            //                               // authviewModel.loginApi(data, context);
            //                             },
            //                             child: const Center(
            //                               child: Text(
            //                                 'Add to Cart',
            //                                 style: TextStyle(
            //                                   fontSize: 16,
            //                                   color: Color(0xffffffff),
            //                                   letterSpacing:
            //                                       -0.3858822937011719,
            //                                 ),
            //                                 textAlign: TextAlign.center,
            //                               ),
            //                             ),
            //                           ),
            //                         ):Text(''),
            //                         const SizedBox(
            //                           height: 60,
            //                         )
            //                       ],
            //                     );
            //                 }
            //                 return Container();
            //               }
            //               ),
            //             ),
            //             ChangeNotifierProvider<IroningViewModel>.value(
            //               value: ironingViewModel,
            //               child: Consumer<IroningViewModel>(
            //                   builder: (context, value, _) {
            //                 switch (value.productsListIroning.status) {
            //                   case Status.LOADING:
            //                     return const Center(
            //                       child: CircularProgressIndicator(
            //                         color: Colors.white,
            //                       ),
            //                     );
            //                   case Status.ERROR:
            //                     return Column(
            //                       children: [
            //                         Text(value.productsListIroning.message
            //                             .toString()),
            //                         TextButton(
            //                             onPressed: () {
            //                               // leaveAppListViewModel.fetchLeaveAppListApi();
            //                             },
            //                             child: const Text(
            //                               'Retry',
            //                               style: TextStyle(fontSize: 20),
            //                             ))
            //                       ],
            //                     );
            //                   case Status.COMPLETED:
            //                     return Column(
            //                       children: [
            //                         ListView.separated(
            //                             padding: const EdgeInsets.only(
            //                                 bottom: 5, top: 5),
            //                             shrinkWrap: true,
            //                             physics:
            //                                 const NeverScrollableScrollPhysics(),
            //                             separatorBuilder:
            //                                 (BuildContext context, index) {
            //                               return const Divider();
            //                             },
            //                             itemCount: value.productsListIroning
            //                                 .data!.data!.length,
            //                             itemBuilder:
            //                                 (BuildContext context, index) =>
            //                                     Padding(
            //                                       padding: const EdgeInsets.only(bottom: 10),
            //                                       child: Container(
            //                                         // shadowColor: Colors.grey.shade200,elevation: 5,
            //                                         child: Padding(
            //                                           padding: const EdgeInsets.only(left: 10,right: 10),
            //                                           child: Row(
            //                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                                             children: [
            //                                               Container(
            //                                                 height: 60,
            //                                                 width: 50,
            //                                                 decoration: BoxDecoration(
            //                                                   color: Colors.grey,
            //                                                   borderRadius: BorderRadius.circular(5),
            //                                                   // boxShadow: [BoxShadow(
            //                                                   //     color: Colors.grey.shade200,
            //                                                   //     spreadRadius: 5,
            //                                                   //     blurRadius: 5
            //                                                   // )]
            //                                                 ),
            //                                                 child: Image.network(value.productsListIroning.data!.data![index].image.toString()),
            //                                               ),
            //
            //                                               Padding(
            //                                                 padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
            //                                                 child: Column(
            //                                                   crossAxisAlignment: CrossAxisAlignment.start,
            //                                                   children: [
            //                                                     Text(value.productsListIroning.data!.data![index].product.toString(),style: const TextStyle(
            //                                                         fontWeight: FontWeight.bold,
            //                                                         fontSize: 15
            //                                                     ),),
            //                                                     Row(
            //                                                       mainAxisAlignment:
            //                                                       MainAxisAlignment.spaceEvenly,
            //                                                       children: [
            //                                                         Icon(
            //                                                           Icons.currency_rupee,
            //                                                           size: 14,
            //                                                         ),
            //                                                         Text(
            //                                                           value.productsListIroning.data!.data![index].price.toString(),
            //                                                           style: TextStyle(
            //                                                               fontWeight: FontWeight.w500,
            //                                                               fontSize: 15),
            //                                                         ),
            //                                                         // Text(
            //                                                         //   '/pcs',
            //                                                         //   style:
            //                                                         //   TextStyle(fontWeight: FontWeight.w300),
            //                                                         // ),
            //                                                       ],
            //                                                     ),
            //
            //
            //                                                   ],
            //                                                 ),
            //                                               ),
            //                                               Container(
            //                                                 height: 30,
            //                                                 decoration: BoxDecoration(
            //                                                     color: Colors.white,
            //                                                     borderRadius: BorderRadius.circular(3)
            //                                                 ),
            //                                                 child: Center(
            //                                                   child: Center(
            //                                                     child: Row(
            //                                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                                                       // crossAxisAlignment: CrossAxisAlignment.center,
            //                                                       children: [
            //                                                         // counter1==0?Text(''):
            //                                                         InkWell(onTap: (){
            //                                                           setState(() {
            //                                                             value.productsListIroning.data!.data![index].count--;
            //                                                             // counter1--;
            //                                                             // print(counter1);
            //                                                             // function;
            //                                                           });
            //                                                         }, child: Container(
            //                                                             width: 30,
            //                                                             decoration: BoxDecoration(
            //                                                                 color: Colors.white,
            //                                                                 borderRadius: BorderRadius.circular(5),
            //                                                                 boxShadow: [BoxShadow(
            //                                                                     color: Colors.grey.shade200,
            //                                                                     spreadRadius: 5,
            //                                                                     blurRadius: 5
            //                                                                 )]
            //                                                             ),
            //                                                             child: const Text('-',textAlign: TextAlign.center,
            //                                                               style: TextStyle(color: Colors.blue,fontSize: 25),))),
            //                                                         const SizedBox(width: 10,),
            //                                                         Center(child:
            //                                                         Text(value.productsListIroning.data!.data![index].count.toString(),
            //                                                           style: const
            //                                                           TextStyle(color: Colors.blue,fontSize: 25),)),
            //                                                         const SizedBox(width: 10,),
            //                                                         InkWell(onTap: (){
            //                                                           setState(() {
            //                                                             value.productsListIroning.data!.data![index].count++;
            //                                                             // counter1++;
            //                                                           });
            //                                                         },
            //                                                             child: Container(
            //                                                                 width: 30,
            //                                                                 decoration: BoxDecoration(
            //                                                                     color: Colors.white,
            //                                                                     borderRadius: BorderRadius.circular(5),
            //                                                                     boxShadow: [BoxShadow(
            //                                                                         color: Colors.grey.shade200,
            //                                                                         spreadRadius: 5,
            //                                                                         blurRadius: 5
            //                                                                     )]
            //                                                                 ),
            //                                                                 child: const Text('+',textAlign: TextAlign.center,
            //                                                                   style: TextStyle(color: Colors.blue,fontSize: 25),))),
            //                                                         const SizedBox(width: 0,),
            //
            //                                                       ],
            //                                                     ),
            //                                                   ),
            //                                                 ),
            //                                               ),],
            //                                           ),
            //                                         ),
            //                                       ),
            //                                     )
            //                             // children: List.generate(
            //                             //     value.productsList.data!.data!.length,
            //                             //         (index) => AddItem(
            //                             //       itemName: value.productsList.data!.data![index].product.toString(),
            //                             //       price:value.productsList.data!.data![index].price.toString(),
            //                             //       image: value.productsList.data!.data![index].image.toString(),
            //                             //     )),
            //                             ),
            //                         Container(
            //                           height: 50,
            //                           width: 300,
            //                           decoration: BoxDecoration(
            //                             borderRadius:
            //                                 BorderRadius.circular(50.0),
            //                           ),
            //                           child: ElevatedButton(
            //                             style: ElevatedButton.styleFrom(
            //                               shape: RoundedRectangleBorder(
            //                                   borderRadius:
            //                                       BorderRadius.circular(40)),
            //                               backgroundColor: Colors.blue,
            //                               disabledForegroundColor: Colors
            //                                   .transparent
            //                                   .withOpacity(0.38),
            //                               disabledBackgroundColor: Colors
            //                                   .transparent
            //                                   .withOpacity(0.12),
            //                               shadowColor: Colors.transparent,
            //                             ),
            //                             onPressed: () {
            //                               // Map data={
            //                               //   "customer_id" : "10001",
            //                               //   "product"     :value.productsListLaundry.data!.data![0].product.toString(),
            //                               //   "price"       : value.productsListLaundry.data!.data![0].price.toString(),
            //                               //   "count"       : "5",
            //                               //   "category"    : "Laundry"
            //                               // };
            //                               // addtocart.addtoCart(data, context);
            //                               // authviewModel.loginApi(data, context);
            //                             },
            //                             child: const Center(
            //                               child: Text(
            //                                 'Add to Cart',
            //                                 style: TextStyle(
            //                                   fontSize: 16,
            //                                   color: Color(0xffffffff),
            //                                   letterSpacing:
            //                                       -0.3858822937011719,
            //                                 ),
            //                                 textAlign: TextAlign.center,
            //                               ),
            //                             ),
            //                           ),
            //                         ),
            //                         const SizedBox(
            //                           height: 60,
            //                         )
            //                       ],
            //                     );
            //                 }
            //                 return Container();
            //               }),
            //             ),
            //             ListView(
            //               shrinkWrap: true,
            //               physics: const NeverScrollableScrollPhysics(),
            //               children: List.generate(
            //                   3,
            //                   (index) => AddItem1(
            //                         itemName: 'jeans',
            //                         price: '11',
            //                         image: '10',
            //                         // counter1: 0,
            //                         function: () {
            //                           print('counting');
            //                         },
            //                       )),
            //             ),
            //           ]),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            const SizedBox(height: 10,),
            SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              Map data ={
                                "product_type" : "Laundry"
                              };
                              productsListViewModel.fetchProductsListApi(data);
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            child: const Icon(Icons.dry_cleaning),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            'Laundry',
                            style: TextStyle(fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Map data = {"product_type": "Ironing"};
                        productsListViewModel.fetchProductsListApi(data);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade200,
                            child: const Icon(Icons.iron),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              'Ironing',
                              style: TextStyle(fontSize: 10),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Map data ={
                          "product_type" : "Washing"
                        };
                        productsListViewModel.fetchProductsListApi(data);

                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            child: const Icon(Icons.build),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              'Washing',
                              style: TextStyle(fontSize: 10),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Products',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20)),
                ],
              ),
            ),
            if (products == 'laundry')
              ChangeNotifierProvider<ProductsListViewModel>.value(
                value: productsListViewModel,
                child: Consumer<ProductsListViewModel>(
                    builder: (context, value, _) {
                      switch (value.productsListLaundry.status) {
                        case Status.LOADING:
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        case Status.ERROR:
                          return Column(
                            children: [
                              Text(value.productsListLaundry.message
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
                                  physics: const NeverScrollableScrollPhysics(),
                                  separatorBuilder: (BuildContext context,
                                      index) {
                                    return const Divider();
                                  },
                                  itemCount:
                                  value.productsListLaundry.data!.data!.length,
                                  itemBuilder: (BuildContext context, index) {

                                    final user = value.productsListLaundry.data!
                                        .data![index];

                                    return ListTile(
                                      onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context)=>ProductDetailsPage( product:user)));
                                      },

                                      title: Text(
                                          value.productsListLaundry.data!
                                              .data![index].product!
                                              .toString()),
                                      subtitle: Text(
                                          '₹ ${value.productsListLaundry.data!.data![index].price!} /pcs'.toString()),
                                      leading: Image.network(
                                          value.productsListLaundry.data!
                                              .data![index].image!.toString(),
                                        errorBuilder: (context, error, stackTrace) {
                                          return  const Icon(Icons.error,color: Colors.red,);
                                        },),


                                    );
                                  }


                              ),
                            ],
                          );
                      }
                      return const Text('');
                    })
    ),

            if (products == 'ironing')
              ChangeNotifierProvider<ProductsListViewModel>.value(
                value: productsListViewModel,
                child: Consumer<ProductsListViewModel>(
                    builder: (context, value, _) {
                  switch (value.productsListLaundry.status) {
                    case Status.LOADING:
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    case Status.ERROR:
                      return Column(
                        children: [
                          Text(value.productsListLaundry.message.toString()),
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
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (BuildContext context, index) {
                          return const Divider();
                        },
                        itemCount: value.productsListLaundry.data!.data!.length,
                        itemBuilder: (BuildContext context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            // shadowColor: Colors.grey.shade200,elevation: 5,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    child: Image.network(value
                                        .productsListLaundry
                                        .data!
                                        .data![index]
                                        .image
                                        .toString()),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 10, bottom: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          value.productsListLaundry.data!
                                              .data![index].product
                                              .toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const Icon(
                                              Icons.currency_rupee,
                                              size: 14,
                                            ),
                                            Text(
                                              value.productsListLaundry.data!
                                                  .data![index].price
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(3)),
                                    child: Center(
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          // crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            counter == 0
                                                ? const Text('')
                                                : InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        counter--;
                                                        print('--');
                                                      });
                                                    },
                                                    child: Container(
                                                        width: 30,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade200,
                                                                  spreadRadius:
                                                                      5,
                                                                  blurRadius: 5)
                                                            ]),
                                                        child: const Text(
                                                          '-',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.blue,
                                                              fontSize: 25),
                                                        ))),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Center(
                                                child: Text(
                                              '${counter}',
                                              style: const TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 25),
                                            )),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    counter++;
                                                    // count.add(counter);
                                                    // print(count);
                                                  });
                                                },
                                                child: Container(
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Colors.grey
                                                                  .shade200,
                                                              spreadRadius: 5,
                                                              blurRadius: 5)
                                                        ]),
                                                    child: const Text(
                                                      '+',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 25),
                                                    ))),
                                            const SizedBox(
                                              width: 0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // children: List.generate(
                        //     value.productsList.data!.data!.length,
                        //         (index) => AddItem(
                        //       itemName: value.productsList.data!.data![index].product.toString(),
                        //       price:value.productsList.data!.data![index].price.toString(),
                        //       image: value.productsList.data!.data![index].image.toString(),
                        //     )),
                      );
                  }
                  return Container();
                }),
              ),

            if (products == 'washing')
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (BuildContext context, index) {
                    return const Divider();
                  },
                  itemCount: 1,
                  // value.productsListIroning.data!.data!.length,
                  itemBuilder: (BuildContext context, index) =>
                      AddItem(
                        itemName: 'jeans',
                        price: '11',
                        image: '10',
                      )),
            const SizedBox(
              height: 15,
            ),

//             itemData[index].ShouldVisible?
//             Center(
//                 child: Container(
//                   height: 30,
//                   width: 70,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(4),
//                       border: Border.all(color: Colors.white70)
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: <Widget>[
//                       InkWell(
//                           onTap: (){
//                             setState(() {
//                               if(itemData[index].Counter <2)
//                               {
//                                 itemData[index].ShouldVisible = !itemData[index].ShouldVisible;
//                               }else{
//                                 itemData[index].Counter--;
//                               }
//
//                             });
//                           }
//                           ,child: Icon(Icons.remove,color: Colors.green,size: 18,)),
//                       Text('${itemData[index].Counter}',style: TextStyle(
//                           color: Colors.white70
//                       ),
//                       ),
//                       InkWell(
//                           onTap: (){
//                             setState(() {
//                               itemData[index].Counter++;
//                             });
//                           }
//                           ,child: Icon(Icons.add,color: Colors.green,size: 18,)),
//
//                     ],
//                   ),
//
//                 )
//             ) : Center(
//               child: Container(
//                 padding: EdgeInsets.all(5),
//                 height: 30,
//                 width: 70,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(4),
//                     border: Border.all(color: Colors.white70)
//                 ),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text('ADD',style: TextStyle(color: Colors.white70),
//                     ),
//                     InkWell(
//                         onTap: (){
//
//                           setState(() {
//                             itemData[index].ShouldVisible = ! itemData[index].ShouldVisible;
// //
//
//                           });
//                         }
//                         ,child: Center(child: Icon(Icons.add,color: Colors.green,size: 18,)))
//
//                   ],
//                 ),
//
//               ),
//             )
          ],
        ),
      ),
    );
  }


}
class ItemData{
  String? Name;
  int? Counter;
  bool? ShouldVisible;

  ItemData({
    this.Name,
    this.Counter,
    this.ShouldVisible
  });
}

List<ItemData> itemData = [
  ItemData(
      Name: 'Shoes 1',
      Counter: 1,
      ShouldVisible: false
  ),
  ItemData(
      Name: 'Shoes 2',
      Counter: 1,
      ShouldVisible: false
  ),];


