import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {

  final dateInput=TextEditingController();
  final timeInput=TextEditingController();
  bool loading = false;

  double slidervalue =0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height:MediaQuery.of(context).size.height*1.2 ,),
              Image.asset('assets/images/Cleaning.jpg',
                height: 300,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,),
              Positioned(
                top: 260,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30,left: 20),
                              child: Text('Room',style: TextStyle(fontSize: 20),),
                            ),
                          ],
                        ),
                        Slider(
                          inactiveColor: Colors.grey,
                            value: slidervalue,
                            onChanged: (double value){
                          setState(() {
                            slidervalue=value;
                          });

                            },
                          activeColor: Colors.orange,
                          max: 100,
                          divisions: 10,
                          // secondaryTrackValue: 100,
                          label: 'room count',
                          // min: 10.0,
                          secondaryActiveColor: Colors.grey,

                            ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5,left: 10,bottom: 10),
                              child: Text('choose date',style: TextStyle(fontSize: 16),),
                            ),
                          ],
                        ),
                        SizedBox(
                          // width: 170,
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                            controller: dateInput,
                            decoration: InputDecoration(
                              hintText: 'date',
                              isDense: true,
                              contentPadding:
                              const EdgeInsets.fromLTRB(20, 20, 20, 0),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color:  Colors.orange)),
                              suffixIcon: const Icon(
                                Icons.calendar_today,
                                color:  Colors.orange
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color:  Colors.orange)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: Colors.orange)),
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2100),
                                  builder: (context,child){
                                    return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: const ColorScheme.light(
                                              primary: Colors.orange
                                          ),
                                        ),
                                        child: child!);

                                  }
                              );

                              if (pickedDate != null) {
                                String formattedDate =
                                DateFormat('dd-MM-yyyy')
                                    .format(pickedDate);
                                setState(() {
                                  dateInput.text = formattedDate;
                                });
                              } else {}
                            },
                            validator: (value) =>
                            value!.isEmpty ? 'Select Date' : null,
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5,left: 10,bottom: 10),
                              child: Text('choose time',style: TextStyle(fontSize: 16),),
                            ),
                          ],
                        ),

                        SizedBox(
                          // width: 170,
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                            controller: timeInput,
                            decoration: InputDecoration(
                              hintText: 'time',
                              isDense: true,
                              contentPadding:
                              const EdgeInsets.fromLTRB(20, 20, 20, 0),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color:  Colors.orange)),
                              suffixIcon: const Icon(
                                  Icons.timer_rounded,
                                  color:  Colors.orange
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color:  Colors.orange)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: Colors.orange)),
                            ),
                            readOnly: true,
                            onTap: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (BuildContext context, Widget? child){
                                  return MediaQuery(
                                      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
                                      child: child!);
                                }

                              );

                              if (pickedTime != null) {
                                DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                                String formattedDate =
                               DateFormat('HH:mm:ss')
                                    .format(parsedTime);
                                setState(() {
                                  timeInput.text = formattedDate;
                                });
                              } else {}
                            },
                            validator: (value) =>
                            value!.isEmpty ? 'Select Date' : null,
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5,left: 10,bottom: 10),
                              child: Text('Location',style: TextStyle(fontSize: 16),),
                            ),
                          ],
                        ),
                        SizedBox(
                          // width: 170,
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                            controller: timeInput,
                            decoration: InputDecoration(
                              hintText: 'location',
                              isDense: true,
                              contentPadding:
                              const EdgeInsets.fromLTRB(20, 20, 20, 0),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color:  Colors.orange)),
                              suffixIcon: const Icon(
                                  Icons.location_on,
                                  color:  Colors.orange
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color:  Colors.orange)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: Colors.orange)),
                            ),
                            readOnly: true,
                            onTap: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                  builder: (BuildContext context, Widget? child){
                                    return MediaQuery(
                                        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
                                        child: child!);
                                  }

                              );

                              if (pickedTime != null) {
                                DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                                String formattedDate =
                                DateFormat('HH:mm:ss')
                                    .format(parsedTime);
                                setState(() {
                                  timeInput.text = formattedDate;
                                });
                              } else {}
                            },
                            validator: (value) =>
                            value!.isEmpty ? 'Select Date' : null,
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5,left: 10,bottom: 10),
                              child: Text('Phone Number',style: TextStyle(fontSize: 16),),
                            ),
                          ],
                        ),
                        SizedBox(
                          // width: 170,
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                            controller: timeInput,
                            decoration: InputDecoration(
                              hintText: 'phone number',
                              isDense: true,
                              contentPadding:
                              const EdgeInsets.fromLTRB(20, 20, 20, 0),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color:  Colors.orange)),
                              suffixIcon: const Icon(
                                  Icons.phone,
                                  color:  Colors.orange
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color:  Colors.orange)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: Colors.orange)),
                            ),
                            validator: (value) =>
                            value!.isEmpty ? 'Select Date' : null,
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            // gradient: const LinearGradient(
                            //   begin: Alignment(-0.95, 0.0),
                            //   end: Alignment(1.0, 0.0),
                            //   colors: [AppColors.maincolor,Color(0xfffAF8C8A),Color(0xfffA59796)],
                            //   stops: [0.0,0.5, 1.0],
                            // ),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // minimumSize: Size(300, 35),
                              // maximumSize: Size(300, 35),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)
                              ),
                              backgroundColor: Colors.orange,
                              disabledForegroundColor: Colors.transparent.withOpacity(0.38),
                              disabledBackgroundColor: Colors.transparent.withOpacity(0.12),
                              shadowColor: Colors.transparent,),
                            onPressed: (){
                            },
                            child: loading?
                            const Center(child: CircularProgressIndicator(color: Colors.white,)):
                            const Center(
                              child: Text(
                                'Book now',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xffffffff),
                                  letterSpacing: -0.3858822937011719,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
