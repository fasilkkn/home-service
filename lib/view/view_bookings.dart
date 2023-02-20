import 'package:flutter/material.dart';

class ViewBookings extends StatefulWidget {
  const ViewBookings({Key? key}) : super(key: key);

  @override
  State<ViewBookings> createState() => _ViewBookingsState();
}

class _ViewBookingsState extends State<ViewBookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30,left: 0,bottom: 5),
                  child: Text('Your bookings',
                    style: TextStyle(
                        fontSize: 25,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ],
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 0),
                    child: Container(
                      height: 170,
                      width: 160,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade50,
                                spreadRadius: 3,
                                blurRadius: 3)
                          ],
                          borderRadius: BorderRadius.circular(0),
                          color: Colors.grey.shade300),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 170,
                                child: Image.asset(
                                  'assets/images/Cleaning.jpg',
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ],
                          ),

                          // SizedBox(width: 29,),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '06/02/2023',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [

                                  Text('11:30',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15)),
                                ],
                              ),
                              Text(
                                'Home Cleaning',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              Text(
                                'By Bright House, Kochi',
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.currency_rupee,
                                    size: 14,
                                  ),
                                  Text(
                                    '250',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    '/h',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
