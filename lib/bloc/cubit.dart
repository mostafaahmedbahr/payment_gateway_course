import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_gateway_course/bloc/states.dart';
import 'package:payment_gateway_course/models/final_token.dart';
import 'package:payment_gateway_course/models/first_token.dart';
import 'package:payment_gateway_course/models/order_id.dart';
import 'package:payment_gateway_course/shared/network/dio.dart';

import '../shared/components/consts.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  FirstToken? firstToken;
  OrderIdModel? orderIdModel;
  FinalToken? finalToken;

  Future getFirstToken(String priceValue,
      String email,
      String firstName ,
      String lstName ,
      String phoneNumber,)async
  {
    emit(PaymentLoadingState());
    DioHelper.postData(
        url: "auth/tokens",
        data: {
          "api_key":payMobApiKey,
        },
    ).then((value)
    {
      payMobFirstToken = value.data['token'];
      print(payMobFirstToken);
      print("----------");
      getOrderId(priceValue, email, firstName, lstName, phoneNumber);
      emit(PaymentSuccessState());
    }).catchError((error)
    {
      emit(PaymentErrorState(error: error.toString()));
      print("error in getFirstToken ");
    });
  }

  Future getOrderId(
      String priceValue,
      String email,
      String firstName ,
      String lstName ,
      String phoneNumber,)async
  {
    emit(GetOrderIdLoadingState());
    DioHelper.postData(
      url: "ecommerce/orders",
      data: {
        "auth_token":payMobFirstToken,
        "delivery_needed": "false",
        "amount_cents": priceValue,
        "currency": "EGP",
        "items":[],
      },
    ).then((value)
    {
      orderId = value.data['id'].toString();
      print(orderId);
      requestTokenCard(priceValue, email, firstName, lstName, phoneNumber);
      print("----------");
      emit(GetOrderIdSuccessState());
    }).catchError((error)
    {
      emit(GetOrderIdErrorState(error: error.toString()));
      print("error in getOrderId ");
    });
  }

  Future requestTokenCard(
      String priceValue,
      String email,
      String firstName ,
      String lstName ,
      String phoneNumber,
      )async
  {
    // emit(RequestTokenCardLoadingState());
    DioHelper.postData(
      url: "acceptance/payment_keys",
      data: {
          "auth_token": payMobFirstToken,
          "amount_cents": priceValue,
          "expiration": 3600,
          "order_id": orderId,
          "billing_data": {
            "apartment": "NA",
            "email": email,
            "floor": "NA",
            "first_name": firstName,
            "street": "NA  ",
            "building": "NA",
            "phone_number":phoneNumber,
            "shipping_method": "NA",
            "postal_code": "NA",
            "city": "NA",
            "country": "NA",
            "last_name":lstName,
            "state": "NA"
          },
          "currency": "EGP",
          "integration_id": integrationIdCard,
          "lock_order_when_paid": "false"
      },
    ).then((value)
    {
      finalTokenCard = value.data['token'].toString();
      print("----------");
      emit(RequestTokenCardSuccessState());
    }).catchError((error)
    {
      emit(RequestTokenCardErrorState(error: error.toString()));
      print("error in RequestTokenCardErrorState ");
    });
  }
}