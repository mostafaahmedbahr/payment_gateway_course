import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_gateway_course/bloc/cubit.dart';
import 'package:payment_gateway_course/modules/payment/toggle_screen.dart';
import 'package:payment_gateway_course/modules/register/register.dart';
import 'package:payment_gateway_course/shared/network/dio.dart';

void main() async{
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
    );
  }
}
