
import 'package:flutter/material.dart';
import 'package:happy_toys/resources/color.dart';
import '../model/products_model.dart';
import 'package:sizer/sizer.dart';

import '../utils/routes/routes_name.dart';


class ProductDetailsPage extends StatefulWidget {

  final Data product ;

  const ProductDetailsPage({Key? key,required this.product}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    child: Center(
                      child: Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, RouteNames.cartpage);
                              },
                              child:Icon(Icons.add_shopping_cart,size: 28,),
                            ),
                            Positioned(
                              left: 17,
                              right: 0,
                              top: 0,
                              child: CircleAvatar(
                                backgroundColor:AppColors.mainColor,
                                radius: 7,
                                child: Center(child: Text('0')),
                              ),
                            ),

                          ]
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                height: 30.h,

                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20.h,
                              child: Image.network(widget.product.image.toString(),)),
                        ],
                      ),

                      SizedBox(width: 5.w,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 3.h,),

                          Text(widget.product.productType.toString(),
                            style:TextStyle(fontSize: 18,),),

                          Text(widget.product.product.toString(),
                          style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                          Text('₹ ${widget.product.price}/pcs'.toString(),
                            style:TextStyle(fontSize: 20,),),

                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20,),
              const Divider(thickness:0.5, color:Colors.grey,),
              SizedBox(height: 30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Price',style:TextStyle(fontSize: 16,),),
                  Text(widget.product.price.toString()),
                ],
              ),

              SizedBox(height: 5,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tax',style:TextStyle(fontSize: 16,),),
                  Text('2.5'),
                ],
              ),
            ],
          ),
        ),
      ),
      
        bottomNavigationBar:
        Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                color: AppColors.mainColor,
                child: const Center(
                    child: Text('Add to cart',
                    style: TextStyle(color: Colors.white),)),
              ),
            ),
            Expanded(
              child: Container(
                height: 50,
                color: Colors.grey,
                child: const Center(
                    child: Text('Buy now',
                      style: TextStyle(color: Colors.white),)),
              ),
            ),
          ],
        ) ,
    );
  }
}
