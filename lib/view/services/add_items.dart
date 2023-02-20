import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key,
    required this.itemName,
    required this.price,
    required this.image,
  }) : super(key: key);

  final String? itemName;
  final String? price;
  final String? image;

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {

  int counter = 0;
  List<int> count = [0];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 60,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image.network(widget.image.toString(),fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return  const Icon(Icons.error,color: Colors.red,);
                },),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.itemName.toString(),style: const TextStyle(
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
                        widget.price.toString(),
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
                      counter==0?Text(''):
                      InkWell(onTap: (){
                        setState(() {
                          counter--;
                          count.clear();
                          count.add(counter);
                          // print(counter);
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
                      Center(child: Text('$counter',style: const
                      TextStyle(color: Colors.blue,fontSize: 25),)),
                      const SizedBox(width: 10,),
                      InkWell(onTap: (){
                        setState(() {
                          counter++;
                          count.clear();
                          count.add(counter);
                          print(count);
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
    );
  }
}

class AddItem1 extends StatelessWidget {
  AddItem1({Key? key,
    required this.itemName,
    // required this.description,
    required this.price,
    required this.image,
    required this.function,

  }) : super(key: key);

  final String? itemName;
  // final String? description;
  final String? price;
  final String? image;
  final Function function;

  int counter1 = 0;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder:(BuildContext context, setState) {
        return Padding(
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
                    child: Image.network(image.toString()),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(itemName.toString(),style: const TextStyle(
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
                              price.toString(),
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
                            counter1==0?Text(''):
                            InkWell(onTap: (){
                              setState(() {
                                counter1--;
                                print(counter1);
                               function;
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
                            Center(child: Text('$counter1',style: const
                            TextStyle(color: Colors.blue,fontSize: 25),)),
                            const SizedBox(width: 10,),
                            InkWell(onTap: (){
                              setState(() {
                                counter1++;
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
        );

      },
    );
  }
}

