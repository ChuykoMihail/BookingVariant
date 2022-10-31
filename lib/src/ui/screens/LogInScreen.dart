import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context){
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: myColors.kWhite,
      resizeToAvoidBottomInset: false,
      body:
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: <Widget> [
                  Container(
                    padding: const EdgeInsets.only(top: 46),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  <Widget> [
                        const Image(image: AssetImage('assets/images/image 8.png')),
                        Container(
                            margin: const EdgeInsets.only(left: 14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const <Widget> [
                                Text('АТБ', style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold
                                ),),
                                Text('ТЕРРИТОРИЯ', style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold
                                ),),
                              ],
                            )
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 120),
                    child: TextFormField(
                      cursorColor: myColors.kPrimary,
                      style: const TextStyle(fontSize: 14, fontFamily: 'Robot'),
                      decoration: const InputDecoration(
                          floatingLabelStyle: TextStyle(color: myColors.kTextSecondary),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: myColors.kPrimary
                              )
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: myColors.kPrimary
                              )
                          ),
                          labelText: 'Почта',
                          prefixIcon: Icon(Icons.local_post_office_outlined, color: myColors.kTextSecondary,)
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextFormField(
                      cursorColor: myColors.kPrimary,
                      style: const TextStyle(fontSize: 14, fontFamily: 'Robot'),
                      obscureText: true,
                      decoration: const InputDecoration(
                          floatingLabelStyle: TextStyle(color: myColors.kTextSecondary),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: myColors.kPrimary
                              )
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: myColors.kPrimary
                              )
                          ),
                          labelText: 'Пароль',
                          prefixIcon: Icon(Icons.lock_outline, color: myColors.kTextSecondary,)
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 50.0),
                    child: MaterialButton(
                      onPressed: () {},
                      minWidth: 250,
                      height: 40,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      color: Colors.deepOrange,
                      textColor: Colors.white,
                      child:
                      const Text('Войти',
                        style: TextStyle(
                            fontSize: 18
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 30.0),
                    child: MaterialButton(
                      onPressed: () {},
                      minWidth: 250.w,
                      height: 40.h,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: myColors.kPrimary,width: 2.0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      textColor: myColors.kPrimary,
                      child: const Text('Регистрация',
                        style: TextStyle(
                            fontSize: 18
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}