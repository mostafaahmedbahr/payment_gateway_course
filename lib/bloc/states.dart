abstract class AppStates{}

class InitialState extends AppStates{}

class PaymentLoadingState extends AppStates{}
class PaymentSuccessState extends AppStates{}
class PaymentErrorState extends AppStates{
  String? error;
  PaymentErrorState({this.error});
}

class GetOrderIdLoadingState extends AppStates{}
class GetOrderIdSuccessState extends AppStates{}
class GetOrderIdErrorState extends AppStates{
  String? error;
  GetOrderIdErrorState({this.error});
}

class RequestTokenCardLoadingState extends AppStates{}
class RequestTokenCardSuccessState extends AppStates{}
class RequestTokenCardErrorState extends AppStates{
  String? error;
  RequestTokenCardErrorState({this.error});
}