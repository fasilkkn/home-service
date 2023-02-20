import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happy_toys/resources/color.dart';
import 'package:happy_toys/view_model/register_view_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  ValueNotifier<bool> obscurePassword = ValueNotifier<bool>(true);

  final emailController           = TextEditingController();
  final passwordController        = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController            = TextEditingController();
  final addressController         = TextEditingController();
  final dateInput                 = TextEditingController();
  final phoneController           = TextEditingController();

  final emailFocusNode            = FocusNode();
  final passwordFocusNode         = FocusNode();
  final confirmPasswordFocusNode  = FocusNode();
  final userNameFocusNode         = FocusNode();
  final addressFocusNode          = FocusNode();
  final dateFocusNode             = FocusNode();
  final phoneFocusNode            = FocusNode();


  bool loading = false;
  String? _selectCategory;

  final List<String> _selectCategoryList = ['Male', 'Female', 'Transgender'];


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    addressController.dispose();
    dateInput.dispose();
    phoneController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    userNameFocusNode.dispose();
    addressFocusNode.dispose();
    dateFocusNode.dispose();
    phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final newUserViewModel = Provider.of<RegisterViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('SignUp',style: TextStyle(
                    fontSize: 30.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                )),
                Text('Lorem Ipsum is simply dummy text of the printing',style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.black,
                )),
                SizedBox(height: 3.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      scrollPhysics: const AlwaysScrollableScrollPhysics(),
                      focusNode: emailFocusNode,
                      controller: emailController,
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (value){
                        Utils.fieldFocusChange(context, emailFocusNode, userNameFocusNode);
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        contentPadding:
                        const EdgeInsets.fromLTRB(
                            10, 10, 0, 0),
                        hintText: 'email',
                        prefixIcon: const Icon(Icons.alternate_email,color: Colors.grey,),

                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.sp),
                            borderSide: const BorderSide(color: Colors.transparent)
                        ),

                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.sp),
                            borderSide: const BorderSide(color: Colors.transparent)
                        ),
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "value can't be empty";
                        }
                      },
                    ),

                    SizedBox(height: 1.h,),
                    TextFormField(
                      scrollPhysics: const AlwaysScrollableScrollPhysics(),
                      controller: nameController,
                      focusNode: userNameFocusNode,
                      keyboardType: TextInputType.text,
                       onFieldSubmitted: (value){
                        Utils.fieldFocusChange(context, emailFocusNode, addressFocusNode);
                      },
                      decoration:  InputDecoration(
                        contentPadding:
                        const EdgeInsets.fromLTRB(10, 10, 0, 0),
                        hintText: 'username',
                        prefixIcon: const Icon(Icons.person,color: Colors.grey,),
                        fillColor:Colors.grey.shade200,
                        filled: true,

                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.sp),
                            borderSide:  const BorderSide(color: Colors.transparent)
                        ),

                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.sp),
                            borderSide: const BorderSide(color: Colors.transparent)
                        ),

                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "value can't be empty";
                        }
                        // return null;
                      },
                    ),

                    SizedBox(height: 1.h,),
                    TextFormField(
                      scrollPhysics: const AlwaysScrollableScrollPhysics(),
                      controller: addressController,
                      focusNode: addressFocusNode,
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (value){
                        Utils.fieldFocusChange(context, emailFocusNode, phoneFocusNode);
                      },
                      decoration:  InputDecoration(
                        contentPadding:
                        const EdgeInsets.fromLTRB(10, 10, 0, 0),
                        hintText: 'address',
                        prefixIcon: const Icon(Icons.location_on_outlined,color: Colors.grey,),
                        filled: true,
                        fillColor: Colors.grey.shade200,

                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.sp),
                            borderSide: const BorderSide(color: Colors.transparent)
                        ),

                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.sp),
                            borderSide: const BorderSide(color: Colors.transparent)
                        ),
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "value can't be empty";
                        }
                        // return null;
                      },
                    ),

                    SizedBox(height: 1.h,),
                    TextFormField(
                      scrollPhysics: const AlwaysScrollableScrollPhysics(),
                      controller: phoneController,
                      focusNode: phoneFocusNode,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        LengthLimitingTextInputFormatter(10)
                      ],
                      onFieldSubmitted: (value){
                        Utils.fieldFocusChange(context, emailFocusNode, dateFocusNode);
                      },
                      decoration: InputDecoration(
                        contentPadding:
                        const EdgeInsets.fromLTRB(10, 10, 0, 0),
                        hintText: 'phone number',
                        prefixIcon: const Icon(Icons.phone,color: Colors.grey,),
                        fillColor: Colors.grey.shade200,
                        filled: true,

                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.sp),
                            borderSide: const BorderSide(color: Colors.transparent)
                        ),

                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.sp),
                            borderSide: const BorderSide(color: Colors.transparent)
                        ),
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "value can't be empty";
                        }
                      },
                    ),

                    SizedBox(height: 1.h,),
                    TextFormField(
                      controller: dateInput,
                      focusNode: dateFocusNode,
                      decoration:  InputDecoration(
                        hintText: 'Date of birth',
                        isDense: true,
                        contentPadding:
                        const EdgeInsets.fromLTRB(10, 10, 0, 0),
                        prefixIcon: const Icon(Icons.calendar_today,
                            color:  Colors.grey
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade200,

                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.sp),
                            borderSide: const BorderSide(color: Colors.transparent)
                        ),

                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.sp),
                            borderSide: const BorderSide(color: Colors.transparent)
                        ),
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

                    SizedBox(height: 1.h,),
                    DropdownButtonFormField(
                      dropdownColor:  Colors.white,
                      iconEnabledColor: Colors.white,
                      style: const TextStyle(color:Colors.black),
                      decoration:  InputDecoration(
                        prefixIcon:  const Icon(
                          Icons.arrow_drop_down_outlined,
                          color:Colors.grey,
                          size: 30),
                        isDense: true,
                        contentPadding:
                        const EdgeInsets.fromLTRB(10, 10, 0, 0),
                        iconColor: Colors.grey,
                        fillColor: Colors.grey.shade200,
                        filled: true,

                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.sp),
                            borderSide: const BorderSide(color: Colors.transparent)
                        ),

                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.sp),
                            borderSide: const BorderSide(color: Colors.transparent)
                        ),
                      ),
                      hint: const Text(
                        'Gender', style: TextStyle(fontSize: 15),),
                      value: _selectCategory,
                      onChanged: (newValue1) {
                        setState((){
                          _selectCategory = newValue1 as String ;
                        }
                        );
                      },
                      items: _selectCategoryList.map((location) {
                        return
                          DropdownMenuItem(
                            alignment: AlignmentDirectional.center,
                            value: location,
                            child: Text(location),
                          );
                      }).toList(),
                      validator: (value) {
                        if (value == null || value == 0) {
                          return 'Please Choose Gender';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 1.h,),
                    TextFormField(
                      scrollPhysics: const AlwaysScrollableScrollPhysics(),
                      controller: passwordController,
                      focusNode: passwordFocusNode,
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (value){
                        Utils.fieldFocusChange(context, emailFocusNode, confirmPasswordFocusNode);
                      },
                      decoration: InputDecoration(
                        contentPadding:
                        const EdgeInsets.fromLTRB(
                            10, 10, 0, 0),

                        hintText: 'password',
                        prefixIcon: const Icon(Icons.lock,color: Colors.grey,),
                        fillColor: Colors.grey.shade200,
                        filled: true,

                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.sp),
                            borderSide: const BorderSide(color: Colors.transparent)
                        ),

                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.sp),
                            borderSide: const BorderSide(color: Colors.transparent)
                        ),
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "value can't be empty";
                        }
                        // return null;
                      },
                    ),

                    SizedBox(height: 1.h,),
                    TextFormField(
                      scrollPhysics: const AlwaysScrollableScrollPhysics(),
                      controller: confirmPasswordController,
                      keyboardType: TextInputType.text,
                      focusNode: confirmPasswordFocusNode,
                      decoration: InputDecoration(
                        contentPadding:
                        const EdgeInsets.fromLTRB(
                            10, 10, 0, 0),
                        hintText: 'confirm password',
                        prefixIcon: const Icon(Icons.lock,color: Colors.grey,),
                        filled: true,
                      fillColor: Colors.grey.shade200,

                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.sp),
                            borderSide: const BorderSide(color: Colors.transparent)
                        ),

                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.sp),
                            borderSide: const BorderSide(color: Colors.transparent)
                        ),),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "value can't be empty";
                        }
                        // return null;
                      },
                    ),
                    SizedBox(height: 3.h,),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.sp)
                          ),
                          backgroundColor:AppColors.mainColor,),
                        onPressed: (){
                          Map data= {
                            "customer_id" : "1003",
                            "name" : nameController.text.trim(),
                            "email":  emailController.text.trim(),
                            "password" :confirmPasswordController.text.trim(),
                            "phone_number":phoneController.text.trim(),
                            "address" : addressController.text.trim(),
                            "gender" :_selectCategory,
                            "dob" : dateInput.text.trim()
                          };
                          newUserViewModel.signupApi(data, context);
                        },
                        child: newUserViewModel.loading?
                        const Center(child: CircularProgressIndicator(color: Colors.white,)):
                        const Center(
                          child: Text(
                            'Signup',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black
                            )),
                        TextButton(onPressed: (){
                          Navigator.pushNamed(context,RouteNames.login);
                        }, child: const Text('Login',
                          style: TextStyle(
                              color:AppColors.mainColor,
                          ),)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
