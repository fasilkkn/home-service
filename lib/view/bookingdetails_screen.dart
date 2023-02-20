import 'package:flutter/material.dart';
import 'package:happy_toys/resources/components/form.dart';
import 'package:happy_toys/view/services/add_items.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({Key? key}) : super(key: key);

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {

  final nameController = TextEditingController();

  bool? press = false;
  var timeslot = '09:00 - 12:00';
  int counter =0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30,left: 0,bottom: 10),
                  child: Text('Name',style: TextStyle(fontSize: 20),),
                ),
              ],
            ),

            TextFormField(
              scrollPhysics: AlwaysScrollableScrollPhysics(),
              controller: nameController,
              keyboardType: TextInputType.text,
              inputFormatters: [
                // FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                // LengthLimitingTextInputFormatter(6)
              ],
              // onFieldSubmitted: (value){
              //   Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
              // },
              decoration: InputDecoration(
                fillColor: Colors.grey.shade200,
                filled: true,
                contentPadding:
                const EdgeInsets.fromLTRB(
                    10, 10, 0, 0),
                enabledBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: Colors.transparent)),
                border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color:Colors.transparent)),

                hintText: 'name',
                // labelText: 'email',
                prefixIcon: const Icon(Icons.person,color: Colors.grey,),
              ),
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return "value can't be empty";
                }
                // return null;
              },
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 0),
                  child: Text('Delivery Type',style: TextStyle(fontSize: 20),),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Container(
                    width: 130,
                    height: 50,
                    decoration: BoxDecoration(
                        color: press!?Colors.teal:Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [BoxShadow(
                            color: Colors.grey.shade200,
                            spreadRadius: 5,
                            blurRadius: 5
                        )]
                    ),

                    child: Center(child: Text('Pickup from Home',
                      style: TextStyle(color:press!? Colors.white:Colors.black),)),
                  ),onTap: (){
                  setState(() {
                    press=true;
                    timeslot= 'Fast';
                    print(timeslot);
                  });
                },
                ),
                InkWell(
                  child: Container(
                    width: 130,
                    height: 50,
                    decoration: BoxDecoration(
                        color: press!?Colors.white:Colors.teal,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [BoxShadow(
                            color: Colors.grey.shade200,
                            spreadRadius: 5,
                            blurRadius: 5
                        )]
                    ),

                    child: Center(child: Text('Drop at Store',
                      style: TextStyle(color:press!? Colors.black:Colors.white),)),
                  ),onTap: (){
                  setState(() {
                    press=false;
                    timeslot = 'Normal';
                    print(timeslot);
                  });
                },
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30,left: 0),
                  child: Text('Service Type',style: TextStyle(fontSize: 20),),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        color: press!?Colors.teal:Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [BoxShadow(
                            color: Colors.grey.shade200,
                            spreadRadius: 5,
                            blurRadius: 5
                        )]
                    ),

                    child: Center(child: Text('Fast',
                      style: TextStyle(color:press!? Colors.white:Colors.black),)),
                  ),onTap: (){
                  setState(() {
                    press=true;
                    timeslot= 'Fast';
                    print(timeslot);
                  });
                },
                ),
                InkWell(
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        color: press!?Colors.white:Colors.teal,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [BoxShadow(
                            color: Colors.grey.shade200,
                            spreadRadius: 5,
                            blurRadius: 5
                        )]
                    ),

                    child: Center(child: Text('Normal',
                      style: TextStyle(color:press!? Colors.black:Colors.white),)),
                  ),onTap: (){
                  setState(() {
                    press=false;
                    timeslot = 'Normal';
                    print(timeslot);
                  });
                },
                ),
              ],
            ),
            // SizedBox(
            //   width: 300,
            //   height: 200,
            //   child: ListView(
            //     shrinkWrap: true,
            //     physics: const NeverScrollableScrollPhysics(),
            //     children:
            //     List.generate(5, (index) =>
            //         AddItem(
            //
            //       itemName: 'Shirts',
            //
            //       description:'123',
            //
            //       price: 120,
            //
            //
            //     )
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
