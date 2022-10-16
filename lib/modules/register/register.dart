import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_gateway_course/bloc/cubit.dart';
import 'package:payment_gateway_course/bloc/states.dart';
import 'package:payment_gateway_course/modules/payment/toggle_screen.dart';
import 'package:payment_gateway_course/shared/components/components.dart';
import 'package:payment_gateway_course/shared/core/utils/nav_bar.dart';
import 'package:payment_gateway_course/shared/style/colors.dart';
class RegisterScreen extends StatelessWidget {
    RegisterScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var emailCon = TextEditingController();
  var passCon = TextEditingController();
  var firstNameCon = TextEditingController();
    var lastNameCon = TextEditingController();
    var price = TextEditingController();
    var phoneCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){
          if(state is PaymentSuccessState)
          {
            AppNav.customNavigator(
                context: context,
                screen: const ToggleScreen(),
                finish: true,
            );
          }
        },
        builder: (context,state)
        {
          var cubit = AppCubit.get(context);
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: defColor,
                title: const Text("Payment"),
                centerTitle: true,
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          // first name
                          defaultFormField(
                            controller: firstNameCon,
                            type: TextInputType.name,
                            validate: (String? value){
                              if(value!.isEmpty)
                              {
                                return "Enter Your First Name ";
                              }
                              return null;
                            },
                            label: "First Name",
                            prefix: Icons.person,
                          ),
                          const SizedBox(height: 20,),
                          // last name
                          defaultFormField(
                            controller: lastNameCon,
                            type: TextInputType.name,
                            validate: (String? value){
                              if(value!.isEmpty)
                              {
                                return "Enter Your Last Name ";
                              }
                              return null;
                            },
                            label: "Last Name",
                            prefix: Icons.person,
                          ),
                          const SizedBox(height: 20,),

                          // email
                          defaultFormField(
                            controller: emailCon,
                            type: TextInputType.emailAddress,
                            validate: (String? value){
                              if(value!.isEmpty)
                              {
                                return "Enter Your email ";
                              }
                              return null;
                            },
                            label: "E-Mail",
                            prefix: Icons.email,
                          ),
                          const SizedBox(height: 20,),

                          // phone
                          defaultFormField(
                            controller: phoneCon,
                            type: TextInputType.phone,
                            validate: (String? value){
                              if(value!.isEmpty)
                              {
                                return "Enter Your phone ";
                              }
                              return null;
                            },
                            label: "Phone Number",
                            prefix: Icons.phone,
                          ),
                          const SizedBox(height: 20,),

                          // price
                          defaultFormField(
                            controller: price,
                            type: TextInputType.number,
                            validate: (String? value){
                              if(value!.isEmpty)
                              {
                                return "Enter The Price ";
                              }
                              return null;
                            },
                            label: "Price",
                            prefix: Icons.price_check,
                          ),
                          const SizedBox(height: 20,),
                          defaultButton(
                              function: ()async{
                                cubit.getFirstToken(
                                    price.text,
                                    emailCon.text,
                                    firstNameCon.text,
                                    lastNameCon.text,
                                    phoneCon.text,
                                );

                              },
                              text: "Go To Pay",
                              radius: 15,
                              width: 200
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
