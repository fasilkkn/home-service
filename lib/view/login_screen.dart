import 'package:flutter/material.dart';
import 'package:happy_toys/resources/color.dart';
import 'package:happy_toys/utils/routes/routes_name.dart';
import 'package:happy_toys/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import '../utils/utils.dart';
import 'package:sizer/sizer.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  ValueNotifier<bool> obscurePassword = ValueNotifier<bool>(true);

  final emailController    = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode    = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {

    emailController.dispose();
    passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    obscurePassword.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final authViewModel= Provider.of<AuthViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  'https://img.freepik.com/free-vector/plumber-repairing-pipe-burst-woman-phoning-service-stop-house-flooding_74855-14142.jpg?w=740&t=st=1676273002~exp=1676273602~hmac=5b831bad0a789d07bf0affc22cbedc402332243737c8caee91383c6388a88dae',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return  Center(
                        child: Text('Loading.....',
                        style: TextStyle(fontSize: 13.sp),));
                  },
                ),
              ),
               Text('Login',style: TextStyle(
                  fontSize: 30.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              )),
               Text('Hello there, Welcome back!',style: TextStyle(
                fontSize: 13.sp,
                color: Colors.black
              ),),
               SizedBox(height: 5.h),

              TextFormField(
                scrollPhysics: const AlwaysScrollableScrollPhysics(),
                controller: emailController,
                keyboardType: TextInputType.text,
                focusNode: emailFocusNode,
                onFieldSubmitted: (value){
                  Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  contentPadding:
                    const EdgeInsets.fromLTRB(
                      2, 2, 0, 0),

                  enabledBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(20.sp),
                      borderSide: const BorderSide(
                          color: Colors.transparent)),

                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(20.sp),
                      borderSide: const BorderSide(
                          color: Colors.transparent)),

                  border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(20.sp),
                      borderSide: const BorderSide(
                          color:Colors.transparent)),

                  hintText: 'email',
                  prefixIcon: const Icon(Icons.alternate_email,color: Colors.grey,),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "value can't be empty";
                  }
                  return null;
                },
              ),

               SizedBox(height: 2.h,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ValueListenableBuilder(
                    valueListenable: obscurePassword,
                    builder: (context, value, child){
                      return TextFormField(
                        focusNode: passwordFocusNode,
                        obscureText: obscurePassword.value,
                        controller: passwordController,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade300,
                            filled: true,
                            contentPadding:  const EdgeInsets.fromLTRB(2, 2, 0, 0),

                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.sp),
                                borderSide: const BorderSide(color: Colors.transparent)
                            ),

                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.sp),
                                borderSide: const BorderSide(color: Colors.transparent)
                            ) ,

                            hintText: 'password',
                            prefixIcon:  Icon(Icons.lock,
                              color:  Colors.grey,),
                            suffixIcon: InkWell(
                                onTap: (){
                                  obscurePassword.value = ! obscurePassword.value;
                                },
                                child: obscurePassword.value? const Icon(Icons.visibility_off,
                                  color: Colors.grey,size: 20,):
                                const Icon(Icons.visibility,
                                  color: Colors.grey,
                                  size: 20,)
                            )
                        ),
                      );
                    }
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){

                  }, child:
                  const Text('forgot password?', style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),),)

                ],
              ),
              Container(
                height: 7.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0.sp),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)
                    ),
                    backgroundColor: AppColors.mainColor,
                    disabledForegroundColor: Colors.transparent.withOpacity(0.38),
                    disabledBackgroundColor: Colors.transparent.withOpacity(0.12),
                    shadowColor: Colors.transparent,),
                  onPressed: (){
                    if(emailController.text.isEmpty){
                      Utils.flushBarErrorMessage('please enter your email address', context,AppColors.mainColor);
                    }else if(passwordController.text.isEmpty){
                      Utils.flushBarErrorMessage('please enter your password', context, AppColors.mainColor);
                    }else{
                      Map data={
                        "email" : emailController.text.trim(),
                        "password" : passwordController.text.trim()
                      };
                      authViewModel.loginApi(data, context);

                    }

                  },
                  child: authViewModel.loading?
                  const Center(child: CircularProgressIndicator(color: Colors.white,)):
                   Center(
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: const Color(0xffffffff),
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
                   Text("Don't have an account?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black
                      )),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, RouteNames.register);
                  }, child:  Text('Signup',
                    style: TextStyle(
                    color: AppColors.mainColor,
                      fontSize: 12.sp,
                  ),)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
