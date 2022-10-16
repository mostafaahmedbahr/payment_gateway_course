import 'package:flutter/material.dart';
import 'package:payment_gateway_course/shared/core/utils/nav_bar.dart';

import 'visa_card_screen.dart';
class ToggleScreen extends StatelessWidget {
  const ToggleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  onTap: (){
                    AppNav.customNavigator(
                        context: context,
                        screen: VisaCardScreen(),
                        finish: false,
                    );
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: const [
                        Image(image: AssetImage("assets/images/visa.jpg"),),
                        Text("pay with visa card"),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){},
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: const [
                      Image(image: AssetImage("assets/images/ref.jpg"),),
                      Text("pay with Ref Code"),
                    ],
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
